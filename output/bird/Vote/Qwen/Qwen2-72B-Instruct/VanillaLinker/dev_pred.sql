;
SELECT `School Name`, (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS eligible_free_rate FROM frpm WHERE `School Type` = 'Continuation High Schools (Public)' ORDER BY eligible_free_rate ASC LIMIT 3
;
;
;
SELECT COUNT(*) FROM satscores WHERE AvgScrMath > 400 AND rtype = 'S' AND cds IN (SELECT CDSCode FROM schools WHERE Virtual = 'F')
;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumTstTakr DESC LIMIT 1;
;
;
;
;
;
;
;
SELECT dname, AVG(AvgScrRead) AS avg_reading_score FROM satscores WHERE rtype = 'D' GROUP BY dname ORDER BY avg_reading_score DESC LIMIT 1;
;
SELECT s.CDSCode FROM schools AS s JOIN satscores AS ss ON s.CDSCode = ss.cds WHERE ss.AvgScrWrite > 499 ORDER BY ss.AvgScrWrite DESC;
;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = ( SELECT MAX(AvgScrMath) FROM satscores )
;
;
SELECT sname FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE County = 'Contra Costa') ORDER BY NumTstTakr DESC LIMIT 1;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
SELECT T1.Street ,  T1.City ,  T1.State ,  T1.Zip FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr LIMIT 1
;
;
;
;
;
SELECT T2.AvgScrMath, T1.County FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite = ( SELECT MIN(T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds )
SELECT T2.AvgScrWrite, T1.City FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 >= 1500 ORDER BY T2.NumTstTakr DESC LIMIT 1
;
;
;
;
;
;
;
SELECT COUNT(*) FROM satscores WHERE dname  =  "Lakeport Unified" AND AvgScrRead  +  AvgScrMath  +  AvgScrWrite  >=  1500
;
;
;
;
;
;
;
SELECT T1.Website FROM `schools` AS T1 INNER JOIN `satscores` AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'San Joaquin' AND T1.Virtual = 'P' AND T1.Charter = 1
SELECT COUNT(*) FROM `schools` WHERE `City` = 'Hickman' AND `DOC` = 52 AND `Charter` = 1;
;
;
;
;
SELECT COUNT(*) FROM `schools` WHERE `County` = 'Stanislaus' AND `FundingType` = 'Directly funded' AND `OpenDate` BETWEEN '2000-01-01' AND '2005-12-31';
;
;
;
;
;
;
;
;
;
;
;
;
SELECT T1.County ,  COUNT(*) AS num FROM schools AS T1 INNER JOIN ( SELECT County FROM schools WHERE CDSCode IN ( SELECT CDSCode FROM schools WHERE County = 'San Diego') AND Virtual = 'F' UNION SELECT County FROM schools WHERE CDSCode IN ( SELECT CDSCode FROM schools WHERE County = 'Santa Barbara') AND Virtual = 'F' ) AS T2 ON T1.County = T2.County GROUP BY T1.County ORDER BY num DESC LIMIT 1;
;
;
;
;
;
;
;
;
;
;
;
SELECT CASE WHEN ( SELECT AVG(A12) FROM district ) > ( SELECT AVG(A13) FROM district ) THEN '1995' ELSE '1996' END AS year_with_higher_unemployment_rate;
SELECT COUNT(*) FROM district WHERE A11 BETWEEN 6000 AND 10000 AND A7 = 'F'
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;
;
;
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND district_id IN (SELECT district_id FROM client WHERE gender = 'M')
SELECT T1.client_id FROM disp AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'POPLATEK PO OBRATU' AND T1.type = 'DISPONENT' GROUP BY T1.client_id HAVING COUNT(*) > 0
SELECT T1.account_id FROM `account` AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T1.date LIKE '1997%' AND T1.frequency = 'POPLATEK TYDNE' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND T1.date LIKE '1993%' ORDER BY T2.amount DESC LIMIT 1;
;
SELECT account_id FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY date ASC LIMIT 1;
SELECT T2.account_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date < '1997-01-01' AND T1.amount > 3000
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued = '1994-03-03'
SELECT T2.date FROM `order` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.k_symbol = 'SIPO' AND T1.bank_to = 'YZ';
SELECT T2.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'
SELECT MAX(T3.amount) FROM `card` AS T1 JOIN `disp` AS T2 ON T1.disp_id = T2.disp_id JOIN `trans` AS T3 ON T3.account_id = T2.account_id WHERE T1.issued = '1996-10-21'
;
SELECT T2.amount FROM `loan` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = (SELECT MAX(amount) FROM loan) ORDER BY T2.date ASC LIMIT 1
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik') AND gender = 'F'
SELECT T3.disp_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T2.account_id = T3.account_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date BETWEEN '1996-01-01' AND '1996-12-31'
;
SELECT T3.birth_date FROM `loan` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `client` AS T3 ON T2.district_id = T3.district_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'
SELECT T1.account_id FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1;
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'south Bohemia' AND T1.A4 = (SELECT MAX(A4) FROM district WHERE A3 = 'south Bohemia')
SELECT (T2.balance - T3.balance) * 100.0 / T3.balance FROM loan AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T2.date = '1998-12-27' AND T3.date = '1993-03-22';
SELECT SUM(IIF(T2.status = 'A', T2.amount, 0)) * 100 / SUM(T2.amount) FROM `account` AS T1 INNER JOIN `loan` AS T2 ON T1.account_id = T2.account_id
SELECT CAST(SUM(IIF(T2.status = 'C', 1, 0)) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.amount < 100000;
SELECT T1.account_id ,  T2.A2 ,  T2.A3 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU'
;
SELECT T1.account_id ,  T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T1.A2, T1.A3 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.loan_id = 4990;
;
SELECT T2.loan_id, T3.A3, T3.A11 FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.duration = 60
SELECT T2.A2, ((T2.A13 - T2.A12) / T2.A12) * 100 AS unemployment_increment_rate FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'D' AND T1.date BETWEEN '1995-01-01' AND '1996-12-31';
SELECT CAST(SUM(IIF(T2.A2 = 'Decin', 1, 0)) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T3.district_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' GROUP BY T3.district_id ORDER BY COUNT(*) DESC LIMIT 9
SELECT T3.A2, SUM(T2.amount) AS total_withdrawal  FROM trans AS T2  JOIN account AS T1 ON T2.account_id = T1.account_id  JOIN district AS T3 ON T1.district_id = T3.district_id  WHERE T2.type = 'VYDAJ' AND T2.date LIKE '1996-01%'  GROUP BY T3.A2  ORDER BY total_withdrawal DESC  LIMIT 10;
;
;
SELECT AVG(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'
;
SELECT T2.account_id FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A16 = ( SELECT MAX(A16) FROM district ) AND strftime('%Y', T2.date) = '1996'
SELECT COUNT(*) FROM trans WHERE type = 'VYBER' AND operation = 'KARTOU' AND balance < 0 AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')
SELECT COUNT(*) FROM `loan` WHERE `date` BETWEEN '1995-01-01' AND '1997-12-31' AND `amount` >= 250000 AND `account_id` IN (SELECT `account_id` FROM `account` WHERE `frequency` = 'POPLATEK MESICNE');
SELECT COUNT(*) FROM account WHERE district_id = 1 AND frequency = 'POPLATEK MESICNE';
;
SELECT COUNT(*) FROM card WHERE type = 'gold' AND disp_id IN (SELECT disp_id FROM disp WHERE type = 'OWNER')
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount > 10000 AND strftime('%Y', T2.date) = '1997'
SELECT T1.account_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T2.bank = 'Pisek'
SELECT T1.account_id FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.disp_id WHERE T2.type = 'gold'
SELECT AVG(T1.amount) FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'VYDANO' AND T1.operation = 'VYBER KARTOU' AND strftime('%Y', T1.date) = '2021' GROUP BY strftime('%m', T1.date)
SELECT T2.account_id FROM trans AS T1 JOIN account AS T2 ON T1.account_id  =  T2.account_id WHERE T1.date LIKE '%1998%' AND T1.operation  =  'VYBER KARTOU' AND T1.amount  <  (SELECT AVG(amount) FROM trans WHERE operation  =  'VYBER KARTOU')
;
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 LIKE '%South Bohemia%') AND gender = 'F'
SELECT T1.account_id FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id  =  T2.district_id WHERE T2.A2  =  'Tábor' AND T1.frequency  =  'VlastnÃ­k'
SELECT T3.type FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN disp AS T3 ON T2.account_id = T3.account_id WHERE T1.A11 > 8000 AND T1.A11 <= 9000 AND T3.type != 'OWNER' GROUP BY T3.type
;
SELECT T3.A2 FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.k_symbol = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T2.A15) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date >= '1997-01-01' AND T2.A15 > 4000
SELECT COUNT(*) FROM card WHERE type = 'classic' AND disp_id IN (SELECT disp_id FROM disp WHERE type = 'OWNER')
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha')
SELECT CAST(SUM(IIF(T2.type = 'GOLD' AND STRFTIME('%Y',T1.date) < '1998',1,0)) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id
SELECT T1.client_id FROM disp AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.amount = (SELECT MAX(amount) FROM loan) LIMIT 1;
SELECT T2.A15 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532;
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;
SELECT T2.trans_id FROM client AS T1 JOIN trans AS T2 ON T1.client_id  =  T2.account_id WHERE T1.client_id  =  3356 AND T2.type  =  'VYBER'
SELECT COUNT(*) FROM (SELECT T1.account_id FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000 GROUP BY T1.account_id)
SELECT T2.type FROM disp AS T1 JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539;
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T3.A2 FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id JOIN `district` AS T3 ON T1.district_id = T3.district_id WHERE T2.status = 'A' GROUP BY T3.A2 ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.account_id IN (SELECT T3.account_id FROM `order` AS T3 WHERE T3.order_id = 32423)
SELECT T2.date, T2.amount FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T4.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T4.client_id) FROM district AS T3 JOIN account AS T2 ON T3.district_id = T2.district_id JOIN disp AS T1 ON T1.account_id = T2.account_id JOIN client AS T4 ON T4.client_id = T1.client_id WHERE T3.A11 > 10000;
SELECT ((SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M' AND STRFTIME('%Y', T2.date) = '1997') - (SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M' AND STRFTIME('%Y', T2.date) = '1996')) * 100 / (SELECT SUM(T2.amount) FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M' AND STRFTIME('%Y', T2.date) = '1996') AS growth_rate
SELECT COUNT(*) FROM trans WHERE date > '1995-01-01' AND operation = 'VYBER KARTOU'
SELECT (SELECT SUM(A16) FROM `district` WHERE A3 = 'north bohemia') - (SELECT SUM(A16) FROM `district` WHERE A3 = 'east bohemia')
SELECT COUNT(*) FROM `disp` WHERE `account_id` BETWEEN 1 AND 10 AND `type` IN ('OWNER', 'DISPONENT')
SELECT type ,  amount FROM trans WHERE account = 3 AND k_symbol = 'VYDAJ' AND amount = 3539;
SELECT birth_date FROM client WHERE client_id = 130;
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'
;
;
SELECT T2.type FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.disp_id WHERE T1.client_id = 9
;
;
;
SELECT COUNT(*) FROM `client` WHERE `gender` = 'M' AND `birth_date` BETWEEN '1974-01-01' AND '1976-12-31' AND EXISTS(SELECT * FROM `disp` WHERE `disp`.`client_id` = `client`.`client_id` AND EXISTS(SELECT * FROM `order` WHERE `order`.`account_id` = `disp`.`account_id` AND `order`.`k_symbol` = 'SIPO' AND `order`.`amount` > 4000))
;
SELECT COUNT(*) FROM client WHERE gender = 'F' AND client_id IN (SELECT client_id FROM disp WHERE type = 'OWNER' AND account_id IN (SELECT account_id FROM account WHERE type = 'JUNIOR CREDIT CARD'))
;
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK TYDNE'
SELECT COUNT(*) FROM disp WHERE type  =  'OWNER' AND account_id IN ( SELECT account_id FROM account WHERE frequency  =  'POPLATEK TYDNE' )
;
SELECT T2.account_id FROM district AS T1 JOIN `order` AS T2 ON T1.district_id = T2.account_id WHERE T1.A11 = (SELECT MIN(A11) FROM district WHERE A6 = 'F') ORDER BY T1.A8 DESC LIMIT 1
SELECT COUNT(*) FROM client WHERE birth_date LIKE '1920%' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'east Bohemia')
SELECT COUNT(*) FROM loan WHERE duration = 24 AND status = 'A' AND (SELECT frequency FROM account WHERE account_id = loan.account_id) = 'POPLATEK TYDNE';
SELECT AVG(T2.amount) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status IN ('C', 'D') AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T1.client_id, T2.district_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER'
;
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'
SELECT AVG(T1.element = 'o') AS avg_oxygen FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-' GROUP BY T3.molecule_id
SELECT AVG(T3.num_bonds) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN (SELECT T4.molecule_id, COUNT(*) AS num_bonds FROM bond AS T4 WHERE T4.bond_type = '-' GROUP BY T4.molecule_id) AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.label = '+'
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+' GROUP BY T1.molecule_id HAVING COUNT(*) >= 3
SELECT CAST(COUNT(CASE WHEN T1.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` BETWEEN 'TR000' AND 'TR099' AND `label` = '+'
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' GROUP BY T1.molecule_id
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9'
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.bond_type = '='
SELECT T3.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' GROUP BY T3.label ORDER BY COUNT(T3.label) DESC LIMIT 1
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl'
SELECT T1.atom_id, T2.atom_id2 FROM `bond` AS T3 JOIN `connected` AS T1 ON T1.bond_id = T3.bond_id JOIN `connected` AS T2 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT T1.atom_id, T3.atom_id2 FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-' UNION SELECT T1.atom_id, T4.atom_id2 FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T4 ON T1.atom_id = T4.atom_id2 WHERE T2.label = '-'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.atom_id) ASC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element != 'sn' GROUP BY T1.label HAVING COUNT(*) = 0
SELECT COUNT(DISTINCT a.atom_id)  FROM atom AS a  JOIN connected AS c ON a.atom_id = c.atom_id  JOIN bond AS b ON c.bond_id = b.bond_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'
SELECT T1.atom_id, T2.atom_id2 FROM bond AS T3 JOIN connected AS T1 ON T3.bond_id = T1.bond_id JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T3.bond_type = '#' GROUP BY T3.bond_id HAVING COUNT(*) > 2;
SELECT T3.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id WHERE T2.molecule_id  =  'TR181' AND T1.atom_id != T3.atom_id
SELECT CAST(SUM(IIF(T3.element != 'F', 1, 0)) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.label = '+' AND T3.element != 'F'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR000' ORDER BY T1.element LIMIT 3;
SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR001' AND T2.bond_id = 'TR001_2_6' UNION SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id2 WHERE T1.molecule_id = 'TR001' AND T2.bond_id = 'TR001_2_6'
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR000_2_5' AND T1.atom_id != T2.atom_id2
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' ORDER BY T1.molecule_id LIMIT 5;
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008' GROUP BY molecule_id;
SELECT ROUND(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) * 100 / COUNT(molecule_id), 3) AS percent FROM molecule;
SELECT ROUND(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) * 100 / COUNT(T1.atom_id), 4) AS percent FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR206'
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000'
SELECT T1.element ,  T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'
SELECT T2.bond_type ,  T3.label FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.molecule_id = 'TR010' GROUP BY T2.bond_type ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' GROUP BY T1.molecule_id ORDER BY T1.molecule_id ASC LIMIT 3
SELECT T1.bond_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR006' ORDER BY T1.bond_id LIMIT 2
SELECT COUNT(*) FROM `connected` WHERE (`atom_id` = 'TR009_12' OR `atom_id2` = 'TR009_12') AND `bond_id` IN (SELECT `bond_id` FROM `bond` WHERE `molecule_id` = 'TR009')
SELECT COUNT(DISTINCT molecule.molecule_id)  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  WHERE molecule.label = '+' AND atom.element = 'br'
SELECT T2.bond_type ,  T1.atom_id ,  T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT T1.molecule_id, T2.label FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T3.label = '+'
SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'p' INTERSECT SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'n'
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT AVG(T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'i' GROUP BY T1.atom_id
SELECT T1.bond_id, T1.bond_type FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id  =  T2.bond_id JOIN `atom` AS T3 ON T2.atom_id2  =  T3.atom_id WHERE CAST(SUBSTR(T3.atom_id, 7, 2) AS REAL) + 0  =  45
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected UNION SELECT atom_id2 FROM connected)
SELECT T1.atom_id FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.molecule_id  =  'TR041' AND T2.bond_type  =  '#'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id2 WHERE T1.element = 'pb'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(T3.bond_id) AS REAL) * 100 / ( SELECT COUNT(T4.bond_id) FROM bond AS T4 ) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element IN ( SELECT T5.element FROM atom AS T5 GROUP BY T5.element ORDER BY COUNT(T5.atom_id) DESC LIMIT 1 ) AND T1.element IN ( SELECT T6.element FROM atom AS T6 JOIN connected AS T7 ON T6.atom_id = T7.atom_id2 WHERE T7.bond_id = T3.bond_id GROUP BY T6.element ORDER BY COUNT(T6.atom_id) DESC LIMIT 1 )
SELECT CAST(COUNT(CASE WHEN m.label = '+' THEN b.bond_id END) AS REAL) * 100 / COUNT(b.bond_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' GROUP BY b.bond_type HAVING b.bond_type = '-' ORDER BY NULL LIMIT 1
SELECT COUNT(*) FROM atom WHERE `element` IN('c','h')
SELECT T1.atom_id2 FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T1.element  =  'sn'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#')) AND element IN ('p', 'br')
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.molecule_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-' GROUP BY T1.molecule_id HAVING COUNT(*) = 1
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT T1.molecule_id FROM molecule AS T1 WHERE T1.label = '-'
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+' AND `molecule_id` BETWEEN 'TR000' AND 'TR030';
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_id = 'TR001_10_11' UNION SELECT T4.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i'
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca' GROUP BY T2.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) > 0 FROM `bond` b JOIN `connected` c ON b.bond_id = c.bond_id JOIN `atom` a1 ON c.atom_id = a1.atom_id JOIN `atom` a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_1_8' AND (a1.element = 'cl' OR a2.element = 'cl') AND (a1.element = 'c' OR a2.element = 'c')
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T4 ON T3.atom_id2 = T4.atom_id WHERE T2.bond_type = '#' AND T1.label = '-' AND T4.element = 'c' LIMIT 2
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR001'
SELECT T1.molecule_id FROM `bond` AS T1 WHERE T1.bond_type = '='
SELECT T1.atom_id AS first_atom, T2.atom_id2 AS second_atom FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN bond AS T3 ON T3.bond_id = T1.bond_id WHERE T3.bond_type = '#'
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_id = 'TR000_1_2' UNION SELECT T4.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT b.bond_id, m.label  FROM bond AS b  JOIN molecule AS m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND (m.label = '+' OR m.label = '-');
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 1) = '4'
SELECT T2.label ,  SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) * 1.0 / COUNT(T1.atom_id) AS ratio FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' GROUP BY T2.label
SELECT T3.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'ca'
;
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id;
SELECT CAST(SUM(CASE WHEN T1.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 WHERE T1.molecule_id = 'TR047'
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1'
SELECT COUNT(*) > 0 FROM `molecule` WHERE `molecule_id` = 'TR151' AND `label` = '+'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR151' AND T1.element IN ('cl', 'br', 'i', 'pb', 'te')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id BETWEEN 'TR010' AND 'TR050'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT T1.bond_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '='
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE atom.element = 'h' AND molecule.label = '+'
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T2.element = 'h' AND T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT COUNT(*) > 0 FROM `molecule` WHERE `molecule_id` = 'TR124' AND `label` = '+'
SELECT T1.atom_id FROM atom AS T1 WHERE T1.molecule_id = 'TR186'
SELECT `bond_type` FROM `bond` WHERE `bond_id` = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_2_4' GROUP BY T1.element;
SELECT COUNT(*) ,  T3.label FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T4 ON T2.atom_id  =  T4.atom_id JOIN molecule AS T3 ON T4.molecule_id  =  T3.molecule_id WHERE T1.bond_type  =  ' =' AND T4.molecule_id  =  'TR006' AND T3.label  =  '+'
SELECT T1.molecule_id, T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T2.bond_id, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-'
SELECT T1.molecule_id, GROUP_CONCAT(T3.element) as elements  FROM bond AS T2  JOIN molecule AS T1 ON T2.molecule_id = T1.molecule_id  JOIN atom AS T3 ON T3.molecule_id = T1.molecule_id  WHERE T2.bond_type = '#'  GROUP BY T1.molecule_id;
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*)  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.element = 'cl' OR a2.element = 'cl'
SELECT T1.atom_id ,  COUNT(DISTINCT T3.bond_type) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(DISTINCT T2.molecule_id) AS total_molecules_with_double_bond,         SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.bond_type = '=';
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element != 's' AND (T3.bond_type != '=' OR T3.bond_type IS NULL)
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-'
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl'
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_3_4'
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.atom_id  =  'TR000_1' AND T2.atom_id2  =  'TR000_2'
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4') OR (T2.atom_id = 'TR000_4' AND T2.atom_id2 = 'TR000_2')
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id = 'TR000_1'
SELECT `label` FROM `molecule` WHERE `molecule_id` = 'TR000'
SELECT CAST(SUM(CASE WHEN T1.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `atom` WHERE `element` = 'n') AND `label` = '+'
SELECT T1.molecule_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 's' AND T3.bond_type = '='
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T1.molecule_id) > 5
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'
SELECT T1.label, T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T4 ON T2.bond_id = T4.bond_id JOIN molecule AS T3 ON T4.molecule_id = T3.molecule_id WHERE T1.element = 'h' AND T4.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '=')
SELECT COUNT(*) FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#')
SELECT T3.element, T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T3.molecule_id = 'TR002'
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.bond_type = '=' AND T3.element = 'c' AND T3.molecule_id = 'TR012'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL OR cardKingdomId IS NULL
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Banned' AND T2.format = 'gladiator';
SELECT L.status FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.types = 'Artifact' AND C.side IS NULL AND L.format = 'vintage'
SELECT T1.id, T1.artist FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE (T1.power = '*' OR T1.power IS NULL) AND T2.format = 'commander' AND T2.status = 'Legal'
SELECT C.name, R.text, CASE WHEN C.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid WHERE C.artist = 'Stephen Daniele'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s';
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T2.uuid ORDER BY COUNT(T2.uuid) DESC LIMIT 1;
SELECT T1.language FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Annul' AND T2.number = '29' GROUP BY T1.language
SELECT name FROM foreign_data WHERE language = 'Japanese' GROUP BY name
SELECT CAST(COUNT(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode;
SELECT T2.name, T2.totalSetSize FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode  =  T2.code WHERE T1.language  =  'Italian'
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'
SELECT `keywords` FROM `cards` WHERE `name` = 'Angel of Mercy'
SELECT COUNT(*) FROM `cards` WHERE `power` = '*'
;
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen'
;
;
SELECT COUNT(*) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Restricted' AND T2.isTextless = 0;
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'
SELECT COUNT(*) FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Restricted' AND cards.isStarter = 1;
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T2.artist FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Phyrexian' GROUP BY T2.artist
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 FROM cards;
;
SELECT COUNT(*) FROM foreign_data WHERE language = 'Russian' AND uuid IN (SELECT uuid FROM cards WHERE borderColor = 'borderless')
SELECT CAST(SUM(IIF(T2.language = 'French', 1, 0)) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1;
SELECT COUNT(*) FROM `cards` WHERE `toughness` = 99;
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND (availability = 'mtgo');
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT T1.layout FROM `cards` AS T1 INNER JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Legal' AND T1.keywords LIKE '%flying%'
SELECT COUNT(*) FROM `cards` WHERE `type` = 'Summon - Angel' AND uuid NOT IN ( SELECT uuid FROM `foreign_data` WHERE `type` LIKE '%Angel%' )
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a';
;
SELECT T2.artist FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Chinese Simplified' GROUP BY T2.artist
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese' AND T1.availability = 'paper' GROUP BY T1.name HAVING COUNT(*) = 1
SELECT COUNT(*) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned' AND T2.borderColor = 'white'
SELECT T1.uuid, T2.language FROM legalities AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy' AND T1.status = 'Legal' GROUP BY T1.uuid, T2.language
SELECT text FROM rulings WHERE uuid = '56f4935b-f6c5-59b9-88bf-9bcce20247ce'
SELECT COUNT(T1.id), T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'Legal' GROUP BY T2.status
;
;
SELECT T1.name ,  T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20 GROUP BY T1.colors ,  T2.format
SELECT t1.name FROM `cards` AS t1 JOIN `foreign_data` AS t2 ON t1.uuid = t2.uuid WHERE t1.originalType = 'Artifact' AND t1.colors = 'B' AND t2.language IS NOT NULL GROUP BY t1.name HAVING COUNT(*) > 0
SELECT T1.name FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'John Avon' AND `cardKingdomId` IS NOT NULL AND `cardKingdomFoilId` IS NOT NULL
SELECT COUNT(*) FROM(SELECT * FROM `cards` WHERE `borderColor` = 'white' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL) AS PowerfulWhiteCards;
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1;
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;
;
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS INT)) FROM cards WHERE artist = 'Rob Alexander' AND manaCost IS NOT NULL GROUP BY artist
;
SELECT T1.setCode FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Spanish' GROUP BY T1.setCode
SELECT CAST(SUM(IIF(isOnlineOnly = 1, 1, 0)) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE `frameEffects` = 'legendary'
SELECT CAST(COUNT(CASE WHEN T1.isStorySpotlight = 1 AND T1.isTextless = 0 THEN T1.id END) AS REAL) * 100 / COUNT(T1.id), T1.id FROM cards AS T1 WHERE T1.isStorySpotlight = 1 GROUP BY T1.id
SELECT T2.name ,  CAST(SUM(IIF(T1.language = 'Spanish' , 1 , 0)) AS REAL) * 100 / COUNT(T1.id) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code GROUP BY T2.name
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309 GROUP BY T2.language
SELECT COUNT(*) FROM `set_translations` WHERE `language` = 'Portuguese (Brasil)' AND `setCode` IN(SELECT `code` FROM `sets` WHERE `block` = 'Commander')
SELECT T1.id FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types LIKE '%Creature%' AND T2.status = 'Legal'
;
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `text` LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'premodern' AND T3.text = 'This is a triggered mana ability.' AND T1.side IS NULL;
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper' LIMIT 1;
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT T2.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.layout = 'normal' AND T1.borderColor = 'black' AND T1.artist = 'Matthew D. Wilson' AND T2.language = 'French';
SELECT COUNT(*) FROM `cards` c JOIN `rulings` r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ravnica' AND T1.baseSetSize = 180 GROUP BY T2.language
SELECT CAST(SUM(IIF(T2.hasContentWarning = 0, 1, 0)) AS REAL) * 100 / COUNT(T1.id) FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'commander' AND T1.status = 'Legal';
SELECT CAST(SUM(IIF(T2.language = 'French', 1, 0)) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'
SELECT CAST(SUM(IIF(T2.language = 'Japanese' AND T1.type = 'expansion', 1, 0)) AS REAL) * 100 / COUNT(T1.code) FROM `sets` AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode;
SELECT `availability` FROM `cards` WHERE `artist` = 'Daren Bader'
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'borderless' AND `edhrecRank` > 12000;
SELECT COUNT(*) FROM `cards` WHERE `isOversized` = 1 AND `isReprint` = 1 AND `isPromo` = 1;
SELECT name FROM `cards` WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name LIMIT 3;
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;
SELECT CAST(SUM(IIF(isTextless = 1 AND layout = 'normal', 1, 0)) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE layout = 'normal'
SELECT c.number FROM cards AS c WHERE c.layout NOT LIKE '%split%' AND c.subtypes LIKE '%Angel%' AND c.subtypes LIKE '%Wizard%'
;
;
SELECT T1.name, T2.name FROM sets AS T1 JOIN foreign_data AS T2 ON T1.id = T2.multiverseid WHERE T1.id = 5 GROUP BY T2.name;
;
SELECT s.id, s.code FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name LIMIT 2;
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS(SELECT * FROM set_translations WHERE sets.code = set_translations.setCode AND set_translations.language = 'Japanese');
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' AND T1.baseSetSize = ( SELECT MAX(T1.baseSetSize) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' )
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.isOnlineOnly) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Chinese Simplified'
;
SELECT COUNT(*) FROM cards WHERE borderColor = 'black'
SELECT COUNT(*) ,  id FROM cards WHERE frameEffects = 'extendedart'
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174
SELECT `name` FROM `sets` WHERE `code` = 'ALL'
SELECT T2.language FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13' LIMIT 1;
SELECT s.baseSetSize, s.code FROM sets AS s WHERE s.block = 'Masques' OR s.block = 'Mirage'
SELECT code FROM sets WHERE type = 'expansion';
SELECT T2.name, T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros'
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie' GROUP BY T2.language;
SELECT CAST(SUM(IIF(convertedManaCost = 10 , 1 , 0)) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE name = 'Abyssal Horror'
;
SELECT T2.translation FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.watermark = 'abzan' AND T1.type = 'Creature - Goblin Wizard' LIMIT 1;
SELECT T2.language, T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'azorius'
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Aaron Miller' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;
SELECT COUNT(*) FROM `cards` WHERE `availability` LIKE '%paper%' AND `hand` = '3'
SELECT name FROM cards WHERE isTextless = 0;
;
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;
SELECT subtypes ,  supertypes FROM cards WHERE name  =  'Molimo, Maro-Sorcerer'
;
;
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM `cards` WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T2.translation FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode  =  T2.setCode WHERE T1.name  =  'Ancestor''s Chosen' AND T2.language  =  'Italian'
SELECT COUNT(*) FROM `set_translations` WHERE `setCode` IN (SELECT `code` FROM `sets` WHERE `name` = 'Angel of Mercy')
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T3.translation = 'Hauptset Zehnte Edition' GROUP BY T1.name
SELECT EXISTS(SELECT * FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen') AND language = 'Korean');
;
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T1.name  =  'Eighth Edition' AND T2.language  =  'Chinese Simplified'
SELECT EXISTS(SELECT * FROM `cards` WHERE `name` = 'Angel of Mercy' AND `setCode` IN (SELECT `code` FROM `sets` WHERE `mtgoCode` IS NOT NULL)) AS AppearsOnMTGO;
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode  =  T2.code WHERE T1.name  =  'Ancestor''s Chosen'
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM `sets` AS s JOIN `foreign_data` AS fd ON s.code = fd.multiverseid WHERE s.block = 'Ice Age' AND fd.language = 'Italian' AND fd.text IS NOT NULL;
SELECT IIF(T2.isForeignOnly = 1, 'Yes', 'No') FROM `cards` AS T1 INNER JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` = 'Italian' AND `set_translations`.`translation` IS NOT NULL AND `sets`.`baseSetSize` < 100
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black'
SELECT T1.name FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1;
SELECT DISTINCT artist FROM cards WHERE name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT * FROM cards WHERE name = 'Coldsnap' AND number = 4;
SELECT COUNT(*) FROM (SELECT * FROM `cards` WHERE `name` = 'Coldsnap' AND `convertedManaCost` > 5) AS T1 LEFT JOIN (SELECT * FROM `cards` WHERE `power` = '*' OR `power` IS NULL) AS T2 ON T1.id = T2.id WHERE T1.power = '*' OR T1.power IS NULL
SELECT `flavorText` FROM `foreign_data` WHERE `language` = 'Italian' AND `name` = 'Ancestor''s Chosen'
SELECT DISTINCT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL
;
;
;
SELECT T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Reminisce'
SELECT CAST(SUM(IIF(convertedManaCost = 7 , 1 , 0)) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE setCode = 'CSP'
SELECT CAST(SUM(IIF(T2.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomId IS NOT NULL , 1 , 0)) AS REAL) * 100 / COUNT(*) FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT T2.text, CASE WHEN T1.hasContentWarning = 1 THEN 'has missing or degraded properties and values' ELSE 'does not have missing or degraded properties and values' END FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec'
;
SELECT COUNT(*) FROM `sets` WHERE `name` = 'Rinascita di Alara'
SELECT T1.type FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'
SELECT T2.translation FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode  =  T2.setCode WHERE T1.name  =  'Tendo Ice Bridge' AND T2.language  =  'French'
SELECT COUNT(*) FROM `set_translations` WHERE `translation` IS NOT NULL AND `setCode` = '10E'
;
;
SELECT T1.releaseDate FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'
SELECT T2.type FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode  =  T2.code WHERE T1.name  =  'Samite Pilgrim'
SELECT COUNT(*) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'World Championship Decks 2004') AND convertedManaCost = 3;
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'
;
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Portuguese (Brazil)'
;
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT T1.artist FROM cards AS T1 WHERE T1.side IS NULL AND T1.convertedManaCost = ( SELECT MAX(T2.convertedManaCost) FROM cards AS T2 WHERE T2.side IS NULL )
SELECT T2.frameEffects FROM (SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IN (SELECT cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL)) AS T1 JOIN (SELECT cardKingdomFoilId, frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL) AS T2 ON T1.cardKingdomFoilId = T2.cardKingdomFoilId GROUP BY T2.frameEffects ORDER BY COUNT(T2.cardKingdomFoilId) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'A'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duels' AND T1.manaCost IS NOT NULL ORDER BY T1.manaCost DESC LIMIT 10;
;
SELECT COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'
SELECT COUNT(*) FROM cards WHERE name = 'Abundance' AND rarity = 'rare' AND types LIKE '%Enchantment%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal')
SELECT T2.format ,  T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' GROUP BY T2.format ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond' GROUP BY T2.language
SELECT T2.format FROM (SELECT artist, COUNT(*) AS num_cards FROM cards GROUP BY artist) AS T1 JOIN legalities AS T2 ON T1.artist = T2.uuid WHERE T1.num_cards = (SELECT MIN(num_cards) FROM (SELECT artist, COUNT(*) AS num_cards FROM cards GROUP BY artist))
;
SELECT T1.name, T2.format FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.edhrecRank = 1 GROUP BY T1.name, T2.format
SELECT AVG(T1.id) ,  T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT artist FROM cards WHERE bordercolor = 'black' AND availability = 'arena' GROUP BY artist;
SELECT uuid FROM legalities WHERE `format` = 'oldschool' AND (`status` = 'banned' OR `status` = 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC;
;
SELECT T1.name FROM `sets` AS T1 JOIN `foreign_data` AS T2 ON T1.code = T2.multiverseid WHERE T2.language = 'Korean' AND NOT EXISTS ( SELECT * FROM `foreign_data` WHERE `foreign_data`.multiverseid = T1.code AND language LIKE '%Japanese%' ) GROUP BY T1.name
SELECT T1.frameVersion, T1.name FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned' GROUP BY T1.frameVersion, T1.name
SELECT T1.DisplayName FROM Users AS T1 WHERE T1.DisplayName IN ('Harlan', 'Jarrod Dixon') AND T1.Reputation = (SELECT MAX(T2.Reputation) FROM Users AS T2 WHERE T2.DisplayName IN ('Harlan', 'Jarrod Dixon'))
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1
SELECT COUNT(*) FROM Users WHERE UpVotes > 100 AND DownVotes > 1;
SELECT COUNT(*) FROM users WHERE Views > 10 AND STRFTIME('%Y', CreationDate) > '2013'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
;
SELECT U.DisplayName AS Owner FROM Posts P JOIN Users U ON P.OwnerUserId = U.Id WHERE P.Title = 'Eliciting priors from experts'
SELECT p.Title FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ViewCount = (SELECT MAX(ViewCount) FROM Posts WHERE OwnerUserId = u.Id)
SELECT U.DisplayName FROM Users AS U JOIN Posts AS P ON U.Id = P.OwnerUserId WHERE P.FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts)
SELECT SUM(T2.CommentCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT T2.AnswerCount FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' ORDER BY T2.AnswerCount DESC LIMIT 1
SELECT U.DisplayName FROM Users AS U JOIN Posts AS P ON U.Id = P.LastEditorUserId WHERE P.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL;
SELECT T1.DisplayName FROM Users AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE Age > 65) AND Score >= 20
SELECT U.Location FROM Users AS U JOIN Posts AS P ON U.Id = P.OwnerUserId WHERE P.Title = 'Eliciting priors from experts'
SELECT p.Body FROM Posts AS p JOIN Tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'
SELECT T1.Body FROM Posts AS T1 JOIN Tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.Count = (SELECT MAX(T3.Count) FROM Tags AS T3)
SELECT COUNT(*) FROM Badges WHERE UserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie')
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND strftime('%Y', Date) = '2011'
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(*) AS BadgeCount FROM Badges GROUP BY UserId) AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id ORDER BY T1.BadgeCount DESC LIMIT 1;
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.DisplayName) FROM Users u JOIN Badges b ON u.Id = b.UserId WHERE u.Views > 200;
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5
SELECT COUNT(*) FROM Votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
;
SELECT COUNT(Id) FROM Badges WHERE Name = 'Revival';
SELECT p.Title FROM Posts AS p JOIN Comments AS c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM Comments)
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount = 1910)
SELECT COUNT(*) FROM (SELECT PostId FROM Comments WHERE UserId = '3025' AND CreationDate = '2014-04-23 20:29:39.0') AS c JOIN Posts AS p ON p.Id = c.PostId WHERE p.FavoriteCount > 0
SELECT "text" FROM "comments" WHERE "postId" = 107829 AND "commentCount" = 1;
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'not well-finished' ELSE 'well-finished' END AS post_status FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0';
SELECT Reputation FROM users WHERE Id IN (SELECT OwnerUserId FROM posts WHERE Id = 65041)
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini'
SELECT T2.DisplayName FROM Votes AS T1 INNER JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347
SELECT COUNT(*) FROM Posts AS p JOIN Votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%' AND v.VoteTypeId IN (2, 3)
SELECT b.Name FROM Badges AS b JOIN Users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(T3.Id) FROM Posts AS T1 INNER JOIN Users AS T2 ON T2.Id = T1.OwnerUserId INNER JOIN Votes AS T3 ON T3.PostId = T1.Id WHERE T2.Id = 24
