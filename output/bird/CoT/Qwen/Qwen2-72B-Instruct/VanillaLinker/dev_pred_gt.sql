SELECT MAX(CAST(schools.MealCountFree AS REAL) / schools.TotalEnrollment) as highest_eligible_free_rate FROM schools WHERE schools.CountyName = 'Alameda';	california_schools
SELECT school_name, (Free_Meal_Count__Ages_5_17 / Enrollment__Ages_5_17) AS eligible_free_rate FROM schools WHERE School_Type = 'Continuation' ORDER BY eligible_free_rate ASC LIMIT 3;	california_schools
SELECT Zip FROM schools WHERE `Charter School (Y/N)` = 1 AND `County Office of Education (COE)` LIKE '%Fresno%'	california_schools
SELECT s.mailing_street_address FROM schools AS s JOIN school_demographics AS sd ON s.school_id = sd.school_id WHERE s.grades_offered = 'K-12' ORDER BY sd.frpm_count_k_12 DESC LIMIT 1;	california_schools
SELECT s.PhoneNumber FROM schools AS s JOIN frpm ON s.SchoolCode = frpm.SchoolCode WHERE s.FundingType = 'Directly funded' AND frpm.[Charter School (Y/N)] = 1 AND s.Status = 'Active' AND s.DateOpened > '2000-01-01';	california_schools
{     "chain_of_thought_reasoning": "To answer this question, we need to filter schools based on two conditions: average SAT Math score greater than 400 and exclusively virtual (Virtual = 'F'). However, the provided schema does not include a column for SAT scores or a Virtual column. Since we cannot create an SQL query without these columns, it seems there might be a misunderstanding in the question's requirements based on the given schema.",     "SQL": "" }	california_schools
SELECT s.school_name FROM schools AS s JOIN test_scores AS ts ON s.school_id = ts.school_id WHERE s.Magnet = 1 AND ts.sat_test_takers > 500;	california_schools
SELECT s.phone_number FROM schools AS s JOIN test_scores AS ts ON s.school_id = ts.school_id JOIN sat_scores AS ss ON ts.test_score_id = ss.test_score_id WHERE ss.total > 1500 GROUP BY s.school_id ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT sd.SAT_takers FROM schools AS s JOIN school_details AS sd ON s.school_id = sd.school_id WHERE s.grade_levels = 'K-12' ORDER BY s.frpm_count DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM schools WHERE sat_math_avg > 560 AND funding_type = 'Directly funded';	california_schools
SELECT s.frpm_5_17 FROM schools AS s JOIN (SELECT ts.school_id, AVG(ts.reading) AS avg_reading_score FROM test_scores AS ts GROUP BY ts.school_id ORDER BY avg_reading_score DESC LIMIT 1) AS highest_reading ON s.id = highest_reading.school_id	california_schools
SELECT Code FROM schools WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS Highest_Eligible_Free_Rate FROM `schools` WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;	california_schools
SELECT s.Phone FROM schools AS s JOIN sat AS t ON s.SchCode = t.SchCode ORDER BY CAST(t.NumGE1500 AS REAL) / t.NumTstTakr DESC LIMIT 3;	california_schools
SELECT nces_id FROM schools LIMIT 5;	california_schools
SELECT s.district_name, AVG(sc.reading) AS avg_reading_score FROM scores sc JOIN schools s ON sc.school_id = s.school_id WHERE s.status = 'Active' GROUP BY s.district_name ORDER BY avg_reading_score DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM schools JOIN test_takers ON schools.school_id = test_takers.school_id WHERE schools.county = 'Alameda' AND test_takers.num_test_takers < 100;	california_schools
SELECT s.charter_number, AVG(sc.writing) AS avg_writing_score FROM schools s JOIN scores sc ON s.charter_number = sc.charter_number WHERE sc.writing > 499 GROUP BY s.school_name ORDER BY avg_writing_score DESC;	california_schools
SELECT COUNT(*) FROM schools WHERE county = 'Fresno' AND funding_type = 'Directly funded';	california_schools
SELECT s.phone_number FROM schools AS s JOIN scores_math AS sm ON s.id = sm.school_id JOIN (SELECT school_id, AVG(score) AS avg_score FROM scores_math GROUP BY school_id) AS a ON sm.school_id = a.school_id WHERE a.avg_score = (SELECT MAX(avg_score) FROM (SELECT school_id, AVG(score) AS avg_score FROM scores_math GROUP BY school_id))	california_schools
SELECT COUNT(*) FROM schools WHERE county = 'Amador' AND low_grade = 9 AND high_grade = 12;	california_schools
SELECT COUNT(*) FROM schools WHERE city = 'Los Angeles' AND (free_meals + reduced_price_meals) BETWEEN 500 AND 700 AND grade_levels = 'K-12';	california_schools
SELECT s.school_name, COUNT(tt.student_id) AS num_test_takers FROM schools s JOIN test_takers tt ON s.id = tt.school_id WHERE s.county = 'Contra Costa' GROUP BY s.school_name ORDER BY num_test_takers DESC LIMIT 1;	california_schools
SELECT Name, CONCAT(Address, ', ', City, ', ', State, ' ', Zip_Code) AS Full_Address FROM schools WHERE ABS(Enrollment_K_12 - Enrollment_Ages_5_17) > 30;	california_schools
SELECT s.name FROM schools s JOIN test_scores ts ON s.school_id = ts.school_id WHERE (s."Free Meal Count (K-12)" / s."Total (Enrollment (K-12))") > 0.1 AND ts.test_score >= 1500;	california_schools
SELECT s.county, s.school_name, s.funding_type FROM schools AS s WHERE s.county = 'Riverside' AND (SELECT AVG(sat_math) FROM test_scores WHERE test_scores.school_id = s.id) > 400;	california_schools
SELECT school_name, CONCAT_WS(', ', street_address, city, state, zip_code) AS full_communication_address FROM schools WHERE county = 'Monterey' AND school_type = 'HS' AND free_or_reduced_price_meals > 800;	california_schools
SELECT s.school_name, AVG(sc.score_value) AS avg_writing_score, s.communication_number FROM schools s JOIN scores sc ON s.school_id = sc.school_id JOIN school_scores ss ON s.school_id = ss.school_id AND sc.score_id = ss.score_id WHERE (s.open_date > '1991-01-01' OR s.close_date < '2000-01-01') AND sc.subject_name = 'Writing' GROUP BY s.school_id, s.communication_number;	california_schools
SELECT Name, DOCTYPE FROM (SELECT Name, DOCTYPE, (Enrollment_K_12 - Enrollment_Ages_5_17) AS diff FROM schools WHERE Funding_Type = 'Locally funded') AS temp WHERE temp.diff > (SELECT AVG(diff) FROM (SELECT (Enrollment_K_12 - Enrollment_Ages_5_17) AS diff FROM schools WHERE Funding_Type = 'Locally funded'))	california_schools
SELECT s.date_opened FROM schools AS s WHERE s.grades_offered = 'K-12' AND s.enrollment = (SELECT MAX(schools.enrollment) FROM schools WHERE schools.grades_offered = 'K-12');	california_schools
SELECT T2.city, SUM(T1.enrollment) AS total_enrollment FROM schools AS T1 JOIN school_locations AS T2 ON T1.school_id = T2.school_id WHERE T1.grade_low <= 1 AND T1.grade_high >= 12 GROUP BY T2.city ORDER BY total_enrollment ASC LIMIT 5;	california_schools
SELECT school_name, (free_meal_count_k_12 / enrollment_k_12) AS eligible_free_rate FROM schools ORDER BY enrollment_k_12 DESC LIMIT 2 OFFSET 9;	california_schools
SELECT name, (FRPM_Count_K_12 / Enrollment_K_12) AS Eligible_Free_Reduced_Price_Meal_Rate FROM schools WHERE grades_offered = 'K-12' AND ownership_code = 66 ORDER BY FRPM_Count_K_12 DESC LIMIT 5;	california_schools
{     "chain_of_thought_reasoning": "To answer this question, we need to select the school name and website address from the 'schools' table. The condition given is that the free meal count should be between 1900 and 2000 for students aged 5-17. However, there are no columns in the provided schema that directly indicate student age or a specific range of ages. Similarly, there's no column explicitly mentioning 'free meals' or any numerical value that could correspond to such counts. Given this lack of direct correlation and considering the examples provided do not include these specifics either, we can infer that the conditions given might be misaligned with the available data schema. Therefore, a direct SQL query based on those conditions cannot be formulated from the information at hand.",     "SQL": "" }	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS free_rate FROM schools WHERE Principal = 'Kacey Gibson';	california_schools
SELECT s.Administrator_Email FROM schools AS s JOIN charters AS c ON s.School_Code = c.School_Code WHERE c.[Charter School (Y/N)] = 1 ORDER BY s.[Enrollment (K-12)] ASC LIMIT 1;	california_schools
SELECT T3.first_name, T3.last_name FROM schools AS T1 JOIN school_administrators AS T2 ON T1.school_id = T2.school_id JOIN SAT_scores AS T3 ON T1.school_id = T3.school_id WHERE T3.NumGE1500 > 0;	california_schools
SELECT T1.StreetAddress AS Street, T1.City, T1.State, T1.ZipCode FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T1.Status = 'Active' ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr LIMIT 1;	california_schools
SELECT school_name, webpage FROM schools WHERE county = 'Los Angeles';	california_schools
SELECT AVG(T3.test_takers) FROM schools AS T1 JOIN school_districts AS T2 ON substring(T1.cds_code, 5, 2) = T2.county_code AND substring(T1.cds_code, 7, 4) = T2.district_code JOIN test_scores AS T3 ON T1.school_id = T3.school_id WHERE T1.county_name = 'Fresno' AND substring(T1.opened, 1, 4) = '1980';	california_schools
SELECT s.telephone FROM schools AS s JOIN districts AS d ON s.district_id = d.id JOIN test_scores AS ts ON s.id = ts.school_id GROUP BY s.id, d.name HAVING d.name = 'Fresno Unified' ORDER BY AVG(ts.reading) ASC LIMIT 1;	california_schools
SELECT s.Name FROM schools AS s JOIN scores AS sc ON s.School_ID = sc.School_ID WHERE s.Virtual = 'F' GROUP BY s.County, s.Name ORDER BY s.County, AVG(sc.Reading_Score) DESC LIMIT 5;	california_schools
SELECT s.type_of_education FROM schools AS s JOIN (SELECT school_id, AVG(math) AS avg_math FROM scores GROUP BY school_id ORDER BY avg_math DESC LIMIT 1) AS t ON s.school_id = t.school_id;	california_schools
SELECT s.AvgScrMath, c.CountyName FROM schools AS s JOIN counties AS c ON s.CountyCode = c.CountyCode WHERE s.SchoolID IN (SELECT SchoolID FROM(SELECT SchoolID, SUM(AvgScrMath + AvgScrRead + AvgScrWrite) as total_score FROM schools GROUP BY SchoolID ORDER BY total_score ASC LIMIT 1))	california_schools
SELECT s.city, AVG(ts.writing) AS avg_writing_score FROM schools AS s JOIN test_scores AS ts ON s.school_id = ts.school_id WHERE (ts.critical_reading + ts.mathematics + ts.writing) >= 1500 GROUP BY ts.school_id ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT s.school_name, AVG(sc.writing) AS avg_writing_score FROM schools s JOIN administrators a ON s.principal_email = a.email JOIN scores sc ON s.school_code = sc.school_code WHERE a.first_name = 'Ricci' AND a.last_name = 'Ulrich' GROUP BY s.school_name;	california_schools
SELECT name FROM schools WHERE DOC = '31' AND grade_levels_offered LIKE '%K%' AND grade_levels_offered LIKE '%12%' ORDER BY enrollees DESC LIMIT 1;	california_schools
SELECT CAST(COUNT(*) AS REAL) / 12 FROM schools WHERE CNTYCD = '01' AND DISTCD = '52' AND strftime('%Y', ESTD) = '1980';	california_schools
SELECT CAST(COUNT(CASE WHEN T1.DOC = 54 THEN 1 END) AS REAL) / COUNT(CASE WHEN T1.DOC = 52 THEN 1 END) FROM schools AS T1 JOIN county_names AS T2 ON T1.CNTRY = T2.CNTRY WHERE T2.county_name = 'Orange' AND T1.MERGED = 'Merged';	california_schools
SELECT County, Name, ClosureDate FROM (SELECT County, Name, ClosureDate, ROW_NUMBER() OVER(PARTITION BY County ORDER BY COUNT(*) DESC) AS rn FROM schools WHERE StatusType = 'Closed' GROUP BY County) WHERE rn = 1;	california_schools
SELECT s.postal_street_address FROM schools AS s JOIN math_scores AS ms ON s.school_id = ms.school_id ORDER BY ms.math_average DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.mailing_street_address, sp.school_name FROM schools AS s JOIN (SELECT sp.school_id, AVG(sp.reading_score) AS avg_reading_score FROM school_performance AS sp GROUP BY sp.school_id ORDER BY avg_reading_score ASC LIMIT 1) AS lowest_reading_school ON s.id = lowest_reading_school.school_id	california_schools
SELECT COUNT(*) FROM schools WHERE (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500 AND MailingCity = 'Lakeport';	california_schools
SELECT COUNT(*) FROM test_takers JOIN schools ON test_takers.school_code = schools.school_code WHERE schools.mailing_city = 'Fresno';	california_schools
SELECT `School Name`, `Mailing Zip` FROM `schools` WHERE `Principal` = 'Avetik Atoian';	california_schools
SELECT CAST(SUM(CASE WHEN T2.county = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.county = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM schools AS T1 JOIN school_details AS T2 ON T1.school_id = T2.school_id WHERE T1.mailing_state = 'CA';	california_schools
SELECT COUNT(*) FROM schools WHERE school_address_city = 'San Joaquin' AND mailing_state_address = 'CA' AND status = 'Active';	california_schools
SELECT s.phone_number, s.extension FROM schools AS s JOIN scores AS sc ON s.school_id = sc.school_id WHERE sc.subject = 'Writing' ORDER BY sc.average DESC LIMIT 1 OFFSET 332;	california_schools
SELECT phone_number, extension_number, school_name FROM schools WHERE zip_code = '95203-3704';	california_schools
SELECT website FROM `schools` WHERE principal_name = 'Mike Larson' OR principal_name = 'Dante Alvarez';	california_schools
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1;	california_schools
SELECT COUNT(*) FROM schools AS s JOIN school_counties AS sc ON s.CountyCode = sc.CountyCode WHERE s.Charter = 0 AND sc.CountyName = 'Los Angeles' AND (s."Free Meal Count (K-12)" * 100.0 / s."Enrollment (K-12)") < 0.18;	california_schools
SELECT first_name, last_name AS administrator, school_name, city FROM schools WHERE Charter = 1 AND `charter no` = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailingCity = 'Hickman' AND CharterNumber = '00D4';	california_schools
SELECT CAST(COUNT(CASE WHEN funding_type = 'Locally funded' THEN school_id ELSE NULL END) AS REAL) * 100 / COUNT(school_id) AS ratio_percentage FROM schools WHERE county = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools WHERE DateOpened BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus' AND FundingType = 'Directly funded';	california_schools
{     "chain_of_thought_reasoning": "The question asks for the total amount of Community College District closure in 1989 in the city of San Francisco. However, based on the provided schema and examples, there is no direct column or table that indicates 'closure' specifically for a 'Community College District'. The examples given are for schools, not districts, and do not include any information about closures or years. Therefore, it's impossible to construct an SQL query with the given data schema that would answer this question.",     "SQL": "" }	california_schools
SELECT County FROM schools WHERE SOC = '11' AND Status = 'Closed' AND strftime('%Y', Date_Closed) BETWEEN '1980' AND '1989' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT nces_id FROM schools WHERE soc = 31;	california_schools
SELECT COUNT(*) FROM schools WHERE status = 'Active' OR status = 'Closed' AND school_type = 'District Community Day School' AND county = 'Alpine';	california_schools
SELECT district_code FROM schools WHERE magnet = 0 AND city = 'Fresno';	california_schools
SELECT SUM(e.enrollment) AS total_enrollment FROM schools s JOIN enrollments e ON s.school_id = e.school_id WHERE s.city = 'Fremont' AND s.EdOpsCode = 'SSS' AND e.academic_year = 2014 AND e.age >= 5 AND e.age <= 17;	california_schools
SELECT meal_count_5_to_17 FROM schools WHERE school_name = 'Youth Authority School' AND mailing_street_address = 'PO Box 1040';	california_schools
SELECT MIN(s.low_grade) FROM schools s JOIN districts d ON s.district_id = d.id WHERE s.EdOpsCode = 'SPECON' AND d.NCES_district_id = '0613360';	california_schools
SELECT school_name, educational_level_name FROM schools WHERE breakfast_provision_2 IS NOT NULL AND county_code = '37';	california_schools
SELECT City FROM schools WHERE EILCode = 'HS' AND LunchProvision = '02' AND LowGrade = 9 AND HighGrade = 12 AND County = 'Merced';	california_schools
SELECT s.School_Name, (sd.FRPM_Count_Ages_5_17 / sd.Enrollment_Ages_5_17 * 100) AS Percent_Eligible_FRPM FROM schools s JOIN school_demographics sd ON s.School_ID = sd.School_ID WHERE s.County = 'Los Angeles' AND s.Grades_Offered_Low = 'K' AND s.Grades_Offered_High >= '9';	california_schools
SELECT grade_span_served, COUNT(*) AS count FROM schools WHERE city = 'Adelanto' GROUP BY grade_span_served ORDER BY count DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS num_schools FROM schools WHERE Virtual = 'F' AND City IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY num_schools DESC LIMIT 1;	california_schools
SELECT `School Name`, `Latitude` FROM schools WHERE `Latitude` = (SELECT MAX(`Latitude`) FROM schools);	california_schools
SELECT T1.city, MIN(T2.grade) AS lowest_grade, T1.school_name FROM schools AS T1 JOIN (SELECT school_id, MIN(grade) as grade FROM grades GROUP BY school_id) AS T2 ON T1.school_id = T2.school_id WHERE T1.state = 'CA' ORDER BY T1.latitude ASC LIMIT 1;	california_schools
SELECT s.grade_span_offered FROM (SELECT MAX(abs(longitude)) as max_longitude FROM schools) AS max_lon JOIN schools s ON abs(s.longitude) = max_lon.max_longitude;	california_schools
SELECT City, COUNT(*) AS School_Count FROM schools WHERE Grade_Span = 'K-8' AND Magnet = 1 AND `NSLP Provision Status` = 'Multiple Provision Types' GROUP BY City;	california_schools
SELECT admin_first_name, district_name FROM (SELECT admin_first_name, district_name, COUNT(*) as count FROM schools GROUP BY admin_first_name) ORDER BY count DESC LIMIT 2;	california_schools
SELECT s.DistrictCode, (s.FreeMealCountK_12 / s.EnrollmentK_12 * 100) AS Percent_Eligible_Free FROM schools s JOIN school_administrators sa ON s.SchoolAdministratorID = sa.SchoolAdministratorID WHERE sa.FirstName = 'Alusine';	california_schools
SELECT admin_last_name, district, county, school_name FROM schools WHERE charter_number = 40;	california_schools
SELECT AdministratorEmail FROM schools WHERE County = 'San Bernardino' AND `School District Name` = 'San Bernardino City Unified' AND DateOpened >= '2009-01-01' AND DateOpened <= '2010-12-31' AND (SOC = 62 OR DOC = 54);	california_schools
SELECT s.admin_email FROM schools AS s JOIN test_scores AS ts ON s.school_code = ts.school_code WHERE ts.test_name = 'SAT' AND ts.score >= 1500 GROUP BY ts.school_code ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM account JOIN trans ON account.account_id = trans.account_id JOIN client ON account.client_id = client.client_id WHERE trans.type = 'POPLATEK PO OBRATU' AND client.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT A1) FROM `account` WHERE A3 = 'Prague';	financial
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM account;	financial
SELECT COUNT(DISTINCT T1.district) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' GROUP BY T1.district HAVING AVG(T2.salary) BETWEEN 6000 AND 10000;	financial
SELECT COUNT(*) FROM customer AS T1 INNER JOIN account AS T2 ON T1.customer_id = T2.customer_id WHERE T1.gender = 'M' AND T1.region = 'A3' AND T2.A11 > 8000;	financial
WITH oldest_female AS (     SELECT * FROM person      WHERE gender = 'F'      ORDER BY birthdate ASC LIMIT 1 ), account_numbers AS (     SELECT account_id FROM account      WHERE client_id IN (SELECT client_id FROM oldest_female) ), lowest_avg_salary AS (     SELECT MIN(A11) AS min_avg_salary FROM account      WHERE account_id IN (SELECT account_id FROM account_numbers) ), highest_avg_salary AS (     SELECT MAX(A11) AS max_avg_salary FROM account ) SELECT T3.max_avg_salary - T2.min_avg_salary AS salary_gap FROM oldest_female AS T1 JOIN account_numbers AS T2 ON T1.client_id = T2.client_id  JOIN lowest_avg_salary AS T3 JOIN highest_avg_salary AS T4;	financial
SELECT a.account_number FROM account AS a JOIN client AS c ON a.client_id = c.client_id WHERE (c.birthdate = (SELECT MIN(birthdate) FROM client)) OR (c.avg_salary = (SELECT MAX(avg_salary) FROM client))	financial
SELECT COUNT(*) FROM `account` JOIN `customer` ON `account`.`customer_id` = `customer`.`customer_id` WHERE `account`.`statement_issuance` = 'POPLATEK TYDNE' AND `customer`.`relationship_type` = 'Owner';	financial
SELECT DISTINCT c.client_id FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN trans AS t ON a.account_id = t.account_id WHERE t.type = 'POPLATEK PO OBRATU';	financial
SELECT T1.account_id FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id JOIN `trans` AS T3 ON T1.account_id = T3.account_id WHERE strftime('%Y', T2.date) = '1997' AND T3.type = 'POPLATEK TYDNE' ORDER BY T2.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.client_id = c.client_id JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND strftime('%Y', a.account_open_date) = '1993' ORDER BY l.approved_amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM `client` JOIN `address` ON `client`.address_id = `address`.address_id WHERE `client`.gender = 'F' AND strftime('%Y', `client`.birth_date) < '1950' AND `address`.city = 'Sokolov';	financial
SELECT account_id FROM trans WHERE strftime('%Y', date) = '1995' ORDER BY date ASC LIMIT 1;	financial
SELECT * FROM account WHERE opening_date < '1997-01-01' AND balance > 3000;	financial
SELECT client_id FROM card WHERE valid_from = '1994-03-03';	financial
SELECT a.opening_date FROM `account` AS a JOIN `trans` AS t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14';	financial
SELECT b.district_id FROM branch AS b JOIN account AS a ON b.branch_id = a.branch_id JOIN loan AS l ON a.account_id = l.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(T3.amount) FROM `card` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `trans` AS T3 ON T2.account_id = T3.account_id WHERE T1.card_opening_date = '1996-10-21';	financial
SELECT T4.gender FROM `account` AS T1 JOIN `client` AS T2 ON T1.client_id = T2.client_id JOIN `branch` AS T3 ON T1.branch_id = T3.branch_id JOIN `client` AS T4 ON T2.client_id = T4.client_id WHERE T3.A11 = (SELECT MAX(A11) FROM `branch`) AND T2.birthdate = (SELECT MIN(birthdate) FROM `client` WHERE branch_id IN (SELECT branch_id FROM `account` WHERE branch_id IN (SELECT branch_id FROM `branch` WHERE A11 = (SELECT MAX(A11) FROM `branch`)))));	financial
SELECT t.amount FROM (SELECT * FROM loan ORDER BY amount DESC LIMIT 1) AS l JOIN account ON l.account_id = account.account_id JOIN trans AS t ON t.account_id = account.account_id WHERE t.trans_id IN (SELECT MIN(trans_id) FROM trans WHERE account_id = l.account_id);	financial
SELECT COUNT(*) FROM `client` JOIN `account` ON `client.client_id` = `account.client_id` WHERE `branch_name` = 'Jesenik' AND `gender` = 'F';	financial
SELECT c.disposition FROM `client` AS c JOIN `account` AS a ON c.client_id = a.client_id JOIN `trans` AS t ON a.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(account_id) FROM account WHERE A2 = 'Litomerice' AND date_open BETWEEN '1996-01-01' AND '1996-12-31';	financial
SELECT A2 FROM client JOIN account ON client.client_id = account.client_id WHERE gender = 'F' AND birth_date = '1976-01-29';	financial
SELECT T1.birth_date FROM `client` AS T1 JOIN `account` AS T2 ON T1.client_id = T2.client_id JOIN `loan` AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 98832 AND T3.date = '1996-01-03';	financial
SELECT MIN(account_id) FROM account WHERE region = 'A3';	financial
SELECT CAST(SUM(CASE WHEN A2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(A2.gender) FROM (SELECT B.branch_id, B.region_name, B.inhabitants FROM branch AS B WHERE B.region_name = 'South Bohemia' ORDER BY B.inhabitants DESC LIMIT 1) AS A1 JOIN client AS A2 ON A2.branch_id = A1.branch_id;	financial
SELECT ((t.balance - t2.balance) / t2.balance) * 100.0 AS increase_rate FROM (SELECT account_id, MAX(balance) as balance FROM trans WHERE date <= '1998-12-27' GROUP BY account_id) t JOIN (SELECT account_id, MIN(balance) as balance FROM trans WHERE date >= '1993-03-22' AND date <= '1993-07-05' GROUP BY account_id) t2 ON t.account_id = t2.account_id WHERE EXISTS(SELECT 1 FROM loan l WHERE l.client_id IN (SELECT client_id FROM client WHERE account_id = t.account_id) AND l.date_approved = '1993-07-05') LIMIT 1;	financial
SELECT CAST(SUM(CASE WHEN T2.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1 JOIN contract AS T2 ON T1.contract_id = T2.contract_id;	financial
SELECT CAST(COUNT(DISTINCT CASE WHEN T2.amount < 100000 AND T2.status = 'C' THEN T1.account_id END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id;	financial
SELECT A.account_id, D.district_name, D.region FROM account AS A JOIN statement AS S ON A.account_id = S.account_id JOIN district AS D ON A.district_code = D.district_code WHERE strftime('%Y', A.date_of_account_creation) = '1993' AND S.type = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, COUNT(s.statement_id) AS frequency FROM `account` a JOIN client c ON a.client_id = c.client_id JOIN statement s ON a.account_id = s.account_id WHERE c.region = 'east Bohemia' AND s.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY a.account_id;	financial
SELECT T1.account_id, T1.opening_date FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_code = T3.district_code WHERE T3.A2 = 'Prachatice';	financial
SELECT T2.district, T2.region FROM `loan` AS T1 INNER JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T1.loan_id = 4990;	financial
SELECT T2.account_id, T4.district_name, T5.region_name FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN customer AS T3 ON T2.customer_id = T3.customer_id JOIN district AS T4 ON T3.district_id = T4.district_id JOIN region AS T5 ON T3.region_id = T5.region_id WHERE T1.amount > 300000;	financial
SELECT T1.loan_id, T3.district, T3.avg_salary FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_code = T3.district_code WHERE T1.duration = 60;	financial
SELECT a.district, u.state, ((u.unemployment_rate_1996 - u.unemployment_rate_1995) / u.unemployment_rate_1995) * 100 AS unemployment_increment FROM account a JOIN loan l ON a.account_id = l.account_id JOIN unemployment u ON a.state = u.state WHERE l.status = 'D';	financial
SELECT CAST(SUM(CASE WHEN T2.district = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM `account` AS T1 JOIN A2 AS T2 ON T1.branch_id = T2.branch_id WHERE strftime('%Y', T1.date_opened) = '1993';	financial
SELECT DISTINCT(account_id) FROM account WHERE statement_issuance = 'POPLATEK MESICNE';	financial
SELECT A2 AS District, COUNT(*) AS FemaleAccountHolders FROM account JOIN client ON account.client_id = client.client_id WHERE gender = 'F' GROUP BY District ORDER BY FemaleAccountHolders DESC LIMIT 9;	financial
SELECT C.A2 AS District_Name, SUM(T.amount) AS Total_Withdrawals FROM trans T JOIN account A ON T.account_id = A.account_id JOIN client CL ON A.client_id = CL.client_id JOIN address AD ON CL.address_id = AD.address_id JOIN city CT ON AD.city_id = CT.city_id JOIN district D ON CT.district_id = D.district_id JOIN country CO ON D.country_id = CO.country_id WHERE T.type = 'VYDAJ' AND strftime('%Y-%m', T.date) = '1996-01' GROUP BY C.A2 ORDER BY Total_Withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) FROM `account` AS a JOIN client AS c ON a.client_id = c.client_id JOIN address AS ad ON c.address_id = ad.address_id LEFT JOIN credit_card AS cc ON a.account_id = cc.account_id WHERE ad.region = 'South Bohemia' AND cc.card_number IS NULL;	financial
SELECT T2.A3 AS District, SUM(T1.amount) AS TotalActiveLoan FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status IN ('C', 'D') GROUP BY T2.A3 ORDER BY TotalActiveLoan DESC LIMIT 1;	financial
SELECT AVG(l.loan_amount) FROM `loan` l JOIN `account` a ON l.account_id = a.account_id WHERE a.gender = 'M';	financial
SELECT branch.branch_location, branch.district_name FROM branch JOIN unemployment ON branch.district_id = unemployment.district_id WHERE unemployment.year = 1996 ORDER BY unemployment.unemployment_rate DESC LIMIT 1;	financial
SELECT COUNT(*) AS num_accounts FROM `account` WHERE `branch_id` = (SELECT T1.branch_id FROM `branch` AS T1 JOIN `crime` AS T2 ON T1.branch_id = T2.branch_id WHERE strftime('%Y', T2.date) = '1996' GROUP BY T1.branch_id ORDER BY COUNT(*) DESC LIMIT 1);	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN credit_card AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T3.type = 'VYBER KARTOU' AND T2.frequency = 'POPLATEK MESICNE' AND T3.balance < 0;	financial
SELECT COUNT(*) AS loan_count FROM `loan` JOIN `account` ON `loan.account_id` = `account.account_id` JOIN `statement_issuance_frequency` ON `account.statement_issuance_frequency_id` = `statement_issuance_frequency.statement_issuance_frequency_id` WHERE `loan.amount` >= 250000 AND `loan.date` BETWEEN '1995-01-01' AND '1997-12-31' AND `statement_issuance_frequency.frequency` = 'POPLATEK MESICNE' GROUP BY `account.account_id`;	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.branch_id = 1 AND loan.status = 'C';	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND branch_id = (SELECT branch.branch_id FROM branch WHERE branch.A15 = (SELECT MAX(A15) FROM branch WHERE A15 < (SELECT MAX(A15) FROM branch)))	financial
SELECT COUNT(*) FROM credit_card JOIN account ON credit_card.account_id = account.account_id WHERE credit_card.card_type_code = 'GOLD' AND account.disposition = 'OWNER';	financial
SELECT COUNT(account_id) FROM account WHERE A2 = 'Pisek';	financial
SELECT T3.district FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN customer AS T3 ON T2.customer_id = T3.customer_id WHERE strftime('%Y', T1.date) = '1997' AND T1.amount > 10000;	financial
SELECT a.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id WHERE o.k_symbol = 'SIPO' AND a.city = 'Pisek';	financial
SELECT * FROM account WHERE card_type = 'G';	financial
SELECT strftime('%m', T.date) AS month, AVG(T.amount) AS avg_amount FROM trans T JOIN account A ON T.account_id = A.account_id WHERE T.type = 'VYBER' AND T.operation = 'KARTOU' AND strftime('%Y', T.date) = '2021' GROUP BY month;	financial
SELECT T.account_id FROM (SELECT account_id, amount FROM trans WHERE strftime('%Y', date) = '1998' AND operation = 'VYBER KARTOU') AS T WHERE T.amount < (SELECT AVG(amount) FROM trans WHERE strftime('%Y', date) = '1998');	financial
SELECT c.first_name, c.last_name FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN credit_card AS cc ON a.account_id = cc.account_id JOIN loan AS l ON a.account_id = l.account_id WHERE c.gender = 'F';	financial
SELECT COUNT(*) FROM client JOIN account ON client.client_id = account.client_id JOIN branch ON account.branch_code = branch.branch_code WHERE client.gender = 'F' AND branch.region = 'south Bohemia';	financial
SELECT a.account_id FROM `account` AS a JOIN `client` AS c ON a.client_id = c.client_id WHERE a.A2 = 'OWNER' AND c.district = 'Tabor';	financial
SELECT T1.type FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.income BETWEEN 8001 AND 9000 AND T1.type != 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM `account` AS a JOIN `client` AS c ON a.client_id = c.client_id JOIN `trans` AS t ON a.account_id = t.account_id WHERE c.region = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.name FROM district AS d JOIN account AS a ON d.district_id = a.district_id JOIN trans AS t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) FROM `crime` WHERE A15 > 4000 AND A3 IN (SELECT A3 FROM `account` WHERE strftime('%Y', date_opened) >= '1997');	financial
SELECT COUNT(*) FROM card JOIN account ON card.account_id = account.account_id WHERE card.card_type = 'CLASSIC' AND account.account_type = 'OWNER';	financial
SELECT COUNT(*) FROM `client` JOIN `address` ON `client.address_id` = `address.address_id` WHERE `gender` = 'M' AND `A2` = 'Hl.m. Praha';	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND strftime('%Y', issued) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card;	financial
SELECT c.name FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN loan AS l ON a.account_id = l.account_id ORDER BY l.amount DESC LIMIT 1;	financial
SELECT a15.crimes_1995 FROM a15 JOIN account ON a15.district = account.district WHERE account.account_id = 532;	financial
SELECT a.district_id FROM `account` AS a JOIN `order` AS o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.* FROM trans AS t JOIN account AS a ON t.account_id = a.account_id JOIN client AS c ON a.client_id = c.client_id WHERE t.operation = 'VYBER' AND c.client_id = 3356;	financial
SELECT COUNT(*) FROM `account` JOIN `loan` ON `account`.`account_id` = `loan`.`account_id` WHERE `account`.`frequency` = 'POPLATEK TYDNE' AND `loan`.`amount` < 200000;	financial
SELECT cc.type FROM credit_card AS cc JOIN client AS c ON cc.client_id = c.id WHERE c.id = 13539;	financial
SELECT A3 FROM `client` WHERE id = 3541;	financial
SELECT a.district FROM `account` AS a JOIN loan AS l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY a.district ORDER BY COUNT(a.account_id) DESC LIMIT 1;	financial
SELECT c.first_name, c.last_name FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN `order` AS o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.* FROM trans AS t JOIN account AS a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM `account` JOIN `client` ON `account.client_id` = `client.client_id` WHERE `client.address` LIKE '%Jesenik%'	financial
SELECT c.client_id FROM `credit_card` cc JOIN `client` c ON cc.client_id = c.client_id WHERE cc.card_type = 'junior' AND cc.issue_date >= '1997-01-01';	financial
SELECT CAST(SUM(CASE WHEN C.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS C JOIN account AS A ON C.client_id = A.client_id WHERE A.district IN (SELECT district FROM A11 WHERE average_salary > 10000);	financial
WITH loans_1996 AS (SELECT SUM(amount) AS total_amount_1996 FROM loan JOIN account ON loan.account_id = account.account_id WHERE gender = 'M' AND strftime('%Y', date_from) = '1996'), loans_1997 AS (SELECT SUM(amount) AS total_amount_1997 FROM loan JOIN account ON loan.account_id = account.account_id WHERE gender = 'M' AND strftime('%Y', date_from) = '1997') SELECT ((loans_1997.total_amount_1997 - loans_1996.total_amount_1996) / loans_1996.total_amount_1996 * 100.0) AS growth_rate FROM loans_1996, loans_1997;	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01';	financial
SELECT (SELECT `total` FROM `crime` WHERE `year` = 1996 AND `region` = 'A3') - (SELECT `total` FROM `crime` WHERE `year` = 1996 AND `region` != 'A3');	financial
SELECT COUNT(*) FROM `account` JOIN `disposition` ON `account.account_id` = `disposition.account_id` WHERE `disposition.type` IN ('owner', 'disponent') AND `account.account_id` BETWEEN 1 AND 10;	financial
SELECT COUNT(*) FROM `trans` WHERE account_id = 3 AND k_symbol = 'VYU'; SELECT DISTINCT k_symbol FROM `trans` WHERE amount = -3539;	financial
SELECT strftime('%Y', birth_date) AS birth_year FROM account_owner WHERE owner_id = 130;	financial
SELECT COUNT(*) FROM `account` JOIN `trans` ON `account`.account_id = `trans`.account_id WHERE `account`.disposition = 'DISP' AND `trans`.type = 'PRIJEM' AND `trans`.k_symbol = 'POPLATEK PO OBRATU';	financial
SELECT SUM(T1.amount) AS debt, (SELECT SUM(amount) FROM trans WHERE account_id IN(SELECT T2.account_id FROM `account` AS T2 JOIN `client` AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 992 AND type = 'VYDAJ' AND operation = 'VRAT Pujcka')) AS payments FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 992;	financial
SELECT MAX(T1.balance), T3.sex FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T2.client_id = 4 AND T1.trans_id <= 851;	financial
SELECT card_type FROM credit_card WHERE client_id = 9;	financial
SELECT SUM(T2.amount) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.client_id = 617 AND strftime('%Y', T2.date) = '1998';	financial
SELECT T1.client_id, T1.name FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN branch AS T3 ON T2.branch_code = T3.branch_code WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T3.location = 'East Bohemia';	financial
SELECT c.client_id FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN loan AS l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.customer_id) FROM `customer` AS c JOIN `account` AS a ON c.account_id = a.account_id JOIN `loan` AS l ON a.account_id = l.account_id JOIN `trans` AS t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND l.type = 'H' AND t.amount > 4000 AND t.k_symbol = 'SIPO';	financial
SELECT COUNT(*) FROM account WHERE opened > '1996-01-01' AND location = 'Beroun';	financial
SELECT COUNT(*) FROM customer AS T1 JOIN account AS T2 ON T1.customer_id = T2.customer_id WHERE T1.gender = 'F' AND T2.card_type_code = 'JUNIOR';	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.branch_code = 'A3';	financial
SELECT CAST(COUNT(CASE WHEN T2.gender = 'M' THEN 1 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.statement_type = 'POPLATEK TYDNE';	financial
SELECT COUNT(*) FROM `client` JOIN `account` ON `client`.`client_id` = `account`.`client_id` WHERE `account`.`Frequency` = 'POPLATEK TYDNE' AND `account`.`Type` = 'Vlastnik';	financial
SELECT T1.account_id FROM `account` AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T2.validity > 24 AND strftime('%Y', T1.date) < '1997' ORDER BY T2.approved ASC LIMIT 1;	financial
SELECT T3.account_number FROM client AS T1 JOIN A11 AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T1.client_id = T3.client_id WHERE T1.gender = 'F' AND T1.birth_date = (SELECT MIN(`birth_date`) FROM `client` WHERE gender = 'F') ORDER BY T2.avg_salary ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client WHERE A3 = 'East Bohemia' AND strftime('%Y', A4) = '1920';	financial
SELECT COUNT(*) FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.duration = 24 AND account.statement_frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(T1.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE (T1.status = 'C' OR T1.status = 'D') AND T3.type = 'POPLATEK PO OBRATU';	financial
SELECT client_id, district FROM client WHERE account_type = 'owner';	financial
SELECT T1.client_id, T1.age FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.client_id JOIN disp AS T3 ON T2.account_id = T3.account_id WHERE T2.type = 'gold' AND T3.type = 'OWNER';	financial
SELECT bond_type, COUNT(*) as count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.element = 'cl';	toxicology
SELECT AVG(oxygen_count) FROM (SELECT COUNT(*) AS oxygen_count FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE atom.element = 'o' AND connected.bond_id IN (SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '+') GROUP BY connected.bond_id) AS avg_oxygen	toxicology
SELECT CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+'	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-'	toxicology
SELECT m.molecule_id FROM `bond` b JOIN `molecule` m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#' ;	toxicology
SELECT COUNT(*) FROM `atom` WHERE `element` != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(m.label) DESC LIMIT 1;	toxicology
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id JOIN bond AS b ON a1.molecule_id = b.molecule_id JOIN molecule AS m ON a1.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')	toxicology
SELECT DISTINCT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element != 'sn';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-';	toxicology
SELECT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' GROUP BY a.atom_id;	toxicology
SELECT a.atom_id, c.atom_id2 FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR181';	toxicology
SELECT CAST(SUM(CASE WHEN a.element != 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3;	toxicology
SELECT a.atom_id, a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR001_2_6' AND a.molecule_id = 'TR001';	toxicology
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT DISTINCT T1.bond_id FROM connected AS T1 WHERE T1.atom_id2 = 'TR000_2';	toxicology
SELECT DISTINCT T2.label FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' ORDER BY T2.label ASC LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / (SELECT COUNT(*) FROM molecule) as percent FROM molecule WHERE label = '+'	toxicology
SELECT ROUND(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 100 / COUNT(atom_id), 4) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT T1.bond_type FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR000';	toxicology
SELECT atom.element, molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR060';	toxicology
SELECT b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR010' GROUP BY b.bond_type ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE m.label = '-' AND b.bond_type = '-' GROUP BY m.molecule_id ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT b.bond_id FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR006' ORDER BY b.bond_id LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12') AND atom.molecule_id = 'TR009';	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'br' AND T2.label = '+'	toxicology
SELECT T2.bond_type, T1.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#' GROUP BY molecule_id;	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.atom_id2 = T3.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T3.label = '+'	toxicology
SELECT b.bond_id FROM (SELECT a1.atom_id AS atom_id_p, c1.bond_id FROM atom AS a1 JOIN connected AS c1 ON a1.atom_id = c1.atom_id WHERE a1.element = 'p') AS p_bonds JOIN (SELECT a2.atom_id AS atom_id_n, c2.bond_id FROM atom AS a2 JOIN connected AS c2 ON a2.atom_id = c2.atom_id WHERE a2.element = 'n') AS n_bonds ON p_bonds.bond_id = n_bonds.bond_id JOIN bond AS b ON p_bonds.bond_id = b.bond_id;	toxicology
SELECT m.label FROM (SELECT b.molecule_id, COUNT(*) AS num_double_bonds FROM bond AS b WHERE b.bond_type = ' = ' GROUP BY b.molecule_id ORDER BY num_double_bonds DESC LIMIT 1) AS mb JOIN molecule AS m ON mb.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT CAST(COUNT(T3.bond_id) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T1.element = 'i';	toxicology
SELECT T3.bond_type, T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE CAST(SUBSTR(T1.atom_id, 7, 2) AS INTEGER) + 0 = 45;	toxicology
SELECT DISTINCT a.element FROM atom AS a LEFT JOIN connected AS c ON a.atom_id = c.atom_id WHERE c.atom_id2 IS NULL;	toxicology
SELECT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE c.bond_id IN (SELECT b.bond_id FROM bond AS b WHERE b.molecule_id = 'TR041' AND b.bond_type = '#');	toxicology
SELECT a.element FROM `connected` c JOIN `atom` a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id) WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT b.molecule_id FROM (SELECT a.molecule_id, COUNT(*) AS double_bond_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = ' =' GROUP BY a.molecule_id) b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;	toxicology
SELECT a.atom_id, a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb');	toxicology
SELECT DISTINCT A.element FROM atom AS A JOIN connected AS C ON A.atom_id = C.atom_id OR A.atom_id = C.atom_id2 JOIN bond AS B ON C.bond_id = B.bond_id WHERE B.bond_type = '#';	toxicology
WITH atom_combinations AS (SELECT a1.element AS element1, a2.element AS element2, COUNT(*) AS combination_count FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id GROUP BY a1.element, a2.element), most_common_combination AS (SELECT element1, element2 FROM atom_combinations WHERE combination_count = (SELECT MAX(combination_count) FROM atom_combinations)) SELECT CAST(SUM(CASE WHEN a1.element = mcc.element1 AND a2.element = mcc.element2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.bond_id) AS percentage FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id CROSS JOIN most_common_combination mcc;	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'	toxicology
SELECT COUNT(atom_id) FROM atom WHERE element IN ('c', 'h')	toxicology
SELECT c.atom_id2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 's'	toxicology
SELECT DISTINCT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id WHERE (atom.element = 'p' OR atom.element = 'br') AND connected.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#');	toxicology
SELECT b.bond_id FROM `bond` AS b JOIN `molecule` AS m ON b.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT b.molecule_id FROM `bond` AS b JOIN `molecule` AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT b.bond_type FROM `bond` AS b JOIN `molecule` AS m ON b.molecule_id = m.molecule_id WHERE b.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_10_11' UNION SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.element = 'i';	toxicology
SELECT CASE WHEN COUNT(CASE WHEN m.label = '+' THEN 1 END) > COUNT(CASE WHEN m.label = '-' THEN 1 END) THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS most_common_label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca';	toxicology
SELECT COUNT(*) FROM (SELECT DISTINCT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR001_1_8') AS elements WHERE elements.element IN ('cl', 'c') GROUP BY elements.element HAVING COUNT(*) = 2;	toxicology
SELECT DISTINCT a.molecule_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-' INTERSECT SELECT DISTINCT c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' LIMIT 2;	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' GROUP BY b.molecule_id LIMIT 1 OFFSET 0;	toxicology
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_type = '-';	toxicology
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE substr(a.atom_id, 7, 1) = '4' AND m.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) AS ratio, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006';	toxicology
SELECT m.label FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';	toxicology
SELECT b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 'c' GROUP BY b.bond_type;	toxicology
SELECT a.element FROM atom AS a JOIN (SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_10_11') AS c ON a.atom_id IN (c.atom_id, c.atom_id2);	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM bond;	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = ' = ' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR047';	toxicology
SELECT m.label FROM `molecule` AS m JOIN `atom` AS a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT * FROM atom WHERE element = 'c' AND SUBSTR(molecule_id, 3, 3) >= '10' AND SUBSTR(molecule_id, 3, 3) <= '50';	toxicology
SELECT COUNT(*) FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')	toxicology
SELECT c.bond_id FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'h';	toxicology
SELECT T3.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id2 = T2.atom_id WHERE (T1.atom_id = 'TR000_1' OR T1.atom_id2 = 'TR000_1') AND T1.bond_id = 'TR000_1_2' JOIN bond AS T3 ON T3.bond_id = T1.bond_id	toxicology
SELECT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE a.element = 'c' AND c.bond_id IN (SELECT b.bond_id FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE m.label = '-');	toxicology
SELECT CAST(COUNT(CASE WHEN T2.label = '+' AND T1.element = 'h' THEN T1.molecule_id END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT * FROM `atom` WHERE `molecule_id` = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT DISTINCT T1.element AS element_1, T2.element AS element_2 FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN atom AS T2 ON T2.atom_id = T3.atom_id2 WHERE T3.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS num_double_bonds FROM bond WHERE molecule_id = 'TR006' AND bond_type = '='; SELECT label FROM molecule WHERE molecule_id = 'TR006';	toxicology
SELECT m.molecule_id, a.element FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE m.label = '+'	toxicology
SELECT a1.element AS atom1_element, a2.element AS atom2_element, b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT molecule_id, GROUP_CONCAT(element) AS elements FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#') GROUP BY molecule_id;	toxicology
SELECT a1.element, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT T3.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.element = 'cl'	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS num_bond_types FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.label = '+'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN connected AS T3 ON T1.atom_id = T3.atom_id2 LEFT JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.element != 's' AND (T4.bond_type IS NULL OR T4.bond_type != '=') GROUP BY T1.molecule_id HAVING COUNT(T1.atom_id) > 0;	toxicology
SELECT m.label FROM `molecule` AS m JOIN `bond` AS b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT DISTINCT a.molecule_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_3_4') OR atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_3_4');	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2') OR (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1')	toxicology
SELECT T1.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN T2.bond_type = '-' THEN T3.atom_id END) AS REAL) * 100 / COUNT(T3.atom_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+'	toxicology
SELECT DISTINCT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 's' AND T3.bond_type = '=';	toxicology
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'	toxicology
SELECT a.molecule_id FROM atom a WHERE a.molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE m.label = '+') GROUP BY a.molecule_id ORDER BY COUNT(a.atom_id) DESC LIMIT 1;	toxicology
WITH hydrogen_triple_bond AS ( SELECT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'h' AND b.bond_type = '#' ) SELECT CAST(COUNT(DISTINCT htb.molecule_id) AS REAL) * 100 / COUNT(DISTINCT m.molecule_id) FROM hydrogen_triple_bond htb JOIN molecule m ON htb.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(atom_id) FROM atom WHERE element = 'c' AND molecule_id = 'TR008';	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '=';	toxicology
SELECT COUNT(*) FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond_type` = '#' AND `label` = '-';	toxicology
SELECT a.element, b.bond_type FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT a.atom_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE m.label = '+' AND a.element = 'c' AND b.bond_type = '=' AND m.molecule_id = 'TR012';	toxicology
SELECT a.atom_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM `cards` WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);	card_games
SELECT c.name FROM cards AS c JOIN card_faces AS cf ON c.uuid = cf.card_uuid GROUP BY c.name ORDER BY MAX(cf.faceConvertedManaCost) DESC LIMIT 1;	card_games
SELECT * FROM `cards` WHERE `frameVersion` = '2015' AND `edhrecRank` < 100;	card_games
SELECT c.name FROM cards AS c JOIN prints AS p ON c.uuid = p.card_uuid JOIN statuses AS s ON p.status_id = s.id WHERE c.rarity = 'mythic' AND s.format = 'gladiator' AND s.status = 'Banned';	card_games
SELECT c.name, l.vintage FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%' AND c.side IS NULL;	card_games
SELECT c.card_id, c.artist FROM cards AS c JOIN card_formats AS cf ON c.card_id = cf.card_id JOIN formats AS f ON cf.format_code = f.code WHERE (c.power = '*' OR c.power IS NULL) AND f.name = 'commander' AND cf.status = 'Legal';	card_games
SELECT c.id AS card_id, r.text AS ruling_text, c.hasContentWarning FROM cards c JOIN illustrations i ON c.uuid = i.card_uuid JOIN rulings r ON c.uuid = r.uuid WHERE i.artist = 'Stephen Daniele';	card_games
SELECT r.text FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
-- SQL query to find the card and artist with the most ruling information, also stating if the card is a promotional printing. WITH rulings_count AS (     SELECT uuid, COUNT(uuid) AS ruling_count     FROM rulings     GROUP BY uuid ) SELECT c.name, c.artist, ct.translation, c.isPromo FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid JOIN rulings_count AS rc ON c.uuid = rc.uuid WHERE c.isPromo = 1 ORDER BY rc.ruling_count DESC LIMIT 1;	card_games
SELECT T3.language FROM `cards` AS T1 INNER JOIN `sets` AS T2 ON T1.setCode = T2.code INNER JOIN `set_translations` AS T3 ON T3.setCode = T2.code WHERE T1.name = 'Annul' AND T1.number = '29';	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Japanese';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode;	card_games
SELECT s.setName, s.totalSetSize FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type_line) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT s.promoTypes FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Duress';	card_games
SELECT s.borderColor FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor's Chosen';	card_games
SELECT st.language FROM card AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON st.setCode = s.code WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(DISTINCT c.id) FROM cards AS c INNER JOIN legalities AS l ON c.set_id = l.set_id WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(c.id) FROM cards AS c INNER JOIN legalities AS l ON c.id = l.cardId INNER JOIN sets AS s ON c.setCode = s.code WHERE l.status = 'restricted' AND s.isStarter = 1;	card_games
SELECT * FROM cards WHERE name = 'Cloudchaser Eagle';	card_games
SELECT type_line FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT DISTINCT c.artist FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Phyrexian';	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM cards;	card_games
SELECT COUNT(*) FROM `sets` s JOIN `set_translations` st ON s.setCode = st.setCode WHERE st.language = 'German' AND s.isReprint = 1;	card_games
SELECT COUNT(*) FROM `cards` c JOIN `card_translations` ct ON c.uuid = ct.cardUUID WHERE c.borderColor = 'borderless' AND ct.language = 'Russian';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `toughness` = 99;	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM `cards` c INNER JOIN `set_cards` sc ON c.uuid = sc.card_uuid INNER JOIN `sets` s ON sc.set_code = s.code WHERE c.borderColor = 'black' AND s.availability = 'mtgo';	card_games
SELECT c.uuid AS card_id FROM cards c JOIN card_faces f ON c.cardFaceId = f.id WHERE f.convertedManaCost = 0;	card_games
SELECT c.layout FROM `cards` AS c JOIN `keywords` AS k ON c.uuid = k.uuid WHERE k.keyword = 'Flying';	card_games
SELECT COUNT(*) FROM cards JOIN types ON cards.type_id = types.id JOIN subtypes ON cards.subtype_id = subtypes.id WHERE types.original_type = 'Summon - Angel' AND subtypes.name != 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT DISTINCT c.artist FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode JOIN card_translations AS ct ON c.uuid = ct.cardUUID WHERE st.language = 'Chinese Simplified' AND ct.language = 'Chinese Simplified';	card_games
SELECT c.name FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.translation_uuid WHERE ct.language = 'Japanese' AND EXISTS(SELECT * FROM printings AS p WHERE p.card_uuid = c.uuid AND p.availability = 'paper') GROUP BY c.name HAVING COUNT(DISTINCT ct.language) = 1	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.status = 'Banned' AND sets.borderColor = 'white';	card_games
SELECT c.uuid, ct.translation FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid JOIN sets AS s ON c.setCode = s.code WHERE s.format = 'legacy';	card_games
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(c.uuid), l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.card_uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT c.name, cl.color FROM cards AS c JOIN card_colors AS cc ON c.uuid = cc.card_uuid JOIN colors AS cl ON cc.color_id = cl.id WHERE c.setCode = 'OGW';	card_games
SELECT c.name AS card_name, st.language, st.translation FROM cards AS c INNER JOIN sets AS s ON c.setCode = s.code INNER JOIN set_translations AS st ON s.code = st.setCode AND st.translation IS NOT NULL WHERE s.setCode = '10E' AND c.convertedManaCost = 5 GROUP BY c.name, st.language, st.translation;	card_games
SELECT c.name, r.date FROM cards AS c JOIN card_types AS ct ON c.uuid = ct.uuid JOIN rulings AS r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, f.format FROM cards AS c JOIN sets AS s ON c.set_id = s.id JOIN formats AS f ON s.format_id = f.id WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name, ct.translation, s.code FROM cards AS c JOIN card_translations AS ct ON c.name = json_extract(ct.foreign_data->'$.name') AND c.setCode = (json_extract(ct.foreign_data, '$.setCode')) JOIN sets AS s ON s.code = ct.setCode WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND ct.language IS NOT NULL;	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN rulings AS r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards JOIN card_faces ON cards.uuid = card_faces.uuid WHERE card_faces.artist = 'John Avon' AND cards.cardKingdomId IS NOT NULL AND cards.cardKingdomFoilId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.borderColor = 'white' AND cards.cardKingdomFoilId IS NOT NULL AND cards.cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards JOIN printings ON cards.uuid = printings.card_uuid JOIN rules ON cards.uuid = rules.card_uuid WHERE cards.artist = 'UDON' AND printings.availability LIKE '%mtgo%' AND rules.hand = -1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `frameVersion` = '1993' AND `availability` LIKE '%paper%' AND `hasContentWarning` = 1;	card_games
SELECT c.manaCost FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.layout = 'normal' AND s.frameVersion = '2003' AND s.borderColor = 'black' AND s.availability = 'mtgo,paper';	card_games
SELECT SUM(LENGTH(manaCost)) AS TotalUnconvertedMana FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT type_line, sub_types, super_types FROM cards WHERE availability = 'arena';	card_games
SELECT st.setCode FROM set_translations AS st WHERE st.language = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT CAST(SUM(CASE WHEN isStorylight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN isStorylight = 1 THEN 1 ELSE 0 END) AS percentage, id FROM cards WHERE isStorylight = 1 AND isTextless = 0;	card_games
SELECT st.translation AS Card_Name_In_Spanish FROM set_translations AS st WHERE st.language = 'Spanish' AND st.setCode IN (SELECT c.setCode FROM cards AS c) GROUP BY st.translation;	card_games
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Portuguese (Brasil)' AND sets.block = 'Commander';	card_games
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.card_uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal';	card_games
SELECT DISTINCT ct.name AS 'Card Type', ctt.translation AS 'German Translation' FROM card_types AS ct JOIN card_type_translations AS ctt ON ct.id = ctt.cardTypeId WHERE ctt.language = 'German';	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` LEFT JOIN `rulings` ON `cards`.`uuid` = `rulings`.`uuid` WHERE `sets`.`format` = 'premodern' AND `rulings`.`text` = 'This is a triggered mana ability.' AND `cards`.`side` IS NULL;	card_games
SELECT c.id FROM cards AS c JOIN formats_cards AS fc ON c.format_id = fc.format_id JOIN formats AS f ON fc.format_id = f.id WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND f.name = 'pauper';	card_games
SELECT c.artist FROM cards AS c WHERE c.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT st.translation FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.typeLine LIKE '%Creature%' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson' AND st.language = 'French';	card_games
SELECT COUNT(DISTINCT c.uuid) AS card_count FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT CAST(SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id) FROM cards AS c JOIN card_legality AS cl ON c.uuid = cl.card_uuid WHERE cl.format = 'commander' AND cl.status = 'legal';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.power) FROM `cards` AS T1 LEFT JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T1.power IS NULL OR T1.power = '*'	card_games
SELECT CAST(COUNT(CASE WHEN T2.language = 'Japanese' AND T1.type = 'expansion' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN T2.language = 'Japanese' THEN 1 END) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese';	card_games
SELECT c.availability FROM cards AS c JOIN illustrators AS i ON c.uuid = i.card_uuid WHERE i.name = 'Daren Bader';	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'borderless' AND `colorIdentity` IS NOT NULL AND `edhrecRank` > 12000;	card_games
SELECT COUNT(*) FROM `cards` WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE (c.power IS NULL OR c.power = '*') AND s.promoTypes LIKE '%arenaleague%' ORDER BY c.name LIMIT 3;	card_games
SELECT T2.translation FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T1.multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards;	card_games
SELECT c.number FROM cards AS c INNER JOIN subtypes AS s ON c.uuid = s.card_uuid WHERE s.subtype IN ('Angel', 'Wizard') GROUP BY c.number HAVING COUNT(DISTINCT s.subtype) = 2 AND c.side IS NULL;	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3;	card_games
SELECT DISTINCT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.setCode = 'ARC';	card_games
SELECT s.name, st.translation FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT s.name, s.type FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.id = 206;	card_games
SELECT s.id, s.code FROM sets AS s JOIN set_translations AS st ON s.setCode = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets AS s JOIN set_translations AS st ON s.setCode = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese';	card_games
SELECT s.name FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT CAST(COUNT(DISTINCT CASE WHEN c.isOnlineOnly = 1 THEN c.uuid END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE st.language = 'Chinese Simplified';	card_games
SELECT COUNT(DISTINCT s.code) FROM sets AS s JOIN set_translations AS st ON s.setCode = st.setCode WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '')	card_games
SELECT c.id FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT st.language FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE c.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT code, baseSetSize FROM sets WHERE block = 'Masques' OR block = 'Mirage';	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT T2.name, T2.type_line FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark LIKE '%boros%'	card_games
SELECT language, flavor_text, type_line FROM cards WHERE watermark = 'colorpie';	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Abyssal Horror'	card_games
SELECT setCode FROM sets WHERE type = 'expansion commander';	card_games
SELECT T2.translation AS card_name, T1.type FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.watermark = 'Abzan';	card_games
SELECT ct.language, c.type FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid WHERE c.keywords LIKE '%Azorius%'	card_games
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Aaron Miller' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.availability LIKE '%paper%' AND set_translations.translation LIKE '%positive%'	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor's Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE border = 'W' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT DISTINCT sp.purchaseUrls FROM set_printings AS sp JOIN cards AS c ON sp.cardId = c.id JOIN sets AS s ON sp.setId = s.id WHERE s.promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT c.artist) AS num_artists FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE c.border = 'black' AND c.printings LIKE '%arena,mtgo%'	card_games
SELECT MAX(subq.convertedManaCost) AS max_converted_mana_cost FROM (SELECT convertedManaCost FROM cards WHERE name = 'Serra Angel' UNION ALL SELECT convertedManaCost FROM cards WHERE name = 'Shrine Keeper') subq;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT T3.translation FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code JOIN `set_translations` AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T3.language = 'Italian'	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code JOIN set_translations ON sets.code = set_translations.setCode WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT T3.translation FROM `cards` AS T1 INNER JOIN `sets` AS T2 ON T1.setId = T2.id INNER JOIN `set_translations` AS T3 ON T3.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen' AND T3.language = 'Korean';	card_games
SELECT COUNT(*) FROM (SELECT c.id FROM cards AS c JOIN sets AS s ON c.setID = s.id JOIN set_translations AS st ON s.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex') AS result;	card_games
SELECT s.baseSetSize FROM `sets` AS s JOIN `set_translations` AS st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT st.translation FROM set_translations AS st JOIN sets AS s ON st.setCode = s.code WHERE st.language = 'Chinese Simplified' AND s.name = 'Eighth Edition'	card_games
SELECT s.code FROM sets AS s JOIN cards AS c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate FROM sets AS s JOIN cards AS c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM (SELECT s.setCode FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL)	card_games
SELECT s.isForeignOnly FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` = 'Italian' AND `sets`.`baseSetSize` < 100;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND sets.borderColor = 'black';	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.cmc DESC;	card_games
SELECT DISTINCT c.artist FROM `cards` AS c JOIN `sets` AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = 4;	card_games
SELECT COUNT(*) FROM `cards` AS T1 INNER JOIN `sets` AS T2 ON T1.setCode = T2.code INNER JOIN `card_translations` AS T3 ON T1.uuid = T3.uuid WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT t.flavorText FROM translations AS t JOIN cards AS c ON t.uuid = c.uuid JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian'	card_games
SELECT T3.language FROM `cards` AS T1 JOIN `translations` AS T2 ON T1.uuid = T2.uuid JOIN `set_translations` AS T3 ON T1.setCode = T3.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL;	card_games
SELECT t.translation FROM cards AS c JOIN translations AS t ON c.uuid = t.uuid JOIN set_translations AS st ON t.setCode = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'German';	card_games
SELECT s.name AS setName, st.translation AS italianTranslation, r.text AS italianRulingText FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode AND st.language = 'Italian' JOIN cards AS c ON s.code = c.setCode JOIN rulings AS r ON c.uuid = r.uuid WHERE s.name = 'Coldsnap';	card_games
SELECT T3.translation FROM sets AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode JOIN card_translations AS T3 ON T2.uuid = T3.uuid WHERE T1.name = 'Coldsnap' AND T3.language = 'Italian' AND T2.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode IN(SELECT setCode FROM sets WHERE name = 'Coldsnap'));	card_games
SELECT r.date FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Reminisce';	card_games
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap';	card_games
SELECT CAST(SUM(CASE WHEN T2.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards c JOIN artists a ON c.artistId = a.id JOIN rulings r ON c.uuid = r.uuid WHERE a.name = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Evacuation';	card_games
SELECT s.baseSetSize FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara';	card_games
SELECT T3.type FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN types AS T3 ON T2.type_id = T3.id WHERE T1.translation = 'Huitième édition'	card_games
SELECT st.translation FROM (SELECT c.uuid AS card_uuid, s.code AS set_code FROM cards AS c JOIN sets AS s ON c.set = s.code WHERE c.name = 'Tendo Ice Bridge') AS card_set JOIN card_translations AS ct ON card_set.card_uuid = ct.uuid AND ct.language = 'French' JOIN set_translations AS st ON card_set.set_code = st.setCode AND st.language = 'French';	card_games
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`name` = 'Tenth Edition' AND `set_translations`.`translation` IS NOT NULL;	card_games
SELECT T2.translation FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese';	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero\'s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT s.release_date FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Ola de frío'	card_games
SELECT s.type FROM sets AS s JOIN cards AS c ON s.code = c.set WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN card_sets AS T2 ON T1.id = T2.cardId JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Chinese Simplified' AND s.name = 'Mirrodin'	card_games
SELECT CAST(SUM(CASE WHEN c.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE st.language = 'Japanese';	card_games
SELECT CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE st.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT cp.availability FROM cards AS c JOIN card_printings AS cp ON c.id = cp.card_id WHERE c.isTextless = 1 AND c.artist != 'Aleksi Briclot';	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT c.artist FROM cards AS c JOIN card_faces AS cf ON c.uuid = cf.card_uuid WHERE cf.side IS NULL ORDER BY cf.cmc DESC LIMIT 1;	card_games
SELECT frameEffects FROM (SELECT frameEffects, COUNT(frameEffects) AS count FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY count DESC LIMIT 1);	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' AND totalSetSize = (SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander');	card_games
SELECT c.name, c.manaCost FROM cards AS c JOIN formats AS f ON c.uuid = f.card_uuid WHERE f.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;	card_games
SELECT c.name, s.originalReleaseDate, GROUP_CONCAT(lp.format) AS legal_play_formats FROM cards AS c JOIN sets AS s ON c.setCode = s.code LEFT JOIN (SELECT cardId, format FROM card_legality WHERE status = 'legal') AS lp ON c.id = lp.cardId WHERE c.rarity = 'mythic' GROUP BY c.name, s.originalReleaseDate ORDER BY s.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(c.id) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.artist = 'Volkan Baǵa' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM `cards` JOIN `legalities` ON `cards`.`uuid` = `legalities`.`uuid` WHERE `cards`.`name` = 'Abundance' AND `cards`.`rarity` = 'rare' AND `cards`.`types` LIKE '%Enchantment%' AND `legalities`.`status` = 'Legal';	card_games
SELECT b.format, c.name FROM bans AS b JOIN cards AS c ON b.cardId = c.id WHERE b.status = 'Banned' GROUP BY b.format ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT st.language FROM set_translations AS st JOIN (SELECT code FROM sets WHERE name = 'Battlebond') AS s ON st.setCode = s.code;	card_games
SELECT artist, COUNT(*) AS num_cards FROM cards GROUP BY artist ORDER BY num_cards ASC LIMIT 1;	card_games
SELECT c.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.card_uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND (c.hasContentWarning = 1 OR c.printedBy = 'Wizards of the Coast') AND l.format = 'legacy';	card_games
SELECT c.name FROM cards AS c JOIN cardedhrecs AS cer ON c.uuid = cer.card_uuid WHERE cer.edhrecRank = 1 AND EXISTS (SELECT * FROM bans AS b JOIN formats AS f ON b.format_id = f.id WHERE b.card_uuid = c.uuid AND f.status = 'Banned');	card_games
SELECT CAST(COUNT(DISTINCT s.id) AS REAL) / 4 AS average_sets_per_year, st.language AS common_language FROM sets s LEFT JOIN set_translations st ON s.code = st.setCode WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY st.language ORDER BY COUNT(st.id) DESC LIMIT 1;	card_games
SELECT DISTINCT c.artist FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.borderColor = 'black' AND s.availability = 'arena';	card_games
SELECT uuid FROM `cards` WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name AS Card_Name, cl.format AS Format FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN card_legality AS cl ON c.uuid = cl.card_uuid WHERE s.name = 'Hour of Devastation' AND cl.status = 'Legal';	card_games
SELECT DISTINCT s.name FROM sets AS s LEFT JOIN set_translations AS st1 ON s.code = st1.setCode AND st1.language LIKE '%Japanese%' LEFT JOIN set_translations AS st2 ON s.code = st2.setCode AND st2.language = 'Korean' WHERE st1.id IS NULL AND st2.id IS NOT NULL;	card_games
SELECT c.name, cf.frameVersion AS frame_style FROM cards AS c JOIN card_faces AS cf ON c.uuid = cf.card_uuid WHERE cf.artist = 'Allen Williams' AND c.status = 'Banned';	card_games
SELECT MAX(Reputation), DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon');	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId GROUP BY u.Id ORDER BY SUM(p.ViewCount) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013';	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(p.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.AnswerCount FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM Posts p JOIN Users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie' AND posts.ParentId IS NULL;	codebase_community
SELECT u.DisplayName FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.Age > 65 AND posts.Score >= 20;	codebase_community
SELECT u.Location FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM Posts AS p JOIN PostTags AS pt ON p.Id = pt.PostId WHERE pt.TagId IN (SELECT t.Id FROM Tags AS t WHERE t.TagName = 'bayesian') AND pt.ExcerptPostId IS NOT NULL;	codebase_community
SELECT p.Body FROM Posts AS p JOIN (SELECT t.ExcerptPostId FROM Tags AS t JOIN (SELECT TagId, COUNT(*) AS Count FROM PostTags GROUP BY TagId ORDER BY Count DESC LIMIT 1) AS pt ON t.Id = pt.TagId) AS te ON p.Id = te.ExcerptPostId	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name FROM (SELECT u.Id AS UserId FROM users u WHERE u.DisplayName = 'csgillespie') AS ua JOIN badgeawards ba ON ua.UserId = ba.UserId JOIN badges b ON ba.Name = b.Name;	codebase_community
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'csgillespie' AND strftime('%Y', badges.Date) = '2011';	codebase_community
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId GROUP BY b.UserId ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT CAST(SUM(T2.Count) AS REAL) / COUNT(DISTINCT T1.DisplayName) FROM (SELECT DisplayName, COUNT(*) AS Count FROM users WHERE Views > 200 GROUP BY UserId) AS T1 JOIN (SELECT UserId, COUNT(*) AS Count FROM badges GROUP BY UserId) AS T2 ON T1.UserId = T2.UserId	codebase_community
SELECT CAST(COUNT(CASE WHEN T2.Age > 65 THEN T1.Id END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(Id) FROM Badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT CommentCount FROM posts WHERE ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.UserId = '3025' AND c.CreationDate = '2014-04-23 20:29:39.0';	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1;	codebase_community
SELECT p.ClosedDate IS NULL AS is_well_finished FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName FROM votes AS v JOIN users AS u ON v.UserId = u.Id WHERE v.Id = '6347'	codebase_community
SELECT COUNT(*) FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(DISTINCT p.Id) AS REAL) / COUNT(DISTINCT v.Id) AS post_to_vote_ratio FROM posts p LEFT JOIN votes v ON p.OwnerUserId = v.UserId WHERE p.OwnerUserId = 24 AND v.UserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!';	codebase_community
SELECT c.Text FROM Comments AS c JOIN Users AS u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE p.Title = 'How does gentle boosting differ from AdaBoost?' ORDER BY c.CreationDate;	codebase_community
SELECT u.DisplayName FROM Users u JOIN Badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName FROM posts p JOIN posthistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data' AND ph.PostHistoryTypeId = 5;	codebase_community
SELECT p.Title FROM posts AS p JOIN users AS u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS total_score, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.Text FROM posts AS p JOIN posthistory AS ph ON p.Id = ph.PostId JOIN comments AS c ON p.Id = c.PostId WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.PostHistoryTypeId = 4;	codebase_community
SELECT SUM(v.BountyAmount) FROM votes AS v JOIN (SELECT p.Id FROM posts AS p WHERE p.Title LIKE '%data%') AS subquery ON v.PostId = subquery.Id;	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, p.Text FROM posts AS p JOIN posttags AS pt ON p.Id = pt.PostId JOIN tags AS t ON t.Id = pt.TagId WHERE t.TagName = '<humor>' GROUP BY p.Title;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT UserId FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT Id, MIN(Views) FROM users;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011';	codebase_community
SELECT COUNT(DISTINCT UserId) FROM Badges WHERE Count > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM Users u JOIN Badges b ON u.Id = b.UserId JOIN BadgeTypes bt ON b.BadgeTypeId = bt.Id WHERE u.Location LIKE '%New York%' AND (bt.Name = 'Supporter' OR bt.Name = 'Teacher');	codebase_community
SELECT u.Reputation FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT p.UserId FROM (SELECT ph.PostId, COUNT(ph.Id) AS post_histories_count FROM posthistories AS ph JOIN posts AS p ON ph.PostId = p.Id GROUP BY ph.PostId) AS phc JOIN posts AS p ON phc.PostId = p.Id WHERE phc.post_histories_count = 1 AND p.ViewCount >= 1000 GROUP BY p.UserId HAVING COUNT(p.Id) > 0;	codebase_community
SELECT u.Badge FROM (SELECT c.UserId, COUNT(c.Id) AS CommentCount FROM Comments c GROUP BY c.UserId ORDER BY CommentCount DESC LIMIT 1) AS maxCommentsUser JOIN Users u ON maxCommentsUser.UserId = u.Id;	codebase_community
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId JOIN badge_types ON badges.BadgeTypeId = badge_types.Id WHERE users.Location = 'India' AND badge_types.Name = 'Teacher';	codebase_community
SELECT (CAST(SUM(CASE WHEN strftime('%Y', Date) = '2010' AND Name = 'Student' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 ELSE 0 END) - CAST(SUM(CASE WHEN strftime('%Y', Date) = '2011' AND Name = 'Student' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 ELSE 0 END)) * 100 AS percentage_difference FROM Badges	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT p.OwnerUserId) AS UniqueUsersCommented FROM post_history AS ph JOIN posts AS p ON ph.PostId = p.Id WHERE ph.PostId = 3720 AND p.PostTypeId = 2 GROUP BY ph.PostHistoryTypeId;	codebase_community
SELECT P1.PostId, P1.ViewCount FROM Posts AS P1 JOIN Posts AS P2 ON P1.Id = P2.RelatedPostId WHERE P2.Id = 61217 UNION SELECT PostId, ViewCount FROM Posts WHERE Id = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT Id, OwnerUserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE UserId = 686 AND strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT AVG(T1.UpVotes) AS avg_up_votes, AVG(T1.Age) AS avg_age FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.UserId GROUP BY T1.Id HAVING COUNT(T2.Id) > 10	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM Badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT B.Name FROM (SELECT MAX(Reputation) AS MaxRep FROM users) AS UMax JOIN users AS U ON U.Reputation = UMax.MaxRep JOIN badges AS B ON U.Id = B.UserId;	codebase_community
SELECT u.Reputation FROM users AS u JOIN (SELECT UserId FROM badges WHERE Date = '2010-07-19 19:39:08.0') AS b ON u.Id = b.UserId WHERE u.LastAccessDate >= '2010-07-19 19:39:08.0' AND u.CreationDate <= '2010-07-19 19:39:08.0'	codebase_community
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT b.Date FROM Badges AS b JOIN Users AS u ON b.UserId = u.Id WHERE u.Location LIKE '%Rochester, NY%'	codebase_community
SELECT CAST((SELECT COUNT(*) FROM badges WHERE Name = 'Teacher') AS REAL) * 100 / (SELECT COUNT(*) FROM users) AS Percentage	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM (SELECT UserId FROM badges WHERE Name = 'Organizer') AS T1 JOIN users AS T2 ON T1.UserId = T2.Id;	codebase_community
SELECT c.Score FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.Location LIKE '%Vienna, Austria%' GROUP BY u.Age;	codebase_community
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId WHERE users.Age BETWEEN 19 AND 65 AND badges.Name = 'Supporter';	codebase_community
SELECT T3.ViewCount FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T2.Id = T3.OwnerUserId WHERE T1.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM (SELECT MIN(Reputation) AS minRep FROM Users) AS uMin JOIN Users AS u ON u.Reputation = uMin.minRep JOIN Badges AS b ON u.Id = b.UserId;	codebase_community
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId WHERE users.Age > 65 AND badges.Name = 'Supporter';	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT u.DisplayName, SUM(p.Views) as TotalViews FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.DisplayName ORDER BY TotalViews DESC LIMIT 1;	codebase_community
SELECT CAST(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN Id ELSE NULL END) AS REAL) / COUNT(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN Id ELSE NULL END) FROM votes WHERE strftime('%Y', CreationDate) IN ('2010', '2011')	codebase_community
SELECT t.TagName FROM (SELECT u.Id AS UserId FROM users u WHERE u.DisplayName = 'John Salvatier') AS js JOIN posts p ON p.OwnerUserId = js.UserId JOIN posttags pt ON pt.PostId = p.Id JOIN tags t ON t.Id = pt.TagId	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan');	codebase_community
SELECT p.Id AS PostID FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, SUM(p.ViewCount) AS TotalViewCount FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY u.DisplayName ORDER BY TotalViewCount DESC LIMIT 1	codebase_community
SELECT p.Id AS PostId FROM posts p JOIN users u ON p.OwnerUserId = u.Id LEFT JOIN votes v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' GROUP BY p.Id HAVING COUNT(v.Id) > 4;	codebase_community
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT DISTINCT T3.Tags FROM `users` AS T1 INNER JOIN `posts` AS T2 ON T1.Id = T2.UserId INNER JOIN `posts` AS T3 ON T2.Id = T3.Id WHERE T1.DisplayName = 'Mark Meckes' AND T2.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId JOIN Tags AS T3 ON T2.TagId = T3.Id WHERE T1.OwnerUserId = 1;	codebase_community
SELECT (SUM(p1.ViewCount) - SUM(p2.ViewCount)) AS ViewDifference FROM (SELECT p.ViewCount FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mornington') AS p1, (SELECT p.ViewCount FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Amos') AS p2	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Commentator' AND strftime('%Y', badges.Date) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId GROUP BY u.Id ORDER BY SUM(p.Views) DESC LIMIT 1;	codebase_community
SELECT MAX(ph.CreationDate) AS LastEditDate, ph.UserId AS LastEditUserId FROM posts p JOIN posthistory ph ON p.Id = ph.PostId WHERE p.Title = 'Detecting a given face in a database of facial images' AND ph.PostHistoryTypeId IN (4, 5, 6) GROUP BY ph.PostId;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND strftime('%Y', b.Date) = '2011';	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM Users AS u JOIN Posts AS p ON u.Id = p.OwnerUserId JOIN Votes AS v ON p.Id = v.PostId WHERE v.VoteTypeId = 5 AND v.CreationDate > 150;	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(ph.Id) AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM posts p JOIN post_history ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' AND p.PostTypeId = 1 GROUP BY ph.PostHistoryTypeId	codebase_community
SELECT u.LastAccessDate, u.Location FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT Title FROM posts WHERE Body = 'How to tell if something happened in a data set which monitors a value over time';	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN badges b ON u.Id = b.UserId WHERE u.UserDisplayName = 'Samuel' AND strftime('%Y', p.CreationDate) = '2013' AND strftime('%Y', b.Date) = '2013';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.PostTypeId = 1 ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE p.TagName = 'hypothesis-testing';	codebase_community
SELECT p2.Title, pl.LinkTypeId FROM posts AS p1 INNER JOIN postlinks AS pl ON p1.Id = pl.PostId INNER JOIN posts AS p2 ON p2.Id = pl.RelatedPostId WHERE p1.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName FROM Users AS u JOIN Posts AS p ON u.Id = p.ParentId WHERE p.ParentId IS NOT NULL AND p.Score = (SELECT MAX(Score) FROM Posts WHERE ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes AS v JOIN users AS u ON v.UserId = u.Id JOIN posts AS p ON v.PostId = p.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT Age FROM users WHERE Id = (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(Score) FROM posts WHERE CreationDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(Id) AS REAL) / 12 FROM posts WHERE STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2;	codebase_community
SELECT p.Id AS PostId, MAX(p.FavoriteCount) AS MaxFavoriteCount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 GROUP BY p.Id ORDER BY MaxFavoriteCount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY CreationDate ASC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId GROUP BY b.UserId ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate) AS first_vote_date FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';	codebase_community
SELECT p.CreationDate FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users) AND p.CreationDate = (SELECT MIN(CreationDate) FROM posts WHERE OwnerUserId = u.Id)	codebase_community
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId JOIN posts AS p ON u.Id = p.OwnerUserId WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT u.Id AS userId FROM users u JOIN posts p ON u.Id = p.UserId WHERE u.Location LIKE '%United Kingdom%' AND p.FavoriteCount >= 4 GROUP BY u.Id;	codebase_community
WITH OldestUsers AS (SELECT Id FROM Users WHERE Age = (SELECT MAX(Age) FROM Users)) SELECT AVG(COUNT(*)) OVER () AS AveragePostsVoted FROM Votes WHERE UserId IN (SELECT Id FROM OldestUsers);	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM users JOIN posts ON users.Id = posts.UserId WHERE users.Reputation > 2000 AND posts.ViewCount > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', posts.CreationDate) = '2010';	codebase_community
SELECT p.Id, p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id AS PostId, p.Title AS Title, u.DisplayName AS OwnerName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE YEAR(p.CreationDate) = 2011 AND p.ViewCount > 20000;	codebase_community
SELECT p.Id AS PostId, u.DisplayName AS OwnerName FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreationDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(p.CreationDate) = 2011 AND u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2011;	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) as percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts AS p JOIN tags AS t ON p.Id = t.PostId JOIN users AS u ON p.OwnerUserId = u.Id WHERE t.Text = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*) FROM (SELECT * FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts));	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts))	codebase_community
SELECT * FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM (SELECT u.Id, SUM(CASE WHEN v.VoteTypeId = 2 THEN 1 ELSE 0 END) AS UpVotes FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.Age BETWEEN 19 AND 65 GROUP BY u.Id HAVING UpVotes > 5000)	codebase_community
SELECT julianday(sb.Date) - julianday(u.CreationDate) AS Days FROM (SELECT MIN(Date) AS Date FROM stats_badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Zolomon')) sb JOIN users u ON sb.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT (SELECT COUNT(*) FROM posts WHERE posts.OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS post_count, (SELECT COUNT(*) FROM comments WHERE comments.UserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)) AS comment_count;	codebase_community
SELECT c.Text, u.DisplayName FROM comments AS c JOIN posts AS p ON c.PostId = p.Id JOIN users AS u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM Posts INNER JOIN PostTags ON Posts.Id = PostTags.PostId INNER JOIN Tags ON PostTags.TagId = Tags.Id WHERE Tags.TagName = 'careers';	codebase_community
SELECT Reputation FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(T3.Id) AS answer_count, (SELECT COUNT(*) FROM Comments WHERE PostId = T1.Id) AS comment_count FROM Posts AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.ParentId INNER JOIN Posts AS T3 ON T2.Id = T3.ParentId WHERE T1.Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
WITH InfluentialUser AS (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1), PostsByInfluentialUser AS (SELECT p.Id FROM posts p JOIN InfluentialUser u ON p.OwnerUserId = u.Id) SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS PercentageHighScorePosts FROM PostsByInfluentialUser;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT * FROM Tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users AS u JOIN comments AS c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT C.Text FROM Comments AS C JOIN Posts AS P ON C.PostId = P.Id WHERE P.Title LIKE '%linear regression%'	codebase_community
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age FROM users AS u JOIN comments AS c ON u.Id = c.UserId WHERE c.Text LIKE '%http://%' OR c.Text LIKE '%https://%';	codebase_community
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score = 0 AND posts.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.CommentCount = 1 AND comments.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u JOIN comments AS c ON u.Id = c.UserId JOIN posts AS p ON p.Id = c.PostId WHERE u.Age = 40 AND c.Score = 0;	codebase_community
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT COUNT(v.Id) AS UpVotes FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id JOIN votes v ON v.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.' AND v.VoteTypeId = 2;	codebase_community
SELECT c.Text FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT u.DisplayName FROM Users AS u JOIN Comments AS c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND NOT EXISTS(SELECT * FROM Votes AS v WHERE v.PostId = c.Id AND v.VoteTypeId = 3);	codebase_community
SELECT CAST(SUM(CASE WHEN U.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(U.Id) FROM Comments C JOIN Users U ON C.UserId = U.Id WHERE C.Score BETWEEN 5 AND 10;	codebase_community
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = '3-D Man';	superhero
SELECT COUNT(*) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT s.full_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT c.colour FROM `superhero` s JOIN `colour` c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*) FROM `superhero` AS s JOIN `colour` AS c ON s.eye_colour_id = c.id JOIN `hero_power` AS hp ON s.id = hp.hero_id JOIN `superpower` AS sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT s.superhero_name, s.height_cm FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;	superhero
SELECT p.publisher_name FROM `superhero` AS s JOIN `publisher` AS p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT c.colour AS Eye_Color, COUNT(sh.id) AS Superheroes_Count FROM superhero sh JOIN colour c ON sh.eye_colour_id = c.id WHERE sh.publisher_id = 1 GROUP BY sh.eye_colour_id ORDER BY Superheroes_Count DESC;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'ABC Studios';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT p.publisher_name FROM publisher AS p JOIN superhero AS s ON p.id = s.publisher_id JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed'))	superhero
SELECT COUNT(*) FROM `superhero` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` JOIN `colour` ON `superhero.eye_colour_id` = `colour.id` WHERE `publisher.publisher_name` = 'Marvel Comics' AND `colour.colour` = 'Gold';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT r.race FROM `superhero` s JOIN `race` r ON s.race_id = r.id WHERE s.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM `superhero` AS s JOIN `hero_power` AS hp ON s.id = hp.hero_id JOIN `superpower` AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM `superhero` AS s JOIN `gender` AS g ON s.gender_id = g.id JOIN `hero_attribute` AS ha ON s.id = ha.hero_id WHERE g.gender = 'Female' AND ha.attribute_id = (SELECT id FROM `attribute` WHERE attribute_name = 'Strength') AND ha.attribute_value = 100;	superhero
SELECT s.superhero_name FROM (SELECT hp.hero_id, COUNT(hp.power_id) AS num_powers FROM hero_power hp GROUP BY hp.hero_id ORDER BY num_powers DESC LIMIT 1) AS max_powers JOIN superhero s ON s.id = max_powers.hero_id;	superhero
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire')	superhero
SELECT CAST(SUM(CASE WHEN T5.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.id) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id INNER JOIN `hero_power` AS T4 ON T3.id = T4.hero_id INNER JOIN superpower AS T5 ON T4.power_id = T5.id WHERE T3.alignment = 'Bad';	superhero
SELECT (SELECT COUNT(*) FROM `superhero` JOIN `publisher` ON `superhero`.publisher_id = `publisher`.id WHERE `publisher_name` = 'Marvel Comics') - (SELECT COUNT(*) FROM `superhero` JOIN `publisher` ON `superhero`.publisher_id = `publisher`.id WHERE `publisher_name` = 'DC Comics')	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(subquery.attribute_value) FROM (SELECT SUM(hero_attribute.attribute_value) as attribute_value FROM hero_attribute GROUP BY hero_id) as subquery;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75;	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok';	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female';	superhero
SELECT sp.power_name FROM superhero sh JOIN gender g ON sh.gender_id = g.id JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT s.superhero_name FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Alien';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour';	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56;	superhero
SELECT s.full_name FROM `superhero` AS s JOIN `race` AS r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Bad';	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 169;	superhero
SELECT c.colour FROM `superhero` s JOIN `race` r ON s.race_id = r.id JOIN `colour` c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND r.race = 'human';	superhero
SELECT c.colour FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM `superhero`);	superhero
SELECT CAST(COUNT(CASE WHEN T2.publisher_id = 13 THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id WHERE g.gender = 'Male' AND s.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T1.power_id ORDER BY COUNT(T1.power_id) DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute AS ha JOIN superhero AS s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(*) FROM `hero_power` JOIN `superpower` ON `hero_power.power_id` = `superpower.id` WHERE `superpower.power_name` = 'stealth';	superhero
SELECT s.full_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT CAST((SELECT COUNT(*) FROM superhero WHERE skin_colour_id = 1) AS REAL) / (SELECT COUNT(*) FROM superhero) as average_no_skin_colour	superhero
SELECT COUNT(*) FROM `superhero` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` WHERE `publisher.publisher_name` = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM `superhero` AS s JOIN `hero_attribute` AS ha ON s.id = ha.hero_id JOIN `attribute` AS a ON ha.attribute_id = a.id WHERE s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour FROM `superhero` AS s JOIN `colour` AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';	superhero
SELECT c1.colour AS eyes_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT CAST(SUM(CASE WHEN T3.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.gender) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender = 'Female';	superhero
SELECT superhero_name, race_id FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT T2.gender FROM `superhero` AS T1 JOIN `gender` AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id WHERE hp.power_id IN (SELECT id FROM superpower WHERE power_name = 'Adaptation');	superhero
SELECT COUNT(*) FROM `hero_power` WHERE `hero_id` = (SELECT `id` FROM `superhero` WHERE `superhero_name` = 'Amazo');	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM `superhero` AS s JOIN `colour` AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Gold');	superhero
SELECT s.full_name FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN alignment AS a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM (SELECT ha.hero_id, MAX(ha.attribute_value) AS max_strength FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' GROUP BY ha.hero_id HAVING max_strength = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))) as t;	superhero
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien';	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler')	superhero
SELECT AVG(height_cm) FROM superhero;	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN race ON superhero.race_id = race.id WHERE race.race = 'god/eternal' AND gender.gender = 'Male';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM `superhero` INNER JOIN `alignment` ON `superhero.alignment_id` = `alignment.id` WHERE `alignment.alignment` = 'Neutral';	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM `superhero` AS s JOIN `colour` AS c1 ON s.eye_colour_id = c1.id JOIN `colour` AS c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero sh INNER JOIN publisher p ON sh.publisher_id = p.id WHERE sh.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT CAST(COUNT(CASE WHEN T2.colour = 'Blue' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour FROM `superhero` AS s JOIN `colour` AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT r.race FROM `superhero` s JOIN `race` r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM `superhero` s JOIN `publisher` p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT s.race_id FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT a.alignment, sp.power_name FROM superhero sh JOIN alignment a ON sh.alignment_id = a.id JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3;	superhero
SELECT c.colour FROM `superhero` s JOIN `hero_attribute` ha ON s.id = ha.hero_id JOIN `colour` c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM `superhero` JOIN `alignment` ON `superhero.alignment_id` = `alignment.id` JOIN `gender` ON `superhero.gender_id` = `gender.id` WHERE `alignment.id` = 1 AND `gender.id` = 2;	superhero
SELECT s.superhero_name FROM superhero AS s INNER JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.race FROM `superhero` AS s JOIN `gender` AS g ON s.gender_id = g.id JOIN `colour` AS c ON s.hair_colour_id = c.id WHERE g.gender = 'Male' AND c.colour = 'Blue';	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T3.id = 2;	superhero
SELECT SUM(CASE WHEN T2.colour = 'Blue' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.colour = 'No Colour' THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT ha.attribute_value FROM superhero sh JOIN hero_attribute ha ON sh.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE sh.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM `superhero` sh JOIN `hero_power` hp ON sh.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*) FROM `superhero` JOIN `gender` ON `superhero.gender_id` = `gender.id` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` WHERE `gender.gender` = 'Female' AND `publisher.publisher_name` = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT s.gender_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero s ON hp.hero_id = s.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT s.superhero_name FROM `superhero` AS s JOIN `publisher` AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.race <> 'Human' AND T3.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(DISTINCT ha.hero_id) FROM hero_attribute AS ha JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT T3.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' AND T2.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE hero_id IN(SELECT id FROM superhero WHERE superhero_name = 'Black Panther'));	superhero
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas';	superhero
SELECT CAST(COUNT(CASE WHEN T3.alignment = 'Good' THEN 1 END) AS REAL) * 100 / COUNT(T2.publisher_name) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(id) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT ha.hero_id FROM hero_attribute ha WHERE ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM `superhero` AS s JOIN `hero_attribute` AS ha ON s.id = ha.hero_id JOIN `attribute` AS a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT s.weight_kg, r.race FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE s.id = 40;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral';	superhero
SELECT s.id FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence');	superhero
SELECT c.colour FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM (SELECT r.resultId, r.driverId, r.q1 FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId WHERE ra.raceId = 20 ORDER BY r.q1 LIMIT 5) AS e JOIN drivers AS d ON e.driverId = d.driverId;	formula_1
SELECT d.surname FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN drivers AS d ON r.driverId = d.driverId WHERE ra.raceId = 19 ORDER BY r.q2 ASC LIMIT 1;	formula_1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId JOIN locations AS T3 ON T2.locationId = T3.locationId WHERE T3.name = 'Shanghai';	formula_1
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Germany';	formula_1
SELECT DISTINCT T2.position FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = 'Renault';	formula_1
SELECT COUNT(*) FROM `races` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` WHERE `races.year` = 2010 AND `circuits.country` NOT IN ('China', 'Japan', 'Turkey', 'Bahrain')	formula_1
SELECT DISTINCT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN countries AS T3 ON T1.countryId = T3.countryId WHERE T3.name = 'Spain'	formula_1
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit';	formula_1
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE r.raceId = 24 AND r.points = 1;	formula_1
SELECT T1.q1 FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 354 AND T2.forename = 'Bruno' AND T2.surname = 'Senna';	formula_1
SELECT d.nationality FROM qualifying AS q JOIN races AS r ON q.raceId = r.raceId JOIN results AS res ON q.driverId = res.driverId AND q.constructorId = res.constructorId JOIN drivers AS d ON res.driverId = d.driverId WHERE q.q2Time = '01:40.000' AND r.raceId = 355;	formula_1
SELECT T2.number FROM qualifying AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '01:54%'	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NULL;	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.resultId = 901;	formula_1
SELECT COUNT(DISTINCT T2.driverId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.date = '2015-11-29' AND T2.statusId = 1;	formula_1
SELECT d.name FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob LIMIT 1;	formula_1
SELECT T3.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 161 AND T1.time LIKE '0:01:%';	formula_1
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 AND T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);	formula_1
SELECT c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors AS c JOIN (SELECT * FROM results WHERE raceId = 9 AND points = (SELECT MAX(points) FROM results WHERE raceId = 9)) AS r ON c.constructorId = r.constructorId;	formula_1
SELECT r.Q1 FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN drivers AS d ON r.driverId = d.driverId WHERE ra.raceId = 345 AND d.driverName = 'Lucas di Grassi';	formula_1
SELECT D.nationality FROM qualifying AS Q JOIN races AS R ON Q.raceId = R.raceId JOIN results AS Res ON Q.driverId = Res.driverId JOIN drivers AS D ON Res.driverId = D.driverId WHERE Q.q2 = '01:15' AND R.raceId = 347;	formula_1
SELECT d.code FROM `qualifying` AS q JOIN `races` AS r ON q.raceId = r.raceId JOIN `drivers` AS d ON q.driverId = d.driverId WHERE r.raceId = 45 AND q.q3 LIKE '01:33%'	formula_1
SELECT r.time FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId WHERE r.raceId = 743 AND d.forename = 'Bruce' AND d.surname = 'McLaren';	formula_1
SELECT d.name FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN drivers AS d ON r.driverId = d.driverId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT T2.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.resultId = 901;	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND results.time IS NULL;	formula_1
SELECT d.driverId, d.dob FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT T2.forename, T2.surname FROM (SELECT driverId FROM results WHERE raceId = 348 AND positionOrder = (SELECT MIN(positionOrder) FROM results WHERE raceId = 348)) AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId;	formula_1
SELECT d.nationality FROM drivers AS d JOIN (SELECT driverId FROM results WHERE fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)) AS r ON d.driverId = r.driverId;	formula_1
SELECT ((T1.fastestLapSpeed - T2.fastestLapSpeed) * 100 / T1.fastestLapSpeed) AS percentage_difference FROM(SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS T1, (SELECT fastestLapSpeed FROM results WHERE raceId = 854) AS T2	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T2.driverId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.date = '1983-07-16';	formula_1
SELECT MIN(year) FROM races WHERE raceName = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM `races` WHERE year = 2005; SELECT name FROM `races` WHERE year = 2005 ORDER BY date DESC;	formula_1
SELECT raceName FROM races WHERE strftime('%Y-%m', date) = (SELECT strftime('%Y-%m', MIN(date)) FROM races);	formula_1
SELECT T1.name, T1.date FROM races AS T1 WHERE T1.round = (SELECT MAX(T2.round) FROM races AS T2 WHERE T2.year = 1999) AND T1.year = 1999;	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000);	formula_1
SELECT c.circuitName, c.Location, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT r.year FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch' AND r.raceName = 'British Grand Prix' ORDER BY r.year DESC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT R.year) AS Seasons FROM circuits C JOIN races R ON C.circuitId = R.circuitId WHERE C.name = 'Silverstone' AND R.name = 'British Grand Prix';	formula_1
SELECT d.driverName FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId JOIN races AS ra ON r.raceId = ra.raceId WHERE ra.year = 2010 AND ra.name = 'Singapore Grand Prix' ORDER BY r.positionOrder;	formula_1
SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points FROM results JOIN drivers ON results.driverId = drivers.driverId GROUP BY results.driverId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT r.year, rd.forename, rd.surname, rl.points FROM (SELECT * FROM results WHERE resultId IN (SELECT MIN(resultId) FROM results GROUP BY driverId)) AS rl JOIN races AS ra ON rl.raceId = ra.raceId JOIN drivers AS rd ON rl.driverId = rd.driverId WHERE ra.year = 2017 AND ra.raceName = 'Chinese Grand Prix' ORDER BY rl.points DESC LIMIT 3;	formula_1
SELECT D.forename, D.surname, R.name FROM results AS Res JOIN drivers AS D ON Res.driverId = D.driverId JOIN races AS R ON Res.raceId = R.raceId WHERE Res.milliseconds = (SELECT MIN(milliseconds) FROM results);	formula_1
SELECT AVG(T1.milliseconds) AS avg_lap_time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = 'Malaysian Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT CAST(SUM(CASE WHEN T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.surname = 'Hamilton' AND T3.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(r.points) AS max_points FROM (SELECT driverId, COUNT(*) as wins FROM results WHERE position = 1 GROUP BY driverId ORDER BY wins DESC LIMIT 1) AS w JOIN results r ON w.driverId = r.driverId JOIN drivers d ON w.driverId = d.driverId;	formula_1
SELECT name, dob FROM (SELECT drivers.name, drivers.dob, YEAR(CURRENT_TIMESTAMP) - strftime('%Y', drivers.dob) AS age FROM drivers WHERE nationality = 'Japanese') ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.circuitRef FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE strftime('%Y', r.date) BETWEEN '1990' AND '2000' GROUP BY c.circuitId HAVING COUNT(*) = 4;	formula_1
SELECT c.circuitName, c.location, r.name FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.year = 2006 AND c.country = 'USA';	formula_1
SELECT R.raceName, C.circuitName, C.location FROM races AS R JOIN circuits AS C ON R.circuitId = C.circuitId WHERE strftime('%m', R.date) = '09' AND strftime('%Y', R.date) = '2005';	formula_1
SELECT r.name FROM races AS r JOIN results AS res ON r.raceId = res.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(T1.resultId) AS win_count FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T4.forename = 'Michael' AND T4.surname = 'Schumacher' AND T3.name = 'Sepang International Circuit' AND T1.positionOrder = 1;	formula_1
SELECT r.name AS race_name, r.year AS race_year FROM results AS res JOIN races AS r ON res.raceId = r.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(T1.points) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.name = 'Eddie Irvine' AND T2.year = 2000;	formula_1
SELECT r.year, res.points FROM drivers AS d JOIN results AS res ON d.driverId = res.driverId JOIN races AS r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT r.name AS Race_Name, l.country AS Country FROM races r JOIN locations l ON r.locationId = l.locationId WHERE strftime('%Y', r.date) = '2017' ORDER BY r.date;	formula_1
SELECT r.name AS race_name, r.year, c.location FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE rs.laps = (SELECT MAX(laps) FROM results)	formula_1
SELECT CAST(SUM(CASE WHEN T2.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.raceId) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT c.country FROM circuits AS c WHERE c.alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT name FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE driverId = 1;	formula_1
SELECT c.circuitName FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone';	formula_1
SELECT R.name AS Race_Name, C.circuitRef AS Circuit_Reference, R.url AS Race_URL FROM races AS R JOIN circuits AS C ON R.circuitId = C.circuitId WHERE C.name = 'Silverstone';	formula_1
SELECT r.time FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.name = 'Abu Dhabi';	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy';	formula_1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.raceName = 'Spanish Grand Prix' AND T2.year = 2009;	formula_1
SELECT MIN(T2.fastestLapTime) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT T3.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = 'Canadian Grand Prix' AND T2.year = 2007 ORDER BY T1.position ASC LIMIT 1;	formula_1
SELECT r.raceName, r.year, r.round FROM results AS res JOIN drivers AS d ON res.driverId = d.driverId JOIN races AS r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.raceName FROM results AS rs JOIN drivers AS d ON rs.driverId = d.driverId JOIN races AS r ON rs.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY rs.rank ASC LIMIT 1;	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT T1.positionOrder FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix'	formula_1
SELECT D.forename, D.surname FROM results AS R JOIN races AS Ra ON R.raceId = Ra.raceId JOIN drivers AS D ON R.driverId = D.driverId WHERE Ra.year = 1989 AND Ra.raceName = 'Australian Grand Prix' AND R.grid = 4;	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.time IS NOT NULL;	formula_1
SELECT T1.fastestLapTime FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T1.raceId IN (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008);	formula_1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.rank = 2	formula_1
SELECT d.url FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN races AS ra ON ra.raceId = r.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.positionOrder = 1;	formula_1
SELECT COUNT(DISTINCT T3.driverId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T3.nationality = 'British';	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Chinese Grand Prix' AND T1.time IS NOT NULL;	formula_1
SELECT SUM(results.points) AS total_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(strftime('%s', time(fastestLapTime)) - strftime('%s', '00:00.000')) AS avg_fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T2.resultId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix';	formula_1
SELECT ((julianday(T2.time) - julianday(T1.time)) / julianday(T1.time)) * 100 AS percentage_faster FROM (SELECT T3.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN results AS T3 ON T1.raceId = T3.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix' AND T1.positionOrder = 1) AS T1, (SELECT T4.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN results AS T4 ON T1.raceId = T4.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix' ORDER BY T4.positionOrder DESC LIMIT 1) AS T2	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE dob > '1980-01-01' AND nationality = 'British';	formula_1
SELECT MAX(T1.points) FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'British';	formula_1
SELECT c.constructorRef, SUM(r.points) as total_points FROM results r JOIN constructors c ON r.constructorId = c.constructorId GROUP BY r.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.constructorName FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE r.raceId = 291 AND r.points = 0;	formula_1
SELECT COUNT(*) FROM (SELECT c.constructorId FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE c.nationality = 'Japanese' AND r.points = 0 GROUP BY c.constructorId HAVING COUNT(r.raceId) = 2)	formula_1
SELECT c.constructorRef FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE r.rank = 1;	formula_1
SELECT COUNT(DISTINCT T2.constructorId) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'French' AND T2.laps > 50;	formula_1
SELECT CAST(SUM(CASE WHEN T3.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.nationality = 'Japanese' AND T3.year BETWEEN 2007 AND 2009;	formula_1
SELECT AVG(strftime('%s', T2.time)) AS avg_time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.positionOrder = 1 AND strftime('%Y', T1.date) < '1975' AND T2.time IS NOT NULL;	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) > '1975' AND r.rank = 2;	formula_1
SELECT COUNT(*) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.time IS NULL AND drivers.nationality = 'Italian';	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT T2.fastestLap FROM (SELECT raceId FROM races WHERE year = 2009) AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.positionOrder = 1;	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009;	formula_1
SELECT r.name, r.year FROM races AS r JOIN (SELECT raceId, MIN(milliseconds) AS min_time FROM results WHERE milliseconds IS NOT NULL GROUP BY raceId) AS rt ON r.raceId = rt.raceId ORDER BY rt.min_time ASC LIMIT 1;	formula_1
SELECT CAST(COUNT(CASE WHEN T1.dob < '1985-01-01' AND T2.laps > 50 THEN T1.driverId END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE strftime('%Y', T2.date) BETWEEN '2000' AND '2005';	formula_1
SELECT COUNT(*) FROM drivers AS d JOIN constructorResults AS cr ON d.driverId = cr.driverId JOIN lapTimes AS lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < '02:00.00';	formula_1
SELECT * FROM drivers WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT driverId FROM (SELECT driverId, dob FROM drivers ORDER BY dob DESC LIMIT 3) AS youngest_drivers WHERE nationality = 'Dutch';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.driverRef, MIN(fastestLapTime.time) AS earliest_lap_time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN fastestLapTime f ON r.raceId = f.raceId AND r.driverId = f.driverId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverRef ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT d.driverId, d.code FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) = '1971' GROUP BY d.driverId HAVING r.fastestLapTime IN (SELECT MIN(fastestLapTime) FROM results WHERE driverId = d.driverId);	formula_1
SELECT d.driverName FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN races AS ra ON r.raceId = ra.raceId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' ORDER BY r.time DESC LIMIT 10;	formula_1
SELECT r.year FROM races AS r JOIN results AS rs ON r.raceId = rs.raceId WHERE rs.fastestLapTime IS NOT NULL ORDER BY rs.fastestLapTime ASC LIMIT 1;	formula_1
SELECT r.year FROM results AS res JOIN races AS r ON res.raceId = r.raceId WHERE res.time IS NOT NULL OR res.milliseconds IS NOT NULL ORDER BY CASE WHEN res.time IS NOT NULL THEN res.time ELSE CAST(res.milliseconds AS REAL) / 1000 END DESC LIMIT 1;	formula_1
SELECT T1.driverId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLap = 1 GROUP BY T1.driverId ORDER BY MIN(T2.time) ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM `results` JOIN `status` ON `results`.`statusId` = `status`.`statusId` WHERE `results`.`raceId` BETWEEN 50 AND 100 AND `status`.`status` = 'Disqualified';	formula_1
SELECT c.location, c.lat, c.lng FROM circuits AS c JOIN countries AS co ON c.countryId = co.countryId WHERE co.name = 'Austria';	formula_1
SELECT raceId, COUNT(*) AS num_finishers FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY num_finishers DESC LIMIT 1;	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.raceId = 23 AND T2.q2 IS NOT NULL;	formula_1
SELECT T3.year, T3.name, T3.date, T3.time FROM (SELECT T1.driverId, MIN(T2.date) AS first_race_date FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId IN (SELECT driverId FROM drivers ORDER BY dob DESC LIMIT 1)) AS T1 JOIN races AS T3 ON T1.first_race_date = T3.date	formula_1
SELECT COUNT(DISTINCT T3.driverId) FROM status AS T1 JOIN results AS T2 ON T1.statusId = T2.statusId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.status = 'Puncture' AND T3.nationality = 'American';	formula_1
SELECT c.url FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE c.nationality = 'Italian' GROUP BY c.constructorId ORDER BY SUM(r.points) DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE r.positionOrder = 1 GROUP BY c.constructorId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT T1.driverId, MAX(T3.time) AS slowest_time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN lap_times AS T3 ON T1.resultId = T3.resultId WHERE T2.name = 'French Grand Prix' AND T3.lap = 3 GROUP BY T1.driverId ORDER BY slowest_time DESC LIMIT 1;	formula_1
SELECT T2.name AS race_name, MIN(T1.milliseconds) AS fastest_time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId GROUP BY T2.name ORDER BY fastest_time ASC LIMIT 1;	formula_1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank < 11;	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN status AS s ON d.driverId = s.driverId JOIN results AS r ON r.raceId = s.raceId AND r.constructorId = s.constructorId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverId ORDER BY AVG(r.duration) ASC LIMIT 3;	formula_1
SELECT T3.driverRef, T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2008 AND T1.name = 'Canadian Grand Prix' AND T2.position = '1';	formula_1
SELECT c.constructorRef, c.url FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE r.raceId = (SELECT raceId FROM races WHERE year = 2009 AND name = 'Singapore Grand Prix') AND r.positionOrder = 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND strftime('%Y', dob) BETWEEN '1981' AND '1991';	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND strftime('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE circuitName = 'Hungaroring';	formula_1
SELECT SUM(T2.points) AS total_points, T3.name, T3.nationality FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.name = 'Monaco Grand Prix' AND T1.year BETWEEN 1980 AND 2010 GROUP BY T2.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(T1.points) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.name = 'Lewis Hamilton' AND T2.name = 'Turkish Grand Prix';	formula_1
SELECT CAST(COUNT(*) AS REAL) / 10 AS annual_average FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT nationality, COUNT(*) as count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT COUNT(*) AS victories FROM(SELECT * FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE positionOrder = 1 AND points IN(SELECT points FROM(SELECT points FROM results ORDER BY points DESC LIMIT 90, 1)) GROUP BY results.driverId)	formula_1
SELECT T1.raceName FROM races AS T1 JOIN (SELECT raceId, MIN(fastestLapSpeed) as min_speed FROM results GROUP BY raceId) AS T2 ON T1.raceId = T2.raceId WHERE T2.min_speed = (SELECT MIN(fastestLapSpeed) FROM results)	formula_1
SELECT c.circuitName || ', ' || cr.country AS full_location FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN countries cr ON c.country = cr.id WHERE r.date = (SELECT MAX(date) FROM races)	formula_1
SELECT T4.forename, T4.surname FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId JOIN drivers AS T4 ON T2.driverId = T4.driverId WHERE T1.year = 2008 AND T1.circuitId IN (SELECT circuitId FROM circuits WHERE circuitName = 'Marina Bay Street Circuit') ORDER BY T2.q3 ASC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, d.nationality, r.name AS race_name FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MAX(dob) FROM drivers)	formula_1
SELECT COUNT(*) AS num_accidents FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Canadian Grand Prix' AND results.statusId = 3 GROUP BY results.driverId ORDER BY num_accidents DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, COUNT(r.resultId) AS wins FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON ra.raceId = r.raceId WHERE r.positionOrder = 1 AND d.driverId = (SELECT driverId FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)) GROUP BY d.driverId ORDER BY wins DESC LIMIT 1;	formula_1
SELECT MAX(duration) FROM pit_stops;	formula_1
SELECT MIN(fastestLapTime) FROM results;	formula_1
SELECT MAX(pit_stops.duration) AS longest_pit_stop FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN pit_stops ON results.raceId = pit_stops.raceId AND results.driverId = pit_stops.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
{     "chain_of_thought_reasoning": "To determine the lap during which Lewis Hamilton took a pit stop, we need to look for information related to pit stops. However, there is no direct column in the provided schema that indicates pit stops. Instead, we can infer that a pit stop might have occurred if there's a significant difference in time between consecutive laps for a driver. Since this requires data not directly available from the given tables (specifically lap-by-lap timing), and considering the hint does not provide additional guidance, we cannot construct an SQL query to accurately answer the question with the provided schema alone.",     "SQL": "" }	formula_1
SELECT ps.duration FROM pitStops AS ps JOIN results AS r ON ps.raceId = r.raceId AND ps.driverId = r.driverId WHERE r.raceId IN (SELECT r2.raceId FROM races AS r2 JOIN circuits AS c ON r2.circuitId = c.circuitId WHERE r2.year = 2011 AND c.circuitRef = 'albert_park') ORDER BY ps.stop ASC;	formula_1
SELECT MIN(results.time) AS Lap_Record FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.fastestLapTime IS NOT NULL ORDER BY r.points DESC LIMIT 1;	formula_1
SELECT c.position FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId JOIN results AS res ON r.raceId = res.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND res.fastestLapTime IN (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT MIN(results.milliseconds) AS lap_record FROM results JOIN races ON results.raceId = races.raceId WHERE races.circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix');	formula_1
SELECT MIN(results.milliseconds) AS Lap_Record FROM results JOIN races ON results.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT r.raceName FROM results AS res JOIN races AS r ON res.raceId = r.raceId WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT T2.time - T2.milliseconds AS pit_stop_duration FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId JOIN results AS res ON r.raceId = res.raceId WHERE res.fastestLapTime = '1:29.488';	formula_1
SELECT AVG(milliseconds) AS avg_pit_stop_time FROM results WHERE driverId = 1;	formula_1
SELECT AVG(milliseconds) FROM results WHERE milliseconds IS NOT NULL;	formula_1
SELECT api_player_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT T2.name, MAX(T1.height) FROM `Player` AS T1 JOIN `Person` AS T2 ON T1.person_id = T2.id WHERE T1.height IS NOT NULL;	european_football_2
SELECT pa.player_fifa_api_id, pa.preferred_foot FROM Player_Attributes pa JOIN (SELECT player_fifa_api_id, MAX(date) AS max_date FROM Player_Attributes GROUP BY player_fifa_api_id) pa2 ON pa.player_fifa_api_id = pa2.player_fifa_api_id AND pa.date = pa2.max_date WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating >= 60 AND overall_rating < 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_id FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT T2.name AS league_name, SUM(T1.home_team_goal + T1.away_team_goal) AS total_goals FROM `Match` AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT T2.team_long_name FROM `Match` AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.season = '2015/2016' AND T1.home_team_goal < T1.away_team_goal GROUP BY T1.home_team_api_id ORDER BY COUNT(*) ASC LIMIT 1;	european_football_2
SELECT T2.player_name, SUM(T1.penalties) AS total_penalties FROM `Match` AS T1 JOIN Player AS T2 ON T1.home_team = T2.team_id WHERE T1.penalties IS NOT NULL GROUP BY T2.player_name ORDER BY total_penalties DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS M2 ON T1.team_api_id = M2.away_team_api_id WHERE M2.league_id IN (SELECT League.id FROM League WHERE League.name = 'Scotland Premier League') AND M2.season = '2009/2010' AND M2.away_team_goal > M2.home_team_goal GROUP BY M2.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT T1.team_name, T2.buildUpPlaySpeed FROM `Team` AS T1 JOIN (SELECT team_api_id, MAX(buildUpPlaySpeed) AS buildUpPlaySpeed FROM `Team_Attributes` GROUP BY team_api_id ORDER BY buildUpPlaySpeed DESC LIMIT 4) AS T2 ON T1.team_api_id = T2.team_api_id;	european_football_2
SELECT T2.name AS league_name FROM (SELECT T3.country_id, T3.league_id, COUNT(*) AS draw_count FROM Match AS T1 JOIN Country AS T2 ON T1.country_id = T2.id JOIN League AS T3 ON T1.league_id = T3.id WHERE T1.home_team_goal = T1.away_team_goal AND T1.season = '2015/2016' GROUP BY T3.country_id, T3.league_id) AS T4 JOIN Country AS T2 ON T4.country_id = T2.id ORDER BY draw_count DESC LIMIT 1;	european_football_2
SELECT strftime('%Y', 'now') - strftime('%Y', T2.birthday) AS age FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_api_id WHERE T1.sprint_speed >= 97 AND strftime('%Y', T1.date) BETWEEN '2013' AND '2015'	european_football_2
SELECT L.name AS league_name, COUNT(M.league_id) AS total_matches FROM Match M JOIN (SELECT league_id, COUNT(*) AS match_count FROM Match GROUP BY league_id ORDER BY match_count DESC LIMIT 1) AS SubQuery ON M.league_id = SubQuery.league_id JOIN League L ON M.league_id = L.id;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01' AND birthday < '1996-01-01';	european_football_2
SELECT P.player_api_id FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_fifa_api_id = P.player_fifa_api_id WHERE substr(PA.date, 1, 4) = '2010' GROUP BY P.player_api_id HAVING MAX(PA.overall_rating) > AVG(PA.overall_rating);	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL);	european_football_2
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.player_fifa_api_id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T2.birthday) BETWEEN '1987' AND '1992';	european_football_2
SELECT L.league_name, SUM(M.home_team_goal + M.away_team_goal) as total_goals FROM Match M JOIN League L ON M.league_id = L.id GROUP BY L.league_name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(T1.long_shots) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.name = 'Ahmed Samir Farag';	european_football_2
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_fifa_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM (SELECT AVG(chanceCreationPassing) AS avg_chance_creation_passing FROM Team_Attributes WHERE date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00' AND buildUpPlayDribblingClass = 'Normal') AS avg_passing, Team_Attributes T WHERE T.date >= '2014-01-01 00:00:00' AND T.date <= '2014-01-31 00:00:00' AND T.buildUpPlayDribblingClass = 'Normal' AND T.chanceCreationPassing < avg_passing.avg_chance_creation_passing ORDER BY T.chanceCreationPassing DESC;	european_football_2
SELECT L.name FROM `League` AS L JOIN `Match` AS M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.id HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal);	european_football_2
SELECT T2.team_short_name FROM `Team` AS T1 JOIN `Team_Attributes` AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Queens Park Rangers'	european_football_2
SELECT * FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10';	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Franco Zennaro'	european_football_2
SELECT ta.buildUpPlayPositioningClass FROM Team_Attributes AS ta JOIN Teams AS t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'ADO Den Haag';	european_football_2
SELECT pa.heading_accuracy FROM `Player_Attributes` AS pa JOIN `Player` AS p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.name = 'Francois Affolter' AND pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM `Player_Attributes` AS pa JOIN `Player` AS p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM `Match` JOIN League ON `Match`.league_id = League.id WHERE League.name = 'Scotland Premier League' AND `Match`.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM `Player` p JOIN `Player_Attributes` pa ON p.player_api_id = pa.player_fifa_api_id WHERE p.birth_date = (SELECT MAX(birth_date) FROM `Player`)	european_football_2
SELECT * FROM `Player` WHERE potential = (SELECT MAX(potential) FROM `Player`);	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT T1.team_short_name FROM `Team` AS T1 JOIN `Team_Attributes` AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.defensive_work_rate FROM `Player` p JOIN `Player_Attributes` pa ON p.player_api_id = pa.player_fifa_api_id WHERE p.player_name = 'David Wilson';	european_football_2
SELECT T2.birthday FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT L.name FROM `League` AS L JOIN `Country` AS C ON L.country_id = C.id WHERE C.name = 'Netherlands';	european_football_2
SELECT AVG(T1.home_team_goal) FROM `Match` AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id INNER JOIN Season AS T3 ON T1.season_id = T3.id WHERE T2.name = 'Poland' AND T3.season = '2010/2011';	european_football_2
SELECT MAX(CASE WHEN T1.height = (SELECT MIN(height) FROM Player) THEN AVG(T2.finishing) END) AS shortest_avg_finishing_rate ,  MAX(CASE WHEN T1.height = (SELECT MAX(height) FROM Player) THEN AVG(T2.finishing) END) AS highest_avg_finishing_rate FROM `Player` AS T1 INNER JOIN `Player_Attributes` AS T2 ON T1.player_id = T2.player_fifa_api_id GROUP BY T1.player_id	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height > 180;	european_football_2
SELECT COUNT(player_id) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `player_name_first` = 'Adam' AND `weight` > 170;	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.overall_rating > 80 AND strftime('%Y', T2.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT pa.potential FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Aaron Doran';	european_football_2
SELECT player_id FROM Player WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Statistics AS T2 ON T1.team_id = T2.team_id WHERE T1.team_short_name = 'CLB';	european_football_2
SELECT T.team_short_name FROM `Team` AS T INNER JOIN `MatchStats` AS MS ON T.team_api_id = MS.team_api_id WHERE MS.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating) FROM Player AS t1 JOIN Player_Attributes AS t2 ON t1.id = t2.player_fifa_api_id WHERE strftime('%Y', date) BETWEEN '2010' AND '2015' AND t1.height > 170;	european_football_2
SELECT MIN(height), player_fifa_api_id FROM Player_Attributes WHERE height IS NOT NULL;	european_football_2
SELECT country FROM League WHERE name = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM `Match` JOIN League ON `Match`.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T2.team_short_name FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.match_home_team = T2.team_id WHERE T1.home_team_goal = 10;	european_football_2
SELECT * FROM Player_Attributes WHERE potential = 61 ORDER BY balance DESC LIMIT 1;	european_football_2
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) AS diff_avg_ball_control FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT T1.Name, T1.Birthday FROM Player AS T1 WHERE T1.Name = 'Aaron Lennon' OR T1.Name = 'Abdelaziz Barrada';	european_football_2
SELECT MAX(height) FROM Player;	european_football_2
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT country FROM `League` WHERE name = 'Belgium Jupiler League';	european_football_2
SELECT l.name FROM `League` AS l JOIN `Country` AS c ON l.country_id = c.id WHERE c.name = 'Germany';	european_football_2
SELECT MAX(overall_rating) FROM Player;	european_football_2
SELECT COUNT(DISTINCT p.id) FROM Player AS p WHERE strftime('%Y', p.birthday) < '1986' AND p.defensive_work_rate = 'high';	european_football_2
SELECT p.name FROM Player AS p WHERE p.crossing = (SELECT MAX(crossing) FROM Player)	european_football_2
SELECT ps.stat1 FROM `Player` p JOIN `Player_Stats` ps ON p.player_id = ps.player_id WHERE p.player_name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*) FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height > 180 AND T2.volleys > 70;	european_football_2
SELECT name FROM Player WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*) FROM `Match` JOIN League ON `Match`.league_id = League.id JOIN Country ON League.country_id = Country.id WHERE `Match`.season = '2008/2009' AND Country.name = 'Belgium';	european_football_2
SELECT pa.long_passing FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_fifa_api_id = p.player_fifa_api_id ORDER BY p.birth_date ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT L.name AS league_name, COUNT(M.id) AS match_count FROM `League` AS L JOIN `Match` AS M ON L.id = M.league_id WHERE M.season = '2008/2009' GROUP BY L.name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(T2.overall_rating) FROM Player_Attributes AS T2 JOIN Player AS T1 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986';	european_football_2
SELECT CAST(( ( SELECT overall_rating FROM Player WHERE player_name = 'Ariel Borysiuk' ) - ( SELECT overall_rating FROM Player WHERE player_name = 'Paulin Puel' ) ) AS REAL) * 100 / ( SELECT overall_rating FROM Player WHERE player_name = 'Paulin Puel' );	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM Team WHERE team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(TA.chanceCreationPassing), TA.chanceCreationPassingClass FROM Team_Attributes AS TA JOIN Team AS T ON TA.team_api_id = T.team_api_id WHERE T.team_long_name = 'Ajax'	european_football_2
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.id WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(Match.away_team_goal) FROM Match JOIN League ON Match.league_id = League.league_id WHERE League.country = 'Italy' AND Match.away_team = (SELECT Team.team_api_id FROM Team WHERE Team.team_long_name = 'Parma');	european_football_2
SELECT T2.name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id JOIN Date AS T3 ON T3.date_id = T1.date WHERE T3.date LIKE '2016-06-23%' AND T1.overall_rating = 77 ORDER BY T2.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM `Player_Attributes` AS pa JOIN `Player` AS p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%'	european_football_2
SELECT pa.potential FROM `Match` m JOIN Player_Attributes pa ON m.match_api_id = pa.match_api_id JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE m.date = '2010-08-30 00:00:00' AND p.player_name = 'Francesco Parravicini'	european_football_2
SELECT pa.attacking_work_rate FROM `Match` m JOIN Player_Attributes pa ON m.player_fifa_api_id = pa.player_fifa_api_id WHERE m.date LIKE '2015-05-01%' AND m.player_name = 'Francesco Migliore';	european_football_2
SELECT pa.defensive_work_rate FROM `Match` m JOIN Player_Attributes pa ON m.match_api_id = pa.match_api_id WHERE pa.player_name = 'Kevin Berigaud' AND m.date = '2013-02-22 00:00:00';	european_football_2
SELECT m.date FROM `Match` AS m JOIN Player_Attributes AS pa ON m.player_fifa_api_id = pa.player_fifa_api_id WHERE pa.player_name = 'Kevin Constant' ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT M.buildUpPlaySpeedClass FROM `Match` AS M JOIN Team AS T ON M.home_team_api_id = T.team_api_id WHERE M.date = '2012-02-22' AND T.team_long_name = 'Willem II'	european_football_2
SELECT M.buildUpPlayDribblingClass FROM `Match` AS M JOIN `Team` AS T ON (T.team_api_id = M.home_team AND T.team_short_name = 'LEI') OR (T.team_api_id = M.away_team AND T.team_short_name = 'LEI') WHERE M.date = '2015-09-10 00:00:00';	european_football_2
SELECT M.buildUpPlayPassingClass FROM `Match` AS M JOIN Team AS T ON M.home_team_api_id = T.team_api_id WHERE M.date LIKE '2010-02-22%' AND T.team_long_name = 'FC Lorient' UNION SELECT M.buildUpPlayPassingClass FROM `Match` AS M JOIN Team AS T ON M.away_team_api_id = T.team_api_id WHERE M.date LIKE '2010-02-22%' AND T.team_long_name = 'FC Lorient'	european_football_2
SELECT M.chance_creation_passing FROM `Match` AS M JOIN Team AS T ON M.team_api_id = T.team_api_id WHERE T.team_long_name = 'PEC Zwolle' AND M.date = '2013-09-20 00:00:00'	european_football_2
SELECT M.chance_creation_crossing_class FROM `Match` AS M JOIN Team AS T ON M.team_api_id = T.team_api_id WHERE M.date = '2010-02-22 00:00:00' AND T.team_long_name = 'Hull City'	european_football_2
SELECT T1.defence_aggression_class FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.date LIKE '2015-09-10%' AND T1.team_long_name = 'Hannover 96';	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT CAST((p1.overall_rating - p2.overall_rating) AS REAL) / p1.overall_rating * 100 AS percentage_difference FROM (SELECT overall_rating FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan') AND date = '2013-07-12') p1, (SELECT overall_rating FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') AND date = '2013-07-12') p2	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT pa.player_api_id FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_api_id = p.player_api_id WHERE p.weight IS NOT NULL ORDER BY p.weight DESC LIMIT 10;	european_football_2
SELECT name FROM Player WHERE datetime('now', 'localtime') - datetime(birthday) > '34 years';	european_football_2
SELECT COUNT(*) FROM `Match` m JOIN `Goal` g ON m.match_id = g.match_id JOIN `Player` p ON g.player_id = p.player_id WHERE m.home_team_goal > 0 AND p.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(T4.goal) AS total_goals FROM `Match` AS T1 INNER JOIN Team AS T2 ON T1.match_away_team_id = T2.team_id INNER JOIN Player AS T3 ON T2.team_id = T3.player_team_id INNER JOIN Goal AS T4 ON T1.match_id = T4.goal_match_id WHERE (T3.player_name = 'Daan Smith' OR T3.player_name = 'Filipe Ferreira') AND T1.match_home_away = 'AWAY';	european_football_2
SELECT SUM(T3.home_team_goal) FROM (SELECT T1.*, T2.team_id AS player_team_id, T3.match_id, T3.home_team_goal FROM Player AS T1 JOIN Team AS T2 ON T1.player_team_id = T2.team_id JOIN Match AS T3 ON T2.team_id = T3.home_team_id WHERE (datetime('now') - datetime(T1.birthday)) / 365.25 <= 30) AS T3;	european_football_2
SELECT name FROM Player ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT name FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes) GROUP BY player_fifa_api_id;	european_football_2
SELECT DISTINCT T1.player_name FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.attacking_work_rate = 'high';	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.finishing = 1 ORDER BY datetime('now') - datetime(T1.birthday) DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE country = 'Belgium';	european_football_2
SELECT T2.name FROM `Player` AS T1 JOIN `Country` AS T2 ON T1.country_id = T2.id WHERE T1.vision > 89;	european_football_2
SELECT C.country_name, AVG(P.weight) AS avg_weight FROM Player P JOIN Country C ON P.country_id = C.country_id GROUP BY C.country_name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T1.team_short_name FROM `Team` AS T1 JOIN `Match` AS M1 ON T1.team_api_id = M1.home_team_api_id OR T1.team_api_id = M1.away_team_api_id WHERE M1.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(T1.height) FROM `Player` AS T1 INNER JOIN `Country` AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Italy';	european_football_2
SELECT DISTINCT T2.player_name FROM `Player_Attributes` AS T1 INNER JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 ORDER BY T2.player_name LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND strftime('%Y', birthday) > '1990';	european_football_2
SELECT (SELECT jumping FROM `Player` WHERE id = 6) - (SELECT jumping FROM `Player` WHERE id = 23);	european_football_2
SELECT player_fifa_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM (SELECT pa.player_id FROM `Player_Attributes` AS pa JOIN `Player` AS p ON pa.player_id = p.player_id WHERE pa.crossing = (SELECT MAX(crossing) FROM `Player_Attributes`) AND p.preferred_foot = 'left' GROUP BY pa.player_id)	european_football_2
SELECT CAST(SUM(CASE WHEN T2.strength > 80 AND T2.stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.strength > 80 AND T2.stamina > 80;	european_football_2
SELECT L.country FROM `League` AS L JOIN `Match` AS M ON L.id = M.league_id WHERE L.name = 'Poland Ekstraklasa';	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM `Match` AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player WHERE player_name = 'Alexis Blin';	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM `Teams` AS T1 JOIN `Team_Attributes` AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM `Match` WHERE `season` = '2015/2016' AND `country_id` = 1;	european_football_2
SELECT MAX(M.home_team_goal) FROM `Match` AS M JOIN League AS L ON M.country_id = L.id WHERE L.country = 'Netherlands' AND L.name = 'Eredivisie';	european_football_2
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_id = T2.player_id INNER JOIN Attribute_Definitions AS T3 ON T1.attribute_id = T3.id WHERE T2.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT L.name, COUNT(M.id) AS game_count FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY M.league_id ORDER BY game_count DESC LIMIT 4;	european_football_2
SELECT T2.team_long_name FROM `Match` AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.away_team_goal = (SELECT MAX(away_team_goal) FROM `Match`)	european_football_2
SELECT T1.name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT CAST(SUM(CASE WHEN T2.height < 180 AND T1.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.date = (SELECT MAX(date) FROM Player_Attributes WHERE player_fifa_api_id = T2.player_fifa_api_id);	european_football_2
SELECT (COUNT(CASE WHEN T1.SEX = 'M' AND T2.Admission = '+' THEN T1.ID END) - COUNT(CASE WHEN T1.SEX = 'M' AND T2.Admission = '-' THEN T1.ID END)) / CAST(COUNT(CASE WHEN T1.SEX = 'M' THEN T1.ID END) AS REAL) * 100 AS percentage_deviation FROM Patient AS T1 JOIN Admission AS T2 ON T1.Patient_ID = T2.Patient_ID;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.subject_id) FROM `Laboratory` AS T1 JOIN `Patients` AS T2 ON T1.subject_id = T2.subject_id WHERE strftime('%Y', T2.Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT DISTINCT T2.Disease, T1.Date FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = '30609';	thrombosis_prediction
SELECT P.Sex, P.Birthday, E.Examination_Date, S.Description FROM Patient AS P JOIN Examination AS E ON P.ID = E.Patient_ID JOIN Symptom AS S ON E.Symptom_ID = S.ID WHERE P.ID = '163109';	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.BIRTHDATE FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500;	thrombosis_prediction
SELECT T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient_ID WHERE T2.RVVT = '+'	thrombosis_prediction
SELECT T1.ID, T1.Sex, T3.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID JOIN `Diagnosis` AS T3 ON T1.ID = T3.ID WHERE T2.thrombosis = 2;	thrombosis_prediction
SELECT p.ID, p.Name FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE strftime('%Y', p.BirthDate) = '1937' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT T1.ID, T1.Sex, T2.Diagnosis FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID INNER JOIN `Diagnosis` AS T3 ON T1.ID = T3.ID WHERE T2.ALB < 3.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.TP < '6.0' OR T2.TP > '8.5' THEN T1.patient_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.patient_id) FROM patient AS T1 JOIN Laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE T1.sex = 'F';	thrombosis_prediction
SELECT AVG(Laboratory.aCL_IgG) FROM Patient JOIN Laboratory ON Patient.patient_id = Laboratory.patient_id WHERE Patient.Admission = '+' AND (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Visit AS T1 JOIN Patient AS T2 ON T1.Patient = T2.ID WHERE strftime('%Y', T1.Description) = '1997' AND T1.Admission = '-' AND T2.Sex = 'F';	thrombosis_prediction
SELECT SUBTRACT(YEAR(`First Date`), YEAR(Birthday)) AS Age FROM `Patient` ORDER BY Age ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`Thrombosis` = '1' AND `Patient`.`sex` = 'F' AND strftime('%Y', `Laboratory`.`Date_of_Exam`) = '1997';	thrombosis_prediction
SELECT strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.tg >= 200 GROUP BY T1.ID, T1.Birthday ORDER BY age DESC LIMIT 1 UNION SELECT strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.tg >= 200 GROUP BY T1.ID, T1.Birthday ORDER BY age ASC LIMIT 1;	thrombosis_prediction
SELECT E.Symptoms, E.Diagnosis FROM `Patient` AS P JOIN `Examination` AS E ON P.ID = E.Patient WHERE P.Birthday = (SELECT MAX(Birthday) FROM `Patient`) AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT T1.ID) AS REAL) / 12 FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.Date BETWEEN '1998-01-01' AND '1998-12-31' AND T1.SEX = 'M';	thrombosis_prediction
SELECT L.Date, (strftime('%Y', P.FirstDate) - strftime('%Y', P.Birthday)) AS Age_when_arrived FROM Laboratory L JOIN Patient P ON L.Patient = P.SSN JOIN Diagnosis D ON P.SSN = D.Patient WHERE D.Diagnosis = 'SJS' AND P.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE SSN IN (SELECT Patient FROM Diagnosis WHERE Diagnosis = 'SJS'))	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patient_id = T2.patient_id;	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.Patient WHERE (strftime('%Y', T2.Examination_Date) - strftime('%Y', T1.First_Visit)) * 365 + (strftime('%m-%d', T2.Examination_Date) > strftime('%m-%d', T1.First_Visit)) >= 365;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` p JOIN `Examination` e ON p.PatientID = e.PatientID WHERE year(p.Birthday) + 18 < year(e.ExamDate) AND year(e.ExamDate) BETWEEN '1990' AND '1993';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT D.Diagnosis FROM Diagnosis AS D JOIN Laboratory AS L ON D.Patient_ID = L.Patient_ID WHERE L.Examination_Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY D.Diagnosis ORDER BY COUNT(D.Diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', T2.Birthday)) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.patient_id = T2.patient_id WHERE T1.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT T3.age, T4.diagnosis FROM (SELECT T2.HGB, T1.ID AS ID, strftime('%Y',T1.Examination_Date) - strftime('%Y',T2.Birthday) as age FROM Examination AS T1 JOIN Patient AS T2 ON T1.Patient_ID = T2.ID WHERE T1.Lab_ID IN(SELECT Lab_ID FROM Laboratory)) AS T3 JOIN Doctor AS T4 ON T3.ID = T4.Patient_ID ORDER BY T3.HGB DESC LIMIT 1;	thrombosis_prediction
SELECT ANA FROM `Laboratory` WHERE `Patient` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT `Total Cholesterol` FROM Laboratory WHERE Patient = 2927464 AND Date = '1995-09-04';	thrombosis_prediction
SELECT T2.SEX FROM Diagnosis AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DESCRIPTION = 'AORTITIS' ORDER BY T1.DIAGNOSISDATE ASC LIMIT 1;	thrombosis_prediction
SELECT L.aCL_IgM FROM `Laboratory` AS L JOIN `Diagnosis` AS D ON L.patient = D.patient WHERE D.Diagnosis = 'SLE' AND D.Description = '1994-02-19' AND L.Examination_Date = '1993/11/12';	thrombosis_prediction
SELECT p.SEX FROM `Patient` AS p JOIN `Laboratory` AS l ON p.ID = l.PatientID WHERE l.GPT = '9' AND l.Date = '1992-06-12';	thrombosis_prediction
SELECT T2.DOB ,  (strftime('%Y', '1991-10-21') - strftime('%Y', T2.DOB)) AS Age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.SSN = T2.SSN WHERE T1.UA = '8.4' AND T1.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(L.ID) FROM `Patient` AS P JOIN `Stay` AS S ON P.ID = S.Patient_ID JOIN `Diagnosis` AS D ON S.Stay_ID = D.Stay_ID JOIN `Laboratory` AS L ON P.ID = L.Patient_ID WHERE P.First_Date = '1991-06-13' AND D.Diagnosis = 'SJS' AND strftime('%Y', L.Date) = '1995';	thrombosis_prediction
SELECT D.Diagnosis FROM Diagnosis AS D JOIN Patient AS P ON D.Patient = P.SSN WHERE D.Examination_Date = '1997-01-27' AND D.Diagnosis = 'SLE' AND P.First_Date = (SELECT MIN(P2.First_Date) FROM Patient AS P2 WHERE P2.SSN = P.SSN);	thrombosis_prediction
SELECT T2.symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.patient WHERE T1.birthdate = '1959-03-01' AND T2.date = '1993-09-27';	thrombosis_prediction
SELECT SUM(CASE WHEN strftime('%Y-%m', T1.Date) = '1981-11' THEN T2.`T-CHO` ELSE 0 END) - SUM(CASE WHEN strftime('%Y-%m', T1.Date) = '1981-12' THEN T2.`T-CHO` ELSE 0 END) AS decrease_rate FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.Birthday = '1959-02-18';	thrombosis_prediction
SELECT D.PatientID FROM Diagnosis AS D JOIN Laboratory AS L ON D.PatientID = L.PatientID WHERE D.Description = 'Behcet' AND YEAR(L.Date) BETWEEN 1997 AND 1997;	thrombosis_prediction
SELECT Patient FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM `Laboratory`)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE 0 END) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.PATIENT) FROM PATIENT AS T1 INNER JOIN Diagnosis AS T2 ON T1.PATIENT = T2.PATIENT WHERE T1.SEX = 'M' AND strftime('%Y', T1.`FIRST DATE`) = '1981';	thrombosis_prediction
SELECT DISTINCT T1.patienthealthsystemstayid FROM patient AS T1 INNER JOIN followup AS T2 ON T1.uniquepid = T2.patientunitstayid INNER JOIN laboratory AS T3 ON T1.patienthealthsystemstayid = T3.patienthealthsystemstayid WHERE T2.admission = '-' AND T3.date LIKE '1991-10%' AND T3.tbil < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE `ANA Pattern` != 'P' AND SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT T1.sex FROM `Patient` AS T1 INNER JOIN `Diagnosis` AS T2 ON T1.patient = T2.patient_id INNER JOIN `Laboratory` AS T3 ON T1.patient = T3.patient WHERE T2.diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123;	thrombosis_prediction
SELECT AVG(T2.ALB) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.PatientID = T2.PatientID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE';	thrombosis_prediction
SELECT T2.symptoms FROM Patient AS T1 JOIN Disease AS T2 ON T1.ID = T2.ID WHERE T2.diagnosis = 'SLE' GROUP BY T2.symptoms ORDER BY COUNT(T2.symptoms) DESC LIMIT 1;	thrombosis_prediction
SELECT MIN(Medical_Information.Description), Medical_Information.Diagnosis FROM Patient JOIN Medical_Information ON Patient.ID = Medical_Information.Patient_ID WHERE Patient.ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.ID = T2.Patient WHERE T1.SEX = 'F' AND T2.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT patient) FROM `Laboratory` WHERE YEAR(`DATE`) = '1997' AND (tp < 6 OR tp > 8.5);	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.platelets < 150 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.patienthealthid) FROM Diagnoses AS T1 JOIN Laboratory AS T2 ON T1.patienthealthid = T2.patienthealthid WHERE T1.diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM Diagnosis AS T1 JOIN Patient AS T2 ON T1.PATIENT = T2.PATIENT_ID WHERE strftime('%Y', T2.BIRTHDAY) = '1980' AND T1.DIAGNOSIS = 'RA';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.Patient) FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.Patient = T2.Patient JOIN Laboratory AS T3 ON T1.Patient = T3.Patient WHERE T1.SEX = 'M' AND strftime('%Y', T3.Examination_Date) BETWEEN '1995' AND '1997' AND T2.Diagnosis = 'Behcet disease' AND T1.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Patient`.`SEX` = 'F' AND `Laboratory`.`WBC` < 3.5;	thrombosis_prediction
SELECT strftime('%s', T2.`Examination Date`) - strftime('%s', T1.FirstDate) AS TimeDifference FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.Patient WHERE T1.ID = 821298;	thrombosis_prediction
SELECT L.UA FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.UA > 8.0 OR P.SEX = 'F' AND L.UA > 6.5 AND P.ID = 57266;	thrombosis_prediction
SELECT T2.DATE FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T1.ID = 48473 AND T2.AST_GOT >= 60;	thrombosis_prediction
SELECT T1.patienthealthsystemstayid, T1.sex, T1.dateofbirth FROM patient AS T1 JOIN laboratory AS T2 ON T1.patientid = T2.patientid WHERE T2.labname = 'ast glutamic oxaloacetic transaminase (got)' AND T2.labresult < 60 AND strftime('%Y', T2.labresulttime) = '1994';	thrombosis_prediction
SELECT DISTINCT p.ID FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.PATIENT_ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT T3.Diagnosis FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID JOIN `Diagnosis` AS T3 ON T2.ID = T3.Patient WHERE T1.GPT > 60 ORDER BY T2.DOB ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM `Laboratory` WHERE LDH < 500;	thrombosis_prediction
SELECT T1.Patient_ID, strftime('%Y', 'now') - strftime('%Y', Birthday) AS Age FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T2.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT p.Admission FROM `Patient` AS p JOIN `Laboratory` AS l ON p.ID = l.ID WHERE l.ALP < 300 GROUP BY p.Admission;	thrombosis_prediction
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.Patient WHERE T1.birthdate = '1982-04-01' AND T2.alkaliphosphatase < 300;	thrombosis_prediction
SELECT T1.ID, T1.sex, T1.dob FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0;	thrombosis_prediction
SELECT L.TP - 8.5 AS deviation FROM `Laboratory` L JOIN `Patient` P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.SEX, S.BIRTHDAY FROM Patient AS P JOIN Stay AS S ON P.ID = S.ID JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY S.BIRTHDAY DESC;	thrombosis_prediction
SELECT P.ID, L.ALB FROM `Patient` AS P JOIN `Laboratory` AS L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) = '1982' AND L.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.uric_acid > 6.5 THEN 1 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F';	thrombosis_prediction
SELECT AVG(T2.UA) AS avg_UA_index FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.Patient_ID WHERE (T1.SEX = 'M' AND T2.UA < 8.0) OR (T1.SEX = 'F' AND T2.UA < 6.5);	thrombosis_prediction
SELECT T1.ID, T1.Sex, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.UN = 29;	thrombosis_prediction
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.ID = T2.Patient_ID WHERE T2.Diagnosis = 'RA' AND EXISTS(SELECT * FROM Laboratory AS T3 WHERE T1.ID = T3.ID AND T3.UN < 30);	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Sex = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT SUM(CASE WHEN Sex = 'M' AND Creatinine >= 1.5 THEN 1 ELSE 0 END) AS MaleCount, SUM(CASE WHEN Sex = 'F' AND Creatinine >= 1.5 THEN 1 ELSE 0 END) AS FemaleCount FROM Laboratory WHERE Creatinine >= 1.5;	thrombosis_prediction
SELECT P.ID, P.SEX, P.BIRTH_DATE FROM Patient AS P JOIN (SELECT ID, MAX(T_BIL) AS MaxT_BIL FROM Laboratory) AS L ON P.ID = L.ID;	thrombosis_prediction
SELECT P.Sex, GROUP_CONCAT(DISTINCT P.ID) AS PatientIDs FROM `Patient` AS P JOIN `Laboratory` AS L ON P.ID = L.ID WHERE L.T_BIL >= 2.0 GROUP BY P.Sex;	thrombosis_prediction
SELECT P.ID, L.T_CHO FROM Patient AS P JOIN (SELECT ID, MAX(T_CHO) as T_CHO FROM Laboratory GROUP BY ID) AS L ON P.ID = L.ID WHERE P.birthday = (SELECT MIN(birthday) FROM Patient WHERE ID IN(SELECT ID FROM (SELECT ID, MAX(T_CHO) as T_CHO FROM Laboratory GROUP BY ID)))	thrombosis_prediction
SELECT AVG(JULIANDAY('now') - JULIANDAY(Patient.birthday)) AS average_age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.sex = 'M' AND Laboratory.T_CHO >= 250;	thrombosis_prediction
SELECT T1.ID, T1.Name, T2.Diagnosis FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.ID = T2.Patient_ID JOIN Laboratory AS T3 ON T1.ID = T3.Patient WHERE T3.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.patient_id) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.patient_id = T2.patient_id WHERE T2.triglyceride >= 200 AND (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250;	thrombosis_prediction
SELECT DISTINCT T1.patient FROM `Patient` AS T1 INNER JOIN `Stay` AS T2 ON T1.uniquepid = T2.patient INNER JOIN `Laboratory` AS T3 ON T2.stayid = T3.stay_id WHERE T1.sex = 'M' AND T1.birthday BETWEEN '1936-01-01' AND '1956-12-31' AND T3.CPK >= 250;	thrombosis_prediction
SELECT ID, sex FROM Laboratory WHERE GLU >= 180 AND T_CHO < 250;	thrombosis_prediction
SELECT patient_id, GLU FROM Laboratory WHERE GLU < 180 AND strftime('%Y', Description) = '1991';	thrombosis_prediction
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.Sex ORDER BY (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) ASC;	thrombosis_prediction
SELECT T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.RBC < 3.5;	thrombosis_prediction
SELECT P.PatientID, S.Admission FROM `Patient` AS P JOIN `Stay` AS S ON P.PatientID = S.PatientID JOIN `Laboratory` AS L ON P.PatientID = L.PatientID WHERE P.Sex = 'F' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0);	thrombosis_prediction
SELECT T1.ID, T1.Sex FROM Patient AS T1 JOIN Admission AS T2 ON T1.ID = T2.Patient JOIN Laboratory AS T3 ON T1.ID = T3.Patient WHERE T2.Admission = '-' AND T3.HBG < 10;	thrombosis_prediction
SELECT T1.ID, T1.Sex FROM `Patient` AS T1 JOIN `Diagnosis` AS T2 ON T1.ID = T2.Patient JOIN `Laboratory` AS T3 ON T1.ID = T3.Patient WHERE T2.Diagnosis = 'SLE' AND T3.HGB > 10 AND T3.HGB < 17 ORDER BY T1.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.PatientID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T1.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT COUNT(*) AS total_abnormal, (SELECT COUNT(*) FROM Laboratory WHERE PLT < 100) - (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400) AS difference FROM Laboratory WHERE PLT <= 100 OR PLT >= 400;	thrombosis_prediction
SELECT p.Patient FROM Patient p JOIN Stay s ON p.Hospital = s.Hospital AND p.Patient = s.Patient JOIN Laboratory l ON s.Stay = l.Stay WHERE YEAR(l.Date) = '1984' AND SUBTRACT(year(current_timestamp), year(p.Birthday)) < 50 AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.patient_id = T2.patient_id WHERE (strftime('%Y', 'now') - strftime('%Y', T2.Birthday)) > 55 AND T1.PT >= 14;	thrombosis_prediction
SELECT DISTINCT p.ID FROM `Patient` AS p JOIN `Visit` AS v ON p.ID = v.Patient JOIN `Laboratory` AS l ON v.ID = l.Visit WHERE p.`First Date` > '1992-01-01' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM `Laboratory` AS T1 WHERE T1.APTT > 45 AND T1.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.Patient) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.Patient = T2.PatientID WHERE T1.Sex = 'M' AND T2.WBC > 3.5 AND T2.WBC < 9.0 AND (T2.FG <= 150 OR T2.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.Patient = T2.ID WHERE T2.Birthday > '1980-01-01' AND (T1.FG < 150 OR T1.FG > 450);	thrombosis_prediction
SELECT DISTINCT T2.Disease FROM `Patient` AS T1 JOIN `Diagnosis` AS T2 ON T1.ID = T2.Patient_ID JOIN `Laboratory` AS T3 ON T1.ID = T3.ID WHERE T3.`U-PRO` >= 30;	thrombosis_prediction
SELECT T1.ID FROM `Patient` AS T1 INNER JOIN `Diagnosis` AS T2 ON T1.ID = T2.Patient WHERE T2.Diagnosis = 'SLE' AND T1.`U-PRO` > 0 AND T1.`U-PRO` < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.Patient WHERE l.`IGG` > 900 AND l.`IGG` < 2000 AND p.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT T2.Diagnosis FROM (SELECT ID, MAX(IgA) AS max_iga FROM Laboratory WHERE IgA BETWEEN 80 AND 500 GROUP BY ID) AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.Patient = T2.ID WHERE T1.IGA > 80 AND T1.IGA < 500 AND strftime('%Y', T2.First Date) >= '1990';	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.ID = T2.Patient_ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.IGM <= 40 OR T3.IGM >= 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`CRP` = '+' AND `Laboratory`.`Description` IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Laboratory.CRE` >= 1.5 AND (strftime('%Y', 'now') - strftime('%Y', `Patient.Birthday`)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 WHERE T1.RA IN ('-', '+-') AND T1.KCT = '+'	thrombosis_prediction
SELECT T2.Diagnosis FROM `Patient` AS T1 JOIN `Diagnosis` AS T2 ON T1.ID = T2.Patient WHERE T1.Birthdate >= '1985-01-01' AND EXISTS(SELECT * FROM `Laboratory` AS T3 WHERE T1.ID = T3.Patient AND T3.RA IN ('-', '+-'))	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND strftime('%Y', 'now') - strftime('%Y', T1.Birthday) > 60;	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Laboratory.RF` < 20 AND `Laboratory.Thrombosis` = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.Patient = T2.Patient WHERE T1.C3 > 35 AND T2.ANA_Pattern = 'P';	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.PatientYouID = T2.ID WHERE NOT (T1.Hematocrit BETWEEN 29 AND 52) ORDER BY T1.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T1.APS = 1 AND T2.C4 > 10;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.Patient WHERE (T2.RNP = '-' OR T2.RNP = '+-') AND T1.Admission = '+'	thrombosis_prediction
SELECT T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.Patient WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE SM IN ('-', '+-') AND Thrombosis = 0;	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT T1.Patient_ID FROM `Patient` AS T1 INNER JOIN `Examination` AS T2 ON T1.Patient_ID = T2.Patient_ID INNER JOIN `Laboratory` AS T3 ON T1.Patient_ID = T3.Patient_ID WHERE T2.Examination_Date > '1997-01-01' AND (T3.SC170 = 'negative' OR T3.SC170 = '0')	thrombosis_prediction
SELECT DISTINCT T2.ID FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.Patient = T2.ID WHERE (T1.SC170 = 'negative' OR T1.SC170 = '0') AND T2.Sex = 'F' AND T2.symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN('-','+-') AND strftime('%Y', T1.`First Date`) < '2000';	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.SSA NOT IN('negative', '0') ORDER BY T2.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient_ID WHERE (T2.SSB = 'negative' OR T2.SSB = 0) AND T1.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T2.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.PatientID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.Patient = T2.Patient WHERE T1.Sex = 'M' AND T2.CENTROMEA IN('+-', '-') AND T2.SSB IN('+-', '-');	thrombosis_prediction
SELECT T3.DISEASE FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Diagnosis AS T3 ON T2.ID = T3.ID WHERE T1.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T2.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.IGG > 900 AND Laboratory.IGG < 2000 AND Patient.Admission = '+';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN T1.patient_id ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN T2.GOT >= 60 THEN T1.patient_id ELSE NULL END) FROM diagnosis AS T1 JOIN laboratory AS T2 ON T1.patient_id = T2.ID	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Sex = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT T1.birthDate FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60 ORDER BY T1.birthDate DESC LIMIT 1;	thrombosis_prediction
SELECT T2.Birthday FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT < 60 ORDER BY T1.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(T1.ID) FROM `Patient` AS T1 INNER JOIN `Diagnosis` AS T2 ON T1.ID = T2.Patient_ID INNER JOIN `Laboratory` AS T3 ON T1.ID = T3.Patient_ID WHERE T1.Sex = 'M' AND T3.GOT < 60;	thrombosis_prediction
SELECT MIN(T1.First_Date) FROM `Laboratory` AS T1 WHERE T1.LDH < 500 GROUP BY T1.ID ORDER BY MAX(T1.LDH) DESC LIMIT 1;	thrombosis_prediction
SELECT T2.Date FROM (SELECT MAX(`First Date`) AS max_date FROM `Patient`) AS T1 JOIN Laboratory AS T2 ON T1.max_date = T2.ID WHERE T2.LDH >= 500;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300;	thrombosis_prediction
SELECT T2.DIAGNOSIS FROM `Patient` AS T1 INNER JOIN `Diagnosis` AS T2 ON T1.ID = T2.ID INNER JOIN `Laboratory` AS T3 ON T1.ID = T3.ID WHERE T3.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.ID = T2.Patient_ID WHERE T2.Diagnosis = 'SJS' AND EXISTS(SELECT * FROM Laboratory AS T3 WHERE T1.ID = T3.Patient AND T3.TP > 6.0 AND T3.TP < 8.5);	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ALB > 3.5 AND ALB < 5.5 ORDER BY ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` AS p JOIN `Laboratory` AS l ON p.ID = l.ID WHERE p.Sex = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP >= 6.0 AND l.TP <= 8.5;	thrombosis_prediction
SELECT T1.aCL_IgG, T1.aCL_IgM, T1.aCL_IgA FROM Laboratory AS T1 JOIN (SELECT MAX(UA) AS max_ua FROM Laboratory WHERE Sex = 'F' AND UA > 6.50) AS T2 ON T1.UA = T2.max_ua;	thrombosis_prediction
SELECT MAX(ANA) FROM Laboratory WHERE CRE < 1.5;	thrombosis_prediction
SELECT T2.ID FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 AND T1.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Laboratory WHERE CRE < 1.5);	thrombosis_prediction
SELECT COUNT(DISTINCT T1.Patient) FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.Patient_ID INNER JOIN `Examination` AS T3 ON T1.ID = T3.Patient WHERE T2.T_BIL >= 2.0 AND T3.ANA_Pattern LIKE '%P%'	thrombosis_prediction
SELECT L1.ANA FROM `Laboratory` AS L1 WHERE L1.T_BIL = (SELECT MAX(L2.T_BIL) FROM `Laboratory` AS L2 WHERE L2.T_BIL < 2.0);	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` AS Lab INNER JOIN `Patient` AS Pat ON Lab.ID = Pat.ID WHERE Lab.T_CHO >= 250 AND Lab.KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM `Laboratory` JOIN `Examination` ON `Laboratory`.ID = `Examination`.Patient WHERE `Laboratory`.T_CHO < 250 AND `Examination`.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.TG < 200 AND Patient.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT T3.Diagnosis FROM (SELECT MAX(TG) AS max_TG, ID FROM Laboratory WHERE TG < 200 GROUP BY ID) AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Diagnosis AS T3 ON T1.ID = T3.ID;	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Thrombosis = 0 AND T3.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+');	thrombosis_prediction
SELECT T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T1.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`GLU` < 180 AND `Patient`.`Thrombosis` = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '+' AND Laboratory.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Diagnosis AS T2 ON T1.ID = T2.Patient_ID JOIN Laboratory AS T3 ON T1.ID = T3.Patient_ID WHERE T2.Diagnosis = 'SLE' AND T3.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT T1.patient_id FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.patient_id = T2.patient_id WHERE (T1.RBC <= 3.5 OR T1.RBC >= 6.0) AND T2.Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`PLT` > 100 AND `Laboratory`.`PLT` < 400 AND `Patient`.`Diagnosis` IS NOT NULL;	thrombosis_prediction
SELECT T2.PLT, T3.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.patient = T2.patient INNER JOIN Diagnosis AS T3 ON T1.patient = T3.patient WHERE T2.PLT BETWEEN 100 AND 400 AND T3.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(T2.PT) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T1.Sex = 'M' AND T2.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient_ID WHERE (T1.Thrombosis = 2 OR T1.Thrombosis = 1) AND T2.PT < 14;	thrombosis_prediction
SELECT T3.major_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering';	student_club
SELECT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design';	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE a.event_name = 'Women\'s Soccer';	student_club
SELECT COUNT(*) FROM attendance AS a JOIN member AS m ON a.link_to_member = m.member_id WHERE a.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.event_name FROM `event` AS e JOIN attendance AS a ON e.event_id = a.link_to_event GROUP BY e.event_id ORDER BY COUNT(a.link_to_event) DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, ma.college FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM `event` AS e JOIN attendance AS a ON e.event_id = a.link_to_event JOIN `member` AS m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison' AND strftime('%Y', T1.event_date) = '2019';	student_club
SELECT COUNT(*) FROM (SELECT e.event_id FROM attendance a JOIN event e ON a.event_id = e.event_id WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.event_id) > 10);	student_club
SELECT e.event_name FROM `events` AS e JOIN `attendance` AS a ON e.event_id = a.event_id WHERE e.event_type != 'Fundraiser' GROUP BY e.event_id HAVING COUNT(a.event_id) > 20;	student_club
SELECT CAST(SUM(T2.attendance) AS REAL) / COUNT(DISTINCT T1.event_name) AS average_attendance FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE YEAR(T1.event_date) = 2020 AND T1.type = 'Meeting';	student_club
SELECT * FROM `expense` WHERE `expense_description` LIKE '%item%' ORDER BY `cost` DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM `member` JOIN `major` ON `member`.`link_to_major` = `major`.`major_id` WHERE `major`.`name` = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM attendance AS a JOIN member AS m ON a.link_to_member = m.member_id WHERE a.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM `member` AS m JOIN `major` AS ma ON m.link_to_major = ma.major_id WHERE ma.name = 'Law and Constitutional Studies';	student_club
SELECT zc.county FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT c.college_name FROM college AS c JOIN major AS m ON c.college_id = m.link_to_college JOIN member AS mb ON m.major_id = mb.link_to_major WHERE mb.first_name = 'Tyler' AND mb.last_name = 'Hewitt';	student_club
SELECT i.amount FROM income AS i JOIN member AS m ON i.link_to_member = m.member_id JOIN position AS p ON m.link_to_position = p.position_id WHERE p.position_name = 'Vice President';	student_club
SELECT SUM(e.amount) FROM expense AS e JOIN event AS ev ON e.link_to_event = ev.event_id WHERE e.category = 'Food' AND ev.event_name = 'September Meeting';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code JOIN state ON zip_code.link_to_state = state.state_id WHERE state.state_name = 'Illinois';	student_club
SELECT SUM(amount_spent) FROM expense WHERE category = 'Advertisement' AND event_name = 'September Meeting';	student_club
SELECT m.department FROM `major` AS m JOIN `member` AS mb ON mb.link_to_major = m.major_id WHERE mb.first_name IN ('Pierce', 'Guidi')	student_club
SELECT SUM(amount) FROM budget WHERE event_name = 'October Speaker';	student_club
SELECT e.approved FROM expense AS e JOIN event AS ev ON e.event_id = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT AVG(T2.amount) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.expense_member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE (SUBSTR(T2.expense_date, 6, 2) = '09' OR SUBSTR(T2.expense_date, 6, 2) = '10') AND T1.first_name = 'Elijah' AND T1.last_name = 'Allen';	student_club
SELECT (SELECT SUM(spent) FROM event WHERE SUBSTR(event_date, 1, 4) = '2019') - (SELECT SUM(spent) FROM event WHERE SUBSTR(event_date, 1, 4) = '2020')	student_club
SELECT location FROM event WHERE name = 'Spring Budget Review';	student_club
SELECT amount FROM expenses WHERE description = 'Posters' AND event_date = '2019-09-04';	student_club
SELECT (b.max_budget - IFNULL(SUM(e.amount), 0)) AS remaining FROM (SELECT MAX(amount) AS max_budget FROM budget WHERE category = 'Food') b LEFT JOIN expense e ON e.link_to_budget = (SELECT budget_id FROM budget WHERE amount = b.max_budget AND category = 'Food');	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';	student_club
SELECT COUNT(major_id) FROM major WHERE college_name = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT zc.county FROM `member` m JOIN `zip_code` zc ON m.zip = zc.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM `event` AS e JOIN `budget` AS b ON e.event_id = b.link_to_event WHERE e.name = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(amount) FROM budget WHERE event_name = 'September Speaker';	student_club
SELECT e.event_status FROM `expense` AS ex JOIN `event` AS e ON ex.event_id = e.event_id WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-8-20';	student_club
SELECT m.link_to_major AS major_id, ma.major_name FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Brent' AND m.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Member' AND major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT zc.zip_type FROM zip_code AS zc JOIN member AS m ON zc.zip_code = m.zip WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';	student_club
SELECT m.link_to_major, ma.major_name FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT z.state FROM zip_code AS z JOIN income AS i ON z.zip_code = i.link_to_zip JOIN member AS m ON i.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT m.link_to_major, ma.department FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT income.date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE i.source = 'Dues' ORDER BY i.received_date ASC LIMIT 1;	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.event_name = 'October Meeting' THEN T1.amount ELSE 0 END) FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T1.category = 'Advertisement';	student_club
SELECT (SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM budget WHERE event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(city_id) FROM city WHERE county_name = 'Orange County' AND state = 'Virginia';	student_club
SELECT * FROM `department` WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense AS e JOIN budget AS b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.first_name, m.last_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE a.link_to_event IN (SELECT e.event_id FROM event e WHERE e.name = 'October Meeting');	student_club
SELECT major.college, COUNT(member.member_id) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT m.link_to_major AS major_id FROM member AS m WHERE m.phone = '809-555-3360'; SELECT ma.major_name FROM major AS ma WHERE ma.major_id IN (SELECT m.link_to_major FROM member AS m WHERE m.phone = '809-555-3360');	student_club
SELECT e.event_name FROM event AS e JOIN budget AS b ON e.event_id = b.link_to_event GROUP BY e.event_name ORDER BY MAX(b.amount) DESC LIMIT 1;	student_club
SELECT e.expense_description FROM expense AS e JOIN member AS m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE attendance.event_name = 'Women\'s Soccer';	student_club
SELECT i.date_received FROM income AS i JOIN member AS m ON i.link_to_member = m.member_id WHERE m.first_name = 'Casey' AND m.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE city LIKE '% MD';	student_club
SELECT COUNT(*) FROM attendance AS a JOIN event AS e ON a.link_to_event = e.event_id WHERE a.link_to_member IN (SELECT member_id FROM member WHERE phone = '954-555-6240');	student_club
SELECT m.first_name, m.last_name FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id JOIN department AS d ON ma.link_to_department = d.department_id WHERE d.department_name = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name FROM event AS e JOIN expense AS ex ON e.event_id = ex.link_to_event WHERE e.status = 'Closed' GROUP BY e.event_id ORDER BY SUM(ex.spent) / e.amount DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM event;	student_club
SELECT COUNT(*) FROM `event` WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) FROM expense WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id GROUP BY a.link_to_member HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Interior Design' AND EXISTS (SELECT 1 FROM attendance AS a WHERE a.link_to_member = m.member_id AND a.event_name = 'Community Theater');	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN city AS T3 ON T2.city_id = T3.city_id WHERE T3.city_name = 'Georgetown' AND T3.state_name = 'South Carolina';	student_club
SELECT SUM(income.amount) FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) FROM expense AS e JOIN event AS ev ON e.link_to_event = ev.event_id WHERE ev.name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member AS m JOIN income AS i ON m.member_id = i.link_to_member JOIN event AS e ON e.event_id = i.link_to_event WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source FROM income AS i JOIN member AS m ON i.link_to_member = m.member_id ORDER BY i.amount DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE cost = (SELECT MIN(cost) FROM event);	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) AS REAL) * 100 / SUM(T1.cost) FROM expense AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id;	student_club
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id;	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' AND amount = (SELECT MAX(amount) FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30');	student_club
SELECT m.first_name, m.last_name, m.email FROM student_club AS sc JOIN position AS p ON sc.link_to_position = p.position_id WHERE p.title = 'Secretary' AND sc.club_id = 'rec0s9ZrO15zhzUeE' JOIN member AS m ON sc.link_to_member = m.member_id;	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS num_members FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE a.event_name = 'Community Theater' AND strftime('%Y', a.event_date) = '2019';	student_club
SELECT COUNT(*) AS events_attended, m.link_to_major FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY m.link_to_major;	student_club
SELECT AVG(T1.amount) FROM `expense` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.event_status = 'Closed';	student_club
SELECT T1.event_name FROM `events` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' AND T2.spent = (SELECT MAX(spent) FROM expense WHERE category = 'Advertisement');	student_club
SELECT EXISTS(SELECT * FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Maya' AND last_name = 'Mclean') AND event_name = 'Women's Soccer');	student_club
SELECT CAST(SUM(CASE WHEN T1.type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 WHERE strftime('%Y', T1.event_date) = '2019';	student_club
SELECT e.cost FROM expenses AS e JOIN events AS ev ON e.link_to_event = ev.event_id WHERE ev.name = 'September Speaker' AND e.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) AS count FROM member GROUP BY t_shirt_size ORDER BY count DESC LIMIT 1;	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN (SELECT event_id, SUM(amount) - budget AS remaining FROM expense GROUP BY event_id HAVING remaining < 0) AS T2 ON T1.event_id = T2.event_id WHERE T1.status = 'Closed' ORDER BY T2.remaining LIMIT 1;	student_club
SELECT e.type_of_expense, SUM(e.cost) as total_value FROM expense AS e JOIN event_expense AS ee ON e.expense_id = ee.link_to_expense WHERE ee.event_name = 'October Meeting' GROUP BY e.type_of_expense;	student_club
SELECT b.category, SUM(b.amount) AS total_amount FROM events e JOIN budget b ON e.event_id = b.link_to_event WHERE e.name = 'April Speaker' GROUP BY b.category ORDER BY total_amount ASC;	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expenses WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM `expense` WHERE `expense_date` = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(i.amount) AS total_cost FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense AS e JOIN member AS m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM `income` i JOIN `member` m ON i.link_to_member = m.member_id WHERE i.cost < 50;	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen';	student_club
SELECT m.position FROM `member` AS m INNER JOIN `major` AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT T1.type_of_event FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN (SELECT link_to_event, SUM(amount) AS total_income FROM income GROUP BY link_to_event) AS T3 ON T2.link_to_event = T3.link_to_event WHERE T2.budget - IFNULL(T3.total_income, 0) > 30;	student_club
SELECT DISTINCT category FROM event WHERE location = 'MU 215';	student_club
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT T3.major_name FROM member AS T1 JOIN club AS T2 ON T1.member_id = T2.link_to_member JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.position = 'Vice President';	student_club
SELECT CAST(SUM(CASE WHEN T2.position = 'Member' AND T3.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.position = 'Member';	student_club
SELECT category FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE link_to_college = (SELECT college_id FROM college WHERE college_name = 'College of Agriculture and Applied Sciences') AND link_to_department = (SELECT department_id FROM department WHERE department_name = 'School of Applied Sciences, Technology and Education');	student_club
SELECT m.last_name, d.department_name, c.college_name FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id JOIN department AS d ON mj.link_to_department = d.department_id JOIN college AS c ON d.link_to_college = c.college_id WHERE mj.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM `event` e JOIN `budget` b ON e.event_id = b.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'Member' AND ma.department = 'Electrical and Computer Engineering Department';	student_club
SELECT T4.event_name FROM `location` AS T1 JOIN `student_club` AS T2 ON T1.location_id = T2.location_id JOIN `member` AS T3 ON T2.club_id = T3.club_id JOIN `event` AS T4 ON T3.member_id = T4.attendees WHERE T1.address = '900 E. Washington St.' AND T3.position = 'Vice President' AND T4.type = 'Social';	student_club
SELECT m.last_name, m.position FROM `expense` e JOIN `member` m ON e.member_id = m.member_id WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT member.last_name FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE member.position = 'Member' AND event.name = 'Women''s Soccer';	student_club
SELECT CAST(COUNT(CASE WHEN I.amount = 50 THEN 1 END) AS REAL) * 100 / COUNT(*) FROM income I JOIN member M ON I.member_id = M.member_id WHERE M.t_shirt_size = 'Medium' AND M.position = 'Member';	student_club
SELECT DISTINCT T2.country_name FROM zip_code AS T1 JOIN country AS T2 ON T1.zip = T2.zip_code WHERE T1.type = 'PO Box';	student_club
SELECT z.zip_code FROM zip_code AS z JOIN city AS c ON z.link_to_city = c.city_id WHERE z.type = 'PO Box' AND c.country = 'Puerto Rico' AND c.city_name = 'San Juan';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.link_to_event FROM income i JOIN member m ON i.link_to_member = m.member_id JOIN event e ON m.member_id = e.link_to_member WHERE i.cost > 50;	student_club
SELECT m.first_name, m.last_name, m.email, e.link_to_event FROM `member` AS m JOIN `expense` AS e ON m.member_id = e.member_id WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT college.college_name FROM college JOIN major ON college.college_id = major.link_to_college JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT T1.phone FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college_name = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business';	student_club
SELECT m.email FROM income i JOIN member m ON i.member_id = m.member_id WHERE i.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND i.cost > 20;	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Member' AND major.name = 'education';	student_club
SELECT CAST(SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 JOIN (SELECT event_id, SUM(budgeted - actual) as remaining FROM expense GROUP BY event_id) AS T2 ON T1.event_id = T2.event_id;	student_club
SELECT event_id, location, status FROM event WHERE date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description, AVG(cost) AS average_cost FROM expense GROUP BY expense_description HAVING average_cost > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code;	student_club
SELECT T1.event_name, T3.location FROM `event` AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event INNER JOIN income AS T4 ON T2.link_to_expense = T4.expense_id INNER JOIN venue AS T3 ON T1.venue_id = T3.venue_id WHERE (T1.budget - SUM(T2.amount)) > 0 GROUP BY T1.event_id;	student_club
SELECT e.event_name, e.event_date FROM `event` AS e INNER JOIN expense AS ex ON e.event_id = ex.event_id INNER JOIN expense_type AS et ON ex.expense_type_id = et.expense_type_id WHERE et.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT T2.first_name, T2.last_name, T3.major_name FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T1.cost > 100;	student_club
SELECT DISTINCT T3.city, T3.country FROM income AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN location AS T3 ON T2.link_to_location = T3.location_id WHERE T1.amount > 40 GROUP BY T2.event_id HAVING COUNT(T1.income_id) > 40;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id GROUP BY e.link_to_member HAVING COUNT(DISTINCT e.event_id) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(income.cost) FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position != 'Member';	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' AND T2.cost < (SELECT AVG(cost) FROM `expense` WHERE category = 'Parking')	student_club
SELECT CAST(SUM(CASE WHEN type = 'Meeting' THEN cost ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event;	student_club
SELECT * FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(i.cost) as total_spending FROM income i JOIN member m ON i.link_to_member = m.member_id GROUP BY m.member_id ORDER BY total_spending DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member AS m JOIN income AS i ON m.member_id = i.link_to_member JOIN expense AS e ON i.link_to_expense = e.expense_id WHERE i.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) * 100 / COUNT(T1.position)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) * 100 / COUNT(T1.position)) AS percentage_difference FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member';	student_club
SELECT m.first_name, m.last_name, ma.major_name, d.department_name FROM `member` AS m JOIN `major` AS ma ON m.link_to_major = ma.major_id JOIN `department` AS d ON ma.link_to_department = d.department_id WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, e.cost FROM income i JOIN member m ON i.link_to_member = m.member_id JOIN expense e ON i.expense_id = e.expense_id WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education';	student_club
SELECT b.category, b.amount FROM budget AS b JOIN events AS e ON b.event_id = e.event_id WHERE e.name = 'January Speaker';	student_club
SELECT DISTINCT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT budget_category FROM expense WHERE description = 'Posters';	student_club
SELECT member.first_name, member.last_name, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary';	student_club
SELECT e.event_name, SUM(exp.spent) as total_spent FROM expense exp JOIN event e ON exp.link_to_event = e.event_id WHERE exp.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city FROM zip_code AS z JOIN member AS m ON z.zip_code = m.zip WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member AS m JOIN zip_code AS z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND m.zip = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS Ratio FROM customers;	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND ym.Date BETWEEN '201201' AND '201212' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) / 12 AS Average_Monthly_Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE strftime('%Y%m', t.Date) BETWEEN '201101' AND '201112' AND c.Currency = 'CZK' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*) FROM (SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID HAVING TotalConsumption < 30000) AS result;	debit_card_specializing
SELECT (SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END)) AS Difference FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2012'	debit_card_specializing
SELECT strftime('%Y', T1.Date) AS Year, SUM(T1.Amount) AS TotalGasUse FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS Total_Consumption FROM yearmonth WHERE Currency = 'CZK' GROUP BY Year ORDER BY Total_Consumption DESC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(T2.Date, 5, 2) AS Month, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date LIKE '2013%' GROUP BY SUBSTR(T2.Date, 5, 2) ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
WITH ConsumptionPerSegment AS (SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption, COUNT(DISTINCT y.CustomerID) AS NumberOfCustomers FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 4) BETWEEN '2013' AND '2013' GROUP BY c.Segment), AnnualAverage AS (SELECT Segment, TotalConsumption / NumberOfCustomers AS AverageConsumption FROM ConsumptionPerSegment) SELECT AVG(CASE WHEN a1.Segment = 'SME' THEN a1.AverageConsumption - a2.AverageConsumption ELSE 0 END) AS SME_LAM_Diff, AVG(CASE WHEN a1.Segment = 'LAM' THEN a1.AverageConsumption - a3.AverageConsumption ELSE 0 END) AS LAM_KAM_Diff, AVG(CASE WHEN a1.Segment = 'KAM' THEN a1.AverageConsumption - a2.AverageConsumption ELSE 0 END) AS KAM_SME_Diff FROM AnnualAverage a1 CROSS JOIN AnnualAverage a2 CROSS JOIN AnnualAverage a3 WHERE a1.Segment != a2.Segment AND a1.Segment != a3.Segment AND a2.Segment != a3.Segment;	debit_card_specializing
WITH Consumption_2012 AS (SELECT c.Segment, SUM(y.Consumption) as Total_Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2012' GROUP BY c.Segment), Consumption_2013 AS (SELECT c.Segment, SUM(y.Consumption) as Total_Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2013' GROUP BY c.Segment) SELECT C_2013.Segment, (C_2013.Total_Consumption - C_2012.Total_Consumption) as Increase, ((C_2013.Total_Consumption - C_2012.Total_Consumption) / C_2013.Total_Consumption * 100) as Percentage_Increase FROM Consumption_2013 C_2013 JOIN Consumption_2012 C_2012 ON C_2013.Segment = C_2012.Segment ORDER BY Percentage_Increase DESC, Percentage_Increase ASC;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Segment = 'Value for money' AND Country = 'CZE') - (SELECT COUNT(*) FROM gasstations WHERE Segment = 'Value for money' AND Country = 'SVK')	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') - COALESCE((SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304'), 0) AS Difference;	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR')	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT CustomerID, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) FROM `yearmonth` y JOIN `customers` c ON y.CustomerID = c.CustomerID WHERE y.Date = '201305' AND c.Segment = 'SME';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM';	debit_card_specializing
SELECT Country, COUNT(*) FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'KAM' AND Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN Segment = 'KAM' THEN 1 ELSE 0 END) FROM customers;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.CustomerID) FROM yearmonth AS T1 WHERE SUBSTR(T1.Date, 1, 4) = '2012' AND SUBSTR(T1.Date, 5, 2) = '02';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.GasStationID) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, MIN(y.Consumption) FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY MIN(y.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012';	debit_card_specializing
SELECT MAX(SUM(y.Consumption) / 12) AS biggest_monthly_consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' GROUP BY y.Date	debit_card_specializing
SELECT p.Description FROM `transactions_1k` t JOIN `yearmonth` y ON t.CustomerID = y.CustomerID JOIN `products` p ON t.ProductID = p.ProductID WHERE SUBSTR(y.Date, 1, 6) = '201309';	debit_card_specializing
SELECT DISTINCT T2.Country FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y-%m', T1.Date) = '2013-06';	debit_card_specializing
SELECT DISTINCT gs.ChainID FROM `gasstations` AS gs JOIN `transactions_1k` AS t ON gs.GasStationID = t.GasStationID JOIN `customers` AS c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT T3.Description FROM `transactions_1k` AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01-%';	debit_card_specializing
SELECT T2.CustomerID FROM (SELECT CustomerID FROM customers WHERE Currency = 'EUR') AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T2.CustomerID HAVING SUM(T2.Consumption) > 1000;	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT T2.Time FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` JOIN `gasstations` ON `transactions_1k`.GasStationID = `gasstations`.GasStationID WHERE `gasstations`.Country = 'CZE' AND `transactions_1k`.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` JOIN `gasstations` ON `transactions_1k`.GasStationID = `gasstations`.GasStationID WHERE `gasstations`.Country = 'CZE' AND `transactions_1k`.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Price) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'	debit_card_specializing
SELECT AVG(t.Price) FROM `transactions_1k` t JOIN `customers` c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT T1.CustomerID, SUM(T2.Amount * T2.Price) AS TotalSpent FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25' GROUP BY T1.CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM `transactions_1k` t JOIN `customers` c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers AS c JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` WHERE Date = '2012-08-26' AND Time < '13:00:00';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT T2.Country FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT y.Date, y.Consumption FROM `yearmonth` AS y JOIN (SELECT CustomerID FROM `transactions_1k` WHERE Date = '2012-08-24' AND Price = 124.05) AS t ON y.CustomerID = t.CustomerID WHERE y.Date LIKE '201201%'	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` JOIN `gasstations` ON `transactions_1k`.GasStationID = `gasstations`.GasStationID WHERE `transactions_1k`.Date = '2012-08-26' AND `transactions_1k`.Time BETWEEN '08:00:00' AND '09:00:00' AND `gasstations`.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Amount * t.Price = 548.4;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN T3.Currency = 'EUR' THEN T1.CustomerID END) AS REAL) * 100 / COUNT(DISTINCT T1.CustomerID) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Date = '2012-08-25';	debit_card_specializing
WITH customer_transactions AS (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Price * Amount = 634.8) SELECT ((SELECT Consumption FROM yearmonth WHERE Date LIKE '2012%' AND CustomerID IN (SELECT CustomerID FROM customer_transactions)) - (SELECT Consumption FROM yearmonth WHERE Date LIKE '2013%' AND CustomerID IN (SELECT CustomerID FROM customer_transactions))) / (SELECT Consumption FROM yearmonth WHERE Date LIKE '2012%' AND CustomerID IN (SELECT CustomerID FROM customer_transactions));	debit_card_specializing
SELECT `GasStationID`, SUM(`Amount` * `Price`) AS Revenue FROM `transactions_1k` GROUP BY `GasStationID` ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.GasStationID) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK';	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND strftime('%Y-%m', Date) = '2012-01';	debit_card_specializing
SELECT p.Description FROM (SELECT ProductID, SUM(Amount) as TotalAmountSold FROM transactions_1k GROUP BY ProductID ORDER BY TotalAmountSold DESC LIMIT 5) AS top_products JOIN products p ON top_products.ProductID = p.ProductID;	debit_card_specializing
SELECT T1.CustomerID, SUM(T2.Price * T2.Amount) AS TotalSpent, SUM(T2.Amount) AS TotalItems, SUM(T2.Price * T2.Amount) / SUM(T2.Amount) AS AvgPricePerItem, T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT gs.Country FROM `gasstations` AS gs JOIN `transactions_1k` AS t ON gs.GasStationID = t.GasStationID WHERE t.ProductID = 2 GROUP BY gs.Country ORDER BY MAX(t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT y.Consumption FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29.00 AND y.Date = '201208';	debit_card_specializing
