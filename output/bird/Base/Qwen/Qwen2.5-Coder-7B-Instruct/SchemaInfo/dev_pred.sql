SELECT MAX("Percent (%) Eligible Free (K-12)") AS MaxEligibleFreeRate FROM frpm WHERE "County Name" = 'Alameda'; 
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
;
;
;
;
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.operation = 'VYBER KARTOU' AND d.A3 = 'east Bohemia'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague'; 
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM district ORDER BY (AVG(A12) - AVG(A13)) DESC LIMIT 1
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND district_id IN (SELECT DISTINCT district_id FROM client WHERE gender = 'F'); 
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'north Bohemia' AND d.A11 > 8000; 
SELECT AVG(A11) AS avg_salary FROM district WHERE A5 IN (SELECT MIN(district_id) FROM district GROUP BY A5 ORDER BY COUNT(*) DESC LIMIT 1); 
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.birth_date IN (SELECT MIN(birth_date) FROM client GROUP BY district_id ORDER BY AVG(A11) DESC LIMIT 1) 
SELECT COUNT(DISTINCT t1.client_id) AS customer_count FROM client AS t1 JOIN disp AS t2 ON t1.client_id = t2.client_id JOIN account AS t3 ON t2.account_id = t3.account_id WHERE t3.frequency = 'POPLATEK TYDNE' AND t2.type = 'OWNER'; 
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'DISPONENT'; 
SELECT DISTINCT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 ORDER BY l.amount ASC, a.frequency = 'POPLATEK TYDNE' LIMIT 1; 
SELECT a.account_id, l.amount, a.date FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND EXTRACT(YEAR FROM a.date) = 1993 ORDER BY l.amount DESC LIMIT 1; 
SELECT COUNT(*) FROM client AS c JOIN district AS d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov'; 
SELECT account_id FROM trans WHERE EXTRACT(YEAR FROM date) = 1995 ORDER BY date ASC LIMIT 1; 
SELECT DISTINCT t.account_id FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.date < '1997-01-01' AND t.amount > 3000; 
SELECT client_id FROM card WHERE issued = '1994-03-03'; 
SELECT T2.date FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.date = '1998-10-14'; 
SELECT T2.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'
SELECT MAX(t.amount) AS max_transaction_amount FROM trans t JOIN card c ON t.account_id = c.account_id WHERE c.issued = '961021'; 
SELECT c.gender FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE client_id IN (         SELECT client_id         FROM account         GROUP BY client_id         HAVING AVG(d.A11) = (             SELECT MAX(AVG(A11))             FROM district         )     ) ); 
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE c.client_id = (     SELECT cl.client_id     FROM client cl     JOIN disp d ON cl.client_id = d.client_id     JOIN loan l ON d.disp_id = l.disp_id     ORDER BY l.amount DESC     LIMIT 1 ) ORDER BY t.date ASC LIMIT 1; 
SELECT COUNT(client_id) FROM client JOIN account ON client.client_id = account.client_id JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'F'; 
SELECT d.disp_id FROM disp d JOIN trans t ON d.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02'; 
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Litomerice' AND YEAR(T1.date) = 1996; 
SELECT T2.A2 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'; 
SELECT T2.birth_date FROM loan AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'; 
SELECT a.account_id FROM account AS a JOIN district AS d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1; 
SELECT (COUNT(CASE WHEN T2.gender = 'M' THEN 1 ELSE NULL END) / COUNT(T2.client_id)) * 100 AS male_percentage FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'south Bohemia' ORDER BY CAST(REPLACE(SUBSTR(T1.A4, 2), ',', '') AS INTEGER) DESC LIMIT 1; 
SELECT      (t1.balance - t2.balance) / t2.balance * 100 AS increase_rate FROM      trans t1 JOIN      trans t2 ON t1.account_id = t2.account_id AND t1.date = '1998-12-27' WHERE      t2.date = '1993-03-22'; 
SELECT CAST(SUM(CASE WHEN T1.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1
SELECT CAST(SUM(CASE WHEN T1.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan AS T1 WHERE T1.amount < 100000 
SELECT DISTINCT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK PO OBRATU'; 
SELECT DISTINCT c.client_id, a.account_id, a.frequency FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE '%east Bohemia%' AND a.date BETWEEN '1995-01-01' AND '2000-12-31'; 
SELECT T1.account_id, T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice' 
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990; 
SELECT T1.account_id, T2.A2 AS district, T2.A3 AS region FROM loan AS T1 JOIN account AS T3 ON T1.account_id = T3.account_id JOIN district AS T2 ON T3.district_id = T2.district_id WHERE T1.amount > 300000; 
SELECT l.loan_id, d.A3, AVG(d.A11) AS avg_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60 GROUP BY l.loan_id, d.A3; 
SELECT d.A3, d.A13, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN disp dp ON l.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'D'; 
SELECT (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 ELSE NULL END) * 100.0 / COUNT(a.account_id)) AS percentage FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993; 
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT d.A2 AS district, COUNT(c.client_id) AS female_count FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_count DESC LIMIT 9; 
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.date BETWEEN '1996-01-01' AND '1996-01-31' AND t.type = 'VYDAJ' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id LEFT JOIN card ca ON c.client_id = ca.disp_id WHERE d.A3 = 'south Bohemia' AND ca.card_id IS NULL; 
SELECT d.A3 AS district_name FROM district d JOIN loan l ON d.district_id = l.district_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id, d.A3 ORDER BY COUNT(l.loan_id) DESC LIMIT 1; 
SELECT AVG(loan.amount) AS avg_loan_amount FROM loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M'; 
SELECT d.A2, d.A3, d.A10, d.A11, d.A12, d.A13 FROM district d ORDER BY d.A13 DESC LIMIT 10; 
SELECT COUNT(account_id) AS num_accounts_opened FROM account WHERE district_id = (     SELECT district_id     FROM district     ORDER BY A16 DESC     LIMIT 1 ); 
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN card c ON t.disp_id = c.disp_id WHERE t.type = 'VYBER KARTOU' AND t.balance < 0 AND t.operation = 'VYBER KARTOU'; 
SELECT COUNT(DISTINCT l.account_id) AS loan_count FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.amount >= 250000 AND a.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(DISTINCT l.account_id) AS running_contracts_count FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.district_id = 1 AND l.status = 'C'; 
SELECT COUNT(client_id) FROM client WHERE district_id = (SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1) AND gender = 'M'; 
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER'; 
SELECT COUNT(*) FROM district AS d JOIN account AS a ON d.district_id = a.district_id WHERE d.A2 = 'Pisek'; 
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND EXTRACT(YEAR FROM t.date) = 1997; 
SELECT DISTINCT o.account_id FROM order o JOIN account a ON o.account_id = a.account_id WHERE o.k_symbol = 'SIPO' AND a.district_id IN (     SELECT district_id FROM district WHERE A2 = 'Pisek' ); 
SELECT T1.account_id FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'gold'
SELECT AVG(amount) AS avg_monthly_credit_card_amount FROM trans WHERE EXTRACT(YEAR FROM date) = 2021 AND operation = 'VYBER KARTOU'; 
SELECT DISTINCT t.account_id FROM trans t JOIN card c ON t.account_id = c.account_id WHERE t.type = 'VYBER KARTOU' AND t.amount < (SELECT AVG(amount) FROM trans WHERE EXTRACT(YEAR FROM date) = 1998) AND EXTRACT(YEAR FROM t.date) = 1998; 
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id AND d.type = 'OWNER' JOIN card ca ON d.disp_id = ca.disp_id JOIN account acc ON ca.account_id = acc.account_id JOIN loan l ON acc.account_id = l.account_id WHERE c.gender = 'F'; 
SELECT COUNT(DISTINCT c.client_id) AS female_clients_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 = 'south Bohemia'; 
SELECT DISTINCT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id WHERE d.A2 = 'Tabor' AND dp.type = 'OWNER'; 
SELECT DISTINCT T1.type FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type != 'OWNER' AND T3.A11 BETWEEN 8000 AND 9000
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'north Bohemia' AND t.bank = 'AB'; 
SELECT T2.A2 FROM trans AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.type = 'VYDAJ' GROUP BY T2.A2
SELECT AVG(A15) AS avg_crimes_1995 FROM district WHERE A15 > 4000 AND district_id IN (     SELECT district_id     FROM account     WHERE date >= '1997-01-01' ); 
SELECT COUNT(*) FROM card WHERE type = 'classic' AND disp_id IN (SELECT disp_id FROM disp WHERE type = 'OWNER'); 
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha'; 
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM card; 
SELECT c.client_id, c.gender, c.birth_date, d.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id IN (     SELECT l.account_id     FROM loan l     ORDER BY l.amount DESC     LIMIT 1 ); 
SELECT SUM(T1.A15) AS total_crimes FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532; 
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333; 
SELECT t.trans_id, t.date, t.amount FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE t.client_id = 3356 AND t.operation = 'VYBER'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000; 
SELECT T2.type FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.disp_id WHERE T1.client_id = 13539
SELECT T1.A3 FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541; 
SELECT T2.A2 FROM loan AS T1 JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'A' GROUP BY T2.A2 ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.client_id FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN order AS o ON a.account_id = o.account_id WHERE o.order_id = 32423
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5; 
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik'); 
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'junior' AND ca.issued >= '1997-01-01'; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client AS T1  JOIN account AS T2 ON T1.client_id = T2.client_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T3.A11 > 10000; 
SELECT      ((SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /       SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM      loan l JOIN      disp d ON l.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.gender = 'M'; 
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'; 
SELECT (SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) -        SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END)) AS crime_difference FROM district; 
SELECT type, COUNT(*) AS count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type; 
SELECT T1.frequency, SUM(T2.amount) AS total_amount FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = 3 AND T2.type = 'VYBER' GROUP BY T1.frequency; 
SELECT birth_date FROM client WHERE client_id = 130; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(T1.amount) AS total_debt, T2.status AS payment_status FROM loan AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 992; 
SELECT SUM(t.amount), c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE t.trans_id = 851 AND c.client_id = 4; 
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 9; 
SELECT SUM(amount) AS total_paid FROM trans WHERE client_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31'; 
SELECT c.client_id, c.gender, c.birth_date, d.A3 AS region FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'east Bohemia'; 
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3 
SELECT COUNT(DISTINCT c.client_id) AS male_customers FROM client c JOIN trans t ON c.client_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'VYDAJ' AND t.k_symbol = 'SIPO' AND t.amount > 4000; 
SELECT COUNT(account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > '1996-12-31'; 
SELECT COUNT(DISTINCT c.client_id) AS female_customers_with_junior_cards FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior'; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id IN (SELECT district_id FROM district WHERE A3 LIKE '%Prague%') 
SELECT (COUNT(CASE WHEN T1.gender = 'M' THEN 1 ELSE NULL END) * 100.0 / COUNT(T1.client_id)) AS percentage FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER' AND T2.account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE') 
SELECT COUNT(DISTINCT c.client_id) AS num_clients FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'; 
SELECT a.account_id, a.date AS account_opening_date, l.amount AS loan_amount, l.duration AS loan_duration FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC, a.date ASC LIMIT 1; 
SELECT DISTINCT T1.account_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' GROUP BY T1.client_id ORDER BY AVG(T1.A11) ASC LIMIT 1; 
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE EXTRACT(YEAR FROM client.birth_date) = 1920 AND district.A3 = 'east Bohemia'; 
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE'; 
SELECT AVG(loan.amount) AS avg_loan_amount FROM loan JOIN trans ON loan.account_id = trans.account_id WHERE loan.status = 'C' AND trans.k_symbol = 'POPLATEK PO OBRATU'; 
SELECT DISTINCT d.client_id, a.district_id FROM disp d JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER'; 
SELECT T1.client_id , TIMESTAMPDIFF(YEAR, T1.birth_date, CURDATE()) AS age FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl'; 
SELECT AVG(CASE WHEN T3.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T1.atom_id OR T3.atom_id = T1.atom_id2 WHERE T2.bond_type = '-'; 
SELECT AVG(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS avg_single_bonded_carcinogenic FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT COUNT(*)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'na' AND m.label = '-'; 
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'; 
SELECT CAST(SUM(CASE WHEN T3.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(T2.atom_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '='; 
SELECT COUNT(*) FROM bond WHERE bond_type = '#'; 
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'; 
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c'
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id = 'TR004_8_9'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '='; 
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(m.label) DESC LIMIT 1; 
SELECT T2.bond_type FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'cl'; 
SELECT DISTINCT a1.atom_id, a2.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-'; 
SELECT DISTINCT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '-'; 
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1; 
SELECT T1.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8'); 
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn'); 
SELECT COUNT(DISTINCT a.atom_id) AS distinct_atom_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'; 
SELECT DISTINCT atom_id, atom_id2 FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#'; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id IN (     SELECT b.bond_id     FROM bond b     WHERE b.molecule_id = 'TR181' ); 
SELECT CAST(COUNT(DISTINCT CASE WHEN T2.element = 'f' THEN T1.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' 
SELECT CAST(COUNT(CASE WHEN b.bond_type = '#' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(b.bond_id) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+'; 
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3; 
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE c.molecule_id = 'TR001' AND b.bond_id = 'TR001_2_6'; 
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule; 
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5'; 
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T2.molecule_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' GROUP BY T2.molecule_id ORDER BY T2.molecule_id LIMIT 5;
SELECT ROUND(CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(bond_id), 5) AS percent FROM bond WHERE molecule_id = 'TR008'; 
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT ROUND(CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(atom_id), 4) AS percent FROM atom WHERE molecule_id = 'TR206'
SELECT DISTINCT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR000') OR c.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR000'); 
SELECT T1.element, T4.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T1.molecule_id = 'TR060'; 
SELECT bond_type, COUNT(*) AS bond_count, label FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR010'  GROUP BY bond_type, label  ORDER BY bond_count DESC  LIMIT 1; 
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id ASC LIMIT 3; 
SELECT b.bond_id, b.bond_type  FROM bond AS b  JOIN connected AS c ON b.bond_id = c.bond_id  WHERE c.molecule_id = 'TR006'  ORDER BY b.bond_id ASC  LIMIT 2; 
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009'; 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'br'; 
SELECT b.bond_type, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id LEFT JOIN atom a1 ON c.atom_id = a1.atom_id LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_6_9'; 
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '#'; 
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'; 
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR004'; 
SELECT COUNT(*) FROM molecule WHERE label = '-'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'; 
SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id AND a1.element = 'p' JOIN atom a2 ON c.atom_id2 = a2.atom_id AND a2.element = 'n'; 
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.label ORDER BY COUNT(b.bond_id) DESC LIMIT 1; 
SELECT AVG(COUNT(T2.bond_id)) AS avg_bonds_per_atom FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'i'; 
SELECT b.bond_type, b.bond_id FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE CAST(SUBSTR(c.atom_id2, 7, 2) AS INT) = 45; 
SELECT element FROM atom WHERE atom_id NOT IN (SELECT DISTINCT atom_id OR atom_id2 FROM connected)
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#'; 
SELECT DISTINCT t1.element FROM atom AS t1 JOIN connected AS t2 ON t1.atom_id = t2.atom_id OR t1.atom_id = t2.atom_id2 WHERE t2.bond_id = 'TR144_8_19'; 
SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1; 
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT DISTINCT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'pb') AND atom_id NOT IN (SELECT atom_id FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE element = 'pb')) 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'; 
SELECT CAST(COUNT(*) AS FLOAT) * 100 / ( SELECT MAX(COUNT(*)) FROM ( SELECT atom_id FROM connected GROUP BY atom_id ) ) AS percentage FROM (     SELECT b.bond_id     FROM bond b     JOIN connected c ON b.bond_id = c.bond_id     JOIN atom a ON c.atom_id = a.atom_id     WHERE a.element IN (         SELECT element         FROM atom         GROUP BY element         ORDER BY COUNT(*) DESC         LIMIT 2     ) ) subquery 
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '-' AND T2.label = '+' THEN 1 ELSE NULL END) AS FLOAT) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h'); 
SELECT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'; 
SELECT T1.bond_type FROM bond AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'sn'
SELECT COUNT(DISTINCT T1.element) AS num_elements FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'; 
SELECT COUNT(DISTINCT T3.atom_id) AS total_atoms FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND (T3.element = 'p' OR T3.element = 'br'); 
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'; 
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-'; 
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002'); 
SELECT molecule_id FROM molecule WHERE label = '-'; 
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'; 
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'; 
SELECT a1.element, a2.element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_10_11'; 
SELECT COUNT(DISTINCT T1.bond_id) FROM bond AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 'i'; 
SELECT MAX(T1.label) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'; 
SELECT CASE WHEN EXISTS (     SELECT 1 FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'cl' ) AND EXISTS (     SELECT 1 FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'c' ) THEN 'Yes' ELSE 'No' END AS result; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON m.molecule_id = a.molecule_id AND (a.element = 'c') WHERE b.bond_type = '#' AND m.label = '-'; 
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT DISTINCT t3.element FROM connected AS t1 JOIN bond AS t2 ON t1.bond_id = t2.bond_id JOIN atom AS t3 ON t1.atom_id = t3.atom_id WHERE t3.molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = '='; 
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_1_2'; 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_10_11'; 
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+'; 
SELECT t3.element FROM molecule AS t1 JOIN atom AS t2 ON t1.molecule_id = t2.molecule_id JOIN atom AS t3 ON t1.molecule_id = t3.molecule_id AND t3.atom_id = CONCAT(t1.molecule_id, '_4') WHERE t1.label = '+' AND SUBSTR(t2.atom_id, 7, 1) = '4'; 
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS ratio, label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006'; 
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'; 
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'c' AND a2.element != 'c') OR (a1.element != 'c' AND a2.element = 'c'); 
SELECT DISTINCT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_10_11'; 
SELECT (COUNT(CASE WHEN T2.bond_type = '#' THEN 1 ELSE NULL END) * 100.0 / COUNT(T2.bond_type)) AS percentage_of_triple_bonds FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id; 
SELECT CAST(SUM(CASE WHEN b.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) AS percent FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR047') OR c.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR047')) AND b.molecule_id = 'TR047'; 
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'
SELECT label FROM molecule WHERE molecule_id = 'TR151'; 
SELECT element FROM atom WHERE molecule_id = 'TR151'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT DISTINCT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'; 
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'); 
SELECT T1.bond_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.label  =  '+' AND T1.bond_type  =  '='
SELECT COUNT(*) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' AND T2.label = '+'; 
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'; 
SELECT CAST(SUM(CASE WHEN T3.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id = T3.atom_id2 WHERE T3.bond_type != 'None'; 
SELECT label FROM molecule WHERE molecule_id = 'TR124'; 
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'; 
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id = 'TR001_2_4'; 
SELECT COUNT(*) AS double_bond_count, m.label AS carcinogenicity FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.molecule_id = 'TR006'; 
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'; 
SELECT b.bond_id, b.molecule_id, a1.element AS atom1_element, a2.element AS atom2_element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-'; 
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '#' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT DISTINCT t1.element FROM atom AS t1 JOIN connected AS t2 ON t1.atom_id = t2.atom_id WHERE t2.bond_id = 'TR000_2_3'; 
SELECT COUNT(*) FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl') OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl')) 
SELECT a.atom_id, COUNT(b.bond_type) AS bond_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id; 
SELECT COUNT(DISTINCT m.molecule_id) AS total_carcinogenic_molecules_with_double_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '='; 
SELECT COUNT(DISTINCT m.molecule_id) AS molecule_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.atom_id = b.atom_id OR a.atom_id2 = b.atom_id WHERE a.element != 's' AND b.bond_type != '='; 
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '-'; 
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'; 
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id; 
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'; 
SELECT COUNT(DISTINCT T1.element) AS num_elements FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id IN (T2.atom_id, T2.atom_id2) WHERE T2.bond_id = 'TR001_3_4'; 
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2'); 
SELECT m.molecule_id FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.atom_id IN ('TR000_2', 'TR000_4'); 
SELECT element FROM atom WHERE atom_id = 'TR000_1'; 
SELECT label FROM molecule WHERE molecule_id = 'TR000'; 
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id; 
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecules_with_nitrogen FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+'; 
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '='; 
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id, m.label HAVING COUNT(a.atom_id) > 5; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR024' AND b.bond_type = '='; 
SELECT m.molecule_id, m.label, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id, m.label ORDER BY atom_count DESC LIMIT 1; 
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) AS FLOAT) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'h' AND T2.bond_type = '#'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT COUNT(DISTINCT m.molecule_id) AS single_bond_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010' AND b.bond_type = '-'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'; 
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'; 
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules_with_double_bonded_oxygen FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON b.atom_id = a.atom_id OR b.atom_id2 = a.atom_id WHERE a.element = 'o' AND b.bond_type = '='; 
SELECT COUNT(DISTINCT T1.molecule_id) AS non_carcinogenic_molecules_with_triple_bonds FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-'; 
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR002'; 
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T3.bond_type = '=' AND T1.molecule_id = 'TR012'; 
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
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
;
;
;
;
;
;
;
;
;
SELECT DisplayName, MAX(Reputation) AS HighestReputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName; 
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2011; 
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1; 
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'; 
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'; 
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1; 
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (     SELECT MAX(FavoriteCount) FROM posts ); 
SELECT SUM(c.CommentCount) AS TotalComments FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.OwnerDisplayName = 'csgillespie'; 
SELECT MAX(p.AnswerCount) AS MostAnswers FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T2.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL; 
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL; 
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'; 
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'; 
SELECT p.Body FROM posts p JOIN tags t ON p.Tags LIKE CONCAT('%<', t.TagName, '>%') WHERE t.ExcerptPostId IS NOT NULL ORDER BY t.Count DESC LIMIT 1; 
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie'); 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND YEAR(badges.Date) = 2011; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT COUNT(b.Id) / COUNT(DISTINCT u.DisplayName) AS AverageBadges FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'; 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1; 
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'; 
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments); 
SELECT COUNT(*) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910; 
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND p.CommentCount = 1; 
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'; 
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041); 
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'; 
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347
SELECT COUNT(*) AS NumberOfVotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'; 
SELECT      COUNT(posts.Id) / COUNT(votes.Id) AS Ratio FROM      posts JOIN      votes ON posts.OwnerUserId = votes.PostId AND posts.OwnerUserId = 24; 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'; 
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'; 
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%thank you user93%' 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion'; 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10; 
SELECT u.DisplayName FROM users u JOIN postHistory ph ON u.Id = ph.UserId WHERE ph.PostId IN (SELECT p.Id FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data') AND ph.PostHistoryTypeId = 6
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.LastEditorDisplayName = 'Yevgeny'; 
SELECT c.Text FROM comments c JOIN postHistory ph ON c.PostId = ph.PostId JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.UserId IS NOT NULL; 
SELECT SUM(T2.BountyAmount) AS TotalBountyAmount FROM posts AS T1 JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'; 
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%' 
SELECT AVG(posts.ViewCount) AS AverageViewCount, posts.Title, comments.Text FROM posts JOIN comments ON posts.Id = comments.PostId WHERE posts.Tags LIKE '%<humor>%' GROUP BY posts.Title, comments.Text; 
SELECT COUNT(*) FROM comments WHERE UserId = 13; 
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1; 
SELECT UserId FROM posts ORDER BY Views ASC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011; 
SELECT COUNT(UserId) AS NumberOfUsersWithMoreThanFiveBadges FROM badges GROUP BY UserId HAVING COUNT(Name) > 5; 
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter'); 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1; 
SELECT UserId FROM posts WHERE Views >= 1000 GROUP BY UserId HAVING COUNT(PostId) = 1
SELECT u.DisplayName, b.Name AS BadgeName FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id IN (     SELECT c.UserId     FROM comments c     GROUP BY c.UserId     ORDER BY COUNT(c.Id) DESC     LIMIT 1 ); 
SELECT COUNT(b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'India' AND b.Name = 'Teacher'; 
SELECT      ((SUM(CASE WHEN YEAR(Date) = 2010 THEN 1 ELSE 0 END) / COUNT(Name) -        SUM(CASE WHEN YEAR(Date) = 2011 THEN 1 ELSE 0 END) / COUNT(Name)) * 100) AS PercentageDifference FROM      badges WHERE      Name = 'Student'; 
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 AND PostHistoryTypeId IN (1, 2); 
SELECT p.Id, p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; 
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;
SELECT PostId, UserId FROM posts WHERE Score > 60; 
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011; 
SELECT AVG(T1.UpVotes) AS AverageUpVotes, AVG(T1.Age) AS AverageAge FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId GROUP BY T1.Id HAVING COUNT(T2.PostId) > 10; 
SELECT COUNT(UserId) AS NumberOfUsersWithAnnouncerBadge FROM badges WHERE Name = 'Announcer'; 
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'; 
SELECT COUNT(*) FROM comments WHERE Score > 60; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users); 
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Pierre')
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'; 
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(Id) AS Percentage FROM badges; 
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE NULL END) * 100.0 / COUNT(u.Id)) AS PercentageOfTeenagers FROM      users u JOIN      badges b ON u.Id = b.UserId WHERE      b.Name = 'Organizer'; 
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0'; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'; 
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'; 
SELECT COUNT(b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65; 
SELECT SUM(views) AS TotalViews FROM users JOIN badges ON users.id = badges.userid WHERE badges.date = '2010-07-19 19:39:08.0'; 
SELECT Name FROM badges WHERE UserId IN (SELECT UserId FROM users ORDER BY Reputation ASC LIMIT 1)
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'; 
SELECT COUNT(badgeId) AS NumberOfEldersWithSupporterBadge FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65; 
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'; 
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes
SELECT t.TagName FROM tags t JOIN posts p ON t.Id IN (SELECT TagId FROM posts WHERE Id = (SELECT Id FROM posts WHERE OwnerDisplayName = 'John Salvatier')) WHERE t.Count > 0; 
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Daniel Vassallo'; 
SELECT COUNT(*) FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'; 
SELECT PostId FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1; 
SELECT p.Id, p.Title, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1; 
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.OwnerDisplayName = 'Matt Parker' AND v.VoteTypeId > 4; 
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score < 60 AND posts.OwnerDisplayName = 'Neil McGuigan'; 
SELECT DISTINCT t2.Tags FROM users AS t1 JOIN posts AS t2 ON t1.Id = t2.OwnerUserId WHERE t1.DisplayName = 'Mark Meckes' AND t2.CommentCount = 0; 
SELECT DisplayName FROM badges WHERE Name = 'Organizer'; 
SELECT CAST(SUM(CASE WHEN T1.Tags LIKE '%r%' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM posts AS T1 JOIN tags AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T3.DisplayName = 'Community'
SELECT (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id; 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014; 
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT DisplayName ,  Age FROM users WHERE Views = ( SELECT MAX(Views) FROM users )
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'; 
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60; 
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE YEAR(b.Date) = 2011 AND u.Location LIKE '%North Pole%'; 
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150; 
SELECT ph.PostId, COUNT(ph.Id) AS HistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY ph.PostId; 
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'; 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = (     SELECT Id     FROM posts     WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' ); 
SELECT p.Id, b.Name FROM users u JOIN badges b ON u.Id = b.UserId JOIN postHistory ph ON u.Id = ph.UserId WHERE u.UserDisplayName = 'Samuel' AND YEAR(b.Date) = 2013 AND YEAR(ph.CreationDate) = 2013; 
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1; 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Tags LIKE '%hypothesis-testing%' WHERE p.ExcerptPostId IS NOT NULL; 
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'; 
SELECT T2.OwnerDisplayName FROM posts AS T1 JOIN posts AS T2 ON T1.ParentId = T2.Id ORDER BY T1.Score DESC LIMIT 1
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users); 
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50; 
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users); 
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%' 
SELECT AVG(CASE WHEN YEAR(CreationDate) = 2010 AND AnswerCount <= 2 THEN 1 ELSE 0 END) AS AvgMonthlyLinks FROM postLinks; 
SELECT PostId FROM votes WHERE UserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1; 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1; 
SELECT MIN(v.CreationDate) AS FirstVoteDate FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl'; 
SELECT MIN(CreationDate) FROM users WHERE Age = (SELECT MIN(Age) FROM users)
SELECT DisplayName FROM badges WHERE Name = 'Autobiographer' ORDER BY Date ASC LIMIT 1
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
SELECT AVG(PostId) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.Age = (SELECT MAX(Age) FROM users); 
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000; 
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT COUNT(*) AS NumberOfPosts FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Jay Stevens' AND YEAR(posts.CreationDate) = 2010; 
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1; 
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Stephen Turner'; 
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011; 
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2010 ORDER BY FavoriteCount DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN YEAR(u.CreationDate) = 2011 AND u.Reputation > 1000 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(Id) AS percentage FROM users 
SELECT SUM(ViewCount) AS TotalViews, u.DisplayName AS LastPoster FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Text LIKE '%Computer Game Datasets%' ORDER BY p.LasActivityDate DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts); 
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1) 
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0; 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1; 
SELECT Name FROM badges WHERE UserId = (     SELECT Id FROM users WHERE DisplayName = 'Emmett' ) ORDER BY Date DESC LIMIT 1; 
SELECT COUNT(*) AS NumberOfAdultUsersWithOver5000Upvotes FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT DATEDIFF(b.Date, u.CreationDate) AS TimeToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'; 
SELECT COUNT(DISTINCT p.Id) AS NumberOfPosts,        COUNT(DISTINCT c.Id) AS NumberOfComments FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (     SELECT MAX(CreationDate)     FROM users ); 
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10; 
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'; 
SELECT COUNT(DISTINCT p.Id) AS NumberOfPosts FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE t.TagName = 'careers'; 
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'; 
SELECT COUNT(comments.Id) AS CommentCount, SUM(CASE WHEN posts.PostTypeId = 2 THEN 1 ELSE 0 END) AS AnswerCount FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.Title = 'Clustering 1D data'; 
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'; 
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30; 
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users); 
SELECT COUNT(*) FROM posts WHERE Score < 20; 
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'; 
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1; 
SELECT u.CreationDate, TIMESTAMPDIFF(YEAR, u.CreationDate, NOW()) AS Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%http://%'; 
SELECT COUNT(DISTINCT c.PostId) AS PostsWithLowViewCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5; 
SELECT COUNT(*) FROM posts JOIN comments ON posts.Id = comments.PostId WHERE posts.CommentCount = 1 AND comments.Score = 0; 
SELECT COUNT(DISTINCT c.UserId) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40; 
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.'; 
SELECT Text FROM comments WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky')
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0; 
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10; 
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = '3-D Man'; 
SELECT COUNT(*)  FROM superhero AS s  JOIN hero_power AS hp ON s.id = hp.hero_id  JOIN superpower AS sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200; 
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15; 
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue'); 
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id WHERE s.superhero_name = 'Apocalypse'; 
SELECT COUNT(DISTINCT s.id) AS count_superheroes FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility'; 
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND c.colour = 'Blue' JOIN colour h ON s.hair_colour_id = h.id AND h.colour = 'Blond'; 
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'; 
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC; 
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'; 
SELECT c.colour, COUNT(s.id) AS count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;
SELECT AVG(height_cm) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'); 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'; 
SELECT p.publisher_name FROM publisher AS p JOIN superhero AS s ON p.id = s.publisher_id JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'; 
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II'; 
SELECT COUNT(*) FROM superhero AS s JOIN colour AS c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond'; 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1; 
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'; 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50; 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch'; 
SELECT COUNT(*)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND a.attribute_name = 'Strength' AND ha.attribute_value = 100; 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.superhero_name ORDER BY COUNT(hp.power_id) DESC LIMIT 1; 
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire'); 
SELECT      (CAST(COUNT(CASE WHEN T2.alignment = 'Bad' THEN 1 ELSE NULL END) AS FLOAT) * 100 / COUNT(T1.id)) AS percentage,     SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' AND T2.alignment = 'Bad' THEN 1 ELSE 0 END) AS marvel_bad_count FROM      superhero AS T1 JOIN      alignment AS T2 ON T1.alignment_id = T2.id; 
SELECT (SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS Difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'; 
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute; 
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL; 
SELECT c.colour FROM colour c JOIN superhero s ON s.eye_colour_id = c.id WHERE s.id = 75; 
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.superhero_name = 'Deathlok'; 
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female'); 
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id JOIN gender AS g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5; 
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien'); 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.height_cm BETWEEN 170 AND 190 AND T2.colour = 'No Colour'
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id WHERE hp.hero_id = 56; 
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5; 
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad'); 
SELECT T.race FROM ( SELECT T1.race, COUNT(*) AS num FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 169 GROUP BY T1.race ) t ORDER BY t.num DESC LIMIT 1
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T1.height_cm = 185 AND T1.race_id = ( SELECT id FROM race WHERE race = 'Human' )
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1
SELECT      (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) / COUNT(s.id)) * 100 AS percentage FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      s.height_cm BETWEEN 150 AND 180; 
SELECT superhero_name FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero); 
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Abomination'; 
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id WHERE hp.hero_id = 1; 
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth'; 
SELECT T1.full_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT AVG(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS avg_no_skin_colour FROM superhero; 
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics'; 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT c.colour FROM colour AS c JOIN superhero AS s ON c.id = s.eye_colour_id WHERE s.full_name = 'Abraham Sapien'; 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Flight'; 
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'; 
SELECT s.superhero_name, p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id
SELECT T.race FROM ( SELECT T2.race, COUNT(*) AS num FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb' GROUP BY T2.race ) AS T ORDER BY T.num DESC LIMIT 1
SELECT      (COUNT(CASE WHEN T1.skin_colour_id = T3.id THEN 1 ELSE NULL END) / COUNT(T1.gender_id)) * 100 AS percentage FROM      superhero AS T1 JOIN      gender AS T2 ON T1.gender_id = T2.id JOIN      colour AS T3 ON T1.skin_colour_id = T3.id WHERE      T2.gender = 'Female'; 
SELECT s.superhero_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.full_name = 'Charles Chandler'; 
SELECT g.gender FROM gender g JOIN superhero s ON g.id = s.gender_id WHERE s.superhero_name = 'Agent 13'; 
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation'
SELECT COUNT(power_id) AS number_of_powers FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Amazo'; 
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon'; 
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Black' AND T1.hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Black' )
SELECT T1.eye_colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*)  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_name = 'Strength' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Strength'); 
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks'; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference
SELECT AVG(height_cm) AS average_height FROM superhero; 
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination'; 
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN race ON superhero.race_id = race.id  WHERE race.id = 21 AND gender.id = 1; 
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3; 
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man'; 
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' AND T1.hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy'); 
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL OR publisher_id = 1
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(s.superhero_name) AS percentage_blue_eyes FROM superhero s JOIN colour c ON s.eye_colour_id = c.id; 
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL; 
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr'; 
SELECT T.race FROM ( SELECT T2.race, T1.weight_kg, T1.height_cm FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188 ) AS T
SELECT T.publisher_name FROM ( SELECT T1.publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.id = 38 ) t
SELECT T3.race FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN race AS T3 ON T3.id = T1.hero_id WHERE T1.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV'; 
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5
SELECT AVG(hero_attribute.attribute_value) AS average_attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'; 
SELECT c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100; 
SELECT COUNT(*) FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN alignment AS a ON s.alignment_id = a.id WHERE g.gender = 'Female' AND a.id = 1; 
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'blue' AND g.gender = 'Male'; 
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Bad'; 
SELECT (SUM(CASE WHEN T3.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T3.id = 1 THEN 1 ELSE 0 END)) AS difference FROM superhero AS T1 LEFT JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL; 
SELECT T1.attribute_value FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength' AND T3.superhero_name = 'Hulk'
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax'; 
SELECT COUNT(*) FROM superhero AS s JOIN colour AS c ON s.skin_colour_id = c.id JOIN alignment AS a ON s.alignment_id = a.id WHERE c.colour = 'Green' AND a.alignment = 'Bad';
SELECT COUNT(*) FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN publisher AS p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name ASC; 
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'; 
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1; 
SELECT AVG(height_cm) AS avg_height FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE race != 'Human' AND publisher_name = 'Dark Horse Comics'; 
SELECT COUNT(*) AS fastest_superheroes_count FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = 100; 
SELECT (SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id
SELECT a.attribute_name FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1; 
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination'; 
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'George Lucas'; 
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM alignment AS T1 JOIN superhero AS T2 ON T1.id = T2.alignment_id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'; 
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1; 
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'; 
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Brown')
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy'; 
SELECT T1.weight_kg, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT superhero.id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence'
SELECT c.colour FROM colour AS c JOIN superhero AS s ON c.id = s.eye_colour_id WHERE s.superhero_name = 'Blackwulf'; 
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS s ON hp.hero_id = s.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero WHERE height_cm IS NOT NULL AND height_cm != 0); 
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 ORDER BY T2.q1 DESC LIMIT 5
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 AND T2.q2 IS NOT NULL ORDER BY T2.q2 ASC LIMIT 1; 
SELECT DISTINCT YEAR FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE LOCATION = 'Shanghai'); 
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany'
SELECT DISTINCT c.position FROM circuits c JOIN constructorStandings cs ON c.circuitid = cs.constructorid JOIN constructors ct ON cs.constructorid = ct.constructorid WHERE ct.name = 'Renault'; 
SELECT COUNT(*) FROM races WHERE YEAR = 2010 AND name LIKE '%Grand Prix%' AND country NOT IN ('Asia', 'Europe')
SELECT DISTINCT r.name FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE c.country = 'Spain'; 
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.name = 'Australian Grand Prix'; 
SELECT url FROM circuits WHERE name = 'Sepang International Circuit'
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'; 
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'
SELECT T4.country FROM constructorStandings AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T4 ON T2.circuitid = T4.circuitid WHERE T1.constructorid = 1 AND T2.raceid = 24 AND T1.points = 1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40'; 
SELECT driverId FROM qualifying WHERE raceId = 903 AND q3 LIKE '0:01:%'
SELECT COUNT(*) FROM results AS r JOIN races AS rs ON r.raceId = rs.raceId WHERE rs.name = 'Bahrain Grand Prix' AND rs.year = 2007 AND r.time IS NULL; 
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901; 
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND TIME IS NOT NULL; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1
SELECT D.url FROM drivers AS D JOIN laptimes AS LT ON D.driverid = LT.driverid WHERE LT.laptime LIKE '1:27%' AND LT.raceid = 161; 
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed = ( SELECT MAX(fastestlapspeed) FROM results WHERE raceid = 933 ) 
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitid = races.circuitid WHERE races.name = 'Malaysian Grand Prix'; 
SELECT T2.url FROM constructorResults AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'Di Grassi') AND raceId = 345; 
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 347 AND T2.q2 = '0:01:15'; 
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 45 AND T2.q3 LIKE '1:33%' 
SELECT T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.surname = 'McLaren' AND T2.raceid = 743; 
SELECT D.forename, D.surname FROM drivers AS D JOIN results AS R ON D.driverid = R.driverid JOIN races AS Ra ON R.raceid = Ra.raceid WHERE Ra.name = 'San Marino Grand Prix' AND Ra.year = 2006 AND R.position = 2; 
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901; 
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NULL; 
SELECT MIN(dob), T1.driverid FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE raceid = 872 AND TIME IS NOT NULL; 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 348 ORDER BY r.fastestLapTime ASC LIMIT 1; 
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT ((SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) - (SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 854)) / (SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) * 100 AS percentage; 
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.date = '1983-07-16'; 
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) AS total_races, name FROM races WHERE YEAR = 2005 ORDER BY name DESC; 
SELECT name FROM races WHERE YEAR(date) = (SELECT MIN(YEAR(date)) FROM races) AND MONTH(date) = (SELECT MIN(MONTH(date)) FROM races); 
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999); 
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT DISTINCT r.name FROM races r WHERE r.year = 2017 AND r.circuitId NOT IN (     SELECT c.circuitId     FROM races c     WHERE c.year = 2000 ); 
SELECT c.country, c.name, c.location FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE r.year = ( SELECT MIN(year) FROM races ) AND c.country LIKE '%Europe%' 
SELECT MAX(T1.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Brands Hatch' AND T1.name = 'British Grand Prix'
SELECT COUNT(*) FROM races AS r JOIN circuits AS c ON r.circuitid = c.circuitid WHERE c.name = 'Silverstone' AND r.country = 'United Kingdom'; 
SELECT D.forename, D.surname FROM drivers AS D JOIN results AS R ON D.driverId = R.driverId JOIN races AS Ra ON R.raceId = Ra.raceId WHERE Ra.name = 'Singapore Grand Prix' AND Ra.year = 2010 ORDER BY R.position;
SELECT d.forename, d.surname, MAX(rs.points) AS total_points FROM drivers d JOIN results rs ON d.driverid = rs.driverid GROUP BY d.driverid ORDER BY total_points DESC LIMIT 1; 
SELECT d.forename, d.surname, r.points FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 2017 AND ra.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3
SELECT drivers.forename, drivers.surname, races.name, MIN(results.fastestLapTime) AS best_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId GROUP BY drivers.driverId, races.raceId ORDER BY best_lap_time ASC LIMIT 1; 
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId JOIN lapTimes ON results.resultId = lapTimes.resultId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.year = 2009 AND races.name = 'Malaysian Grand Prix'; 
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year >= 2010; 
SELECT d.forename, d.surname, d.nationality, MAX(s.points) AS max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN status s ON ds.statusId = s.statusId WHERE s.status = 'Finished' GROUP BY d.driverId ORDER BY COUNT(ds.wins) DESC, max_points DESC LIMIT 1; 
SELECT CONCAT(forename, ' ', surname) AS Name, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS Age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE YEAR(T2.date) BETWEEN 1990 AND 2000 GROUP BY T1.name HAVING COUNT(*) >= 4
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006; 
SELECT T1.name, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE MONTH(T1.date) = 9 AND YEAR(T1.date) = 2005
SELECT r.name FROM drivers d JOIN results res ON d.driverid = res.driverid JOIN races r ON res.raceid = r.raceid WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20; 
SELECT COUNT(*) FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND r.position = 1; 
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestLapspeed DESC LIMIT 1; 
SELECT AVG(T1.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.surname = 'Irvine' AND YEAR(T1.raceId) = 2000; 
SELECT MIN(races.year), SUM(results.points) FROM drivers JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT r.name, c.country, r.date FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.year = 2017 ORDER BY r.date; 
SELECT r.name AS RaceName, r.year AS Year, c.location AS Location, MAX(r.laps) AS MostLaps FROM races r JOIN circuits c ON r.circuitid = c.circuitid GROUP BY r.raceid ORDER BY MostLaps DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'; 
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'; 
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1; 
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'; 
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT COUNT(*) FROM drivers WHERE code IS NULL; 
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN results AS T3 ON T2.raceid = T3.raceid JOIN drivers AS T4 ON T3.driverid = T4.driverid ORDER BY T4.dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'; 
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'; 
SELECT name FROM circuits WHERE circuitid = (SELECT circuitid FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix')
SELECT DISTINCT YEAR FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit'); 
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone Circuit'
SELECT T2.date, T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Abu Dhabi Grand Prix' AND T2.year = 2010; 
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy'); 
SELECT DISTINCT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya'; 
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009; 
SELECT MIN(T2.fastestLapTime) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId ORDER BY r.fastestLapSpeed DESC LIMIT 1; 
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2007 AND ra.name = 'Canadian Grand Prix' AND r.rank = 1; 
SELECT DISTINCT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1; 
SELECT MAX(T1.fastestLapSpeed) AS Fastest_Lap_Speed FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'; 
SELECT DISTINCT r.year FROM races r JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'; 
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix' ORDER BY r.position DESC LIMIT 1; 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE r.grid = 4 AND r.raceid IN (SELECT raceid FROM races WHERE year = 1989 AND name = 'Australian Grand Prix'); 
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND TIME IS NOT NULL; 
SELECT T2.fastestLapTime FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.surname = 'Hamilton' AND T3.name = 'Australian Grand Prix' AND T3.year = 2008 ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Austrian Grand Prix' AND T1.rank = 2
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.position = 1; 
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE d.nationality = 'British' AND ra.name = 'Australian Grand Prix' AND ra.year = 2008; 
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE YEAR = 2008 AND name = 'Chinese Grand Prix') AND TIME IS NOT NULL
SELECT SUM(points) AS total_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT AVG(UNIX_TIMESTAMP(SUBSTRING_INDEX(fastestLapTime, '.', -1)) - UNIX_TIMESTAMP(SUBSTRING_INDEX(fastestLapTime, ':', -1))) / 1000 AS avgFastestLapTimeInSeconds FROM results INNER JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'; 
SELECT ((CAST(REPLACE(SUBSTRING_INDEX((SELECT TIME FROM results WHERE raceid = 837 AND driverid = 1 ORDER BY TIME ASC LIMIT 1), '.', ''), ':', '') AS DECIMAL(10, 3)) - CAST(REPLACE(SUBSTRING_INDEX((SELECT TIME FROM results WHERE raceid = 837 AND driverid = 1 ORDER BY TIME DESC LIMIT 1), '.', ''), ':', '') AS DECIMAL(10, 3))) / CAST(REPLACE(SUBSTRING_INDEX((SELECT TIME FROM results WHERE raceid = 837 AND driverid = 1 ORDER BY TIME DESC LIMIT 1), '.', ''), ':', '') AS DECIMAL(10, 3)) * 100 AS percentage_faster; 
SELECT COUNT(*) FROM circuits WHERE location = 'Melbourne' AND country = 'Australia'; 
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980;
SELECT MAX(points) FROM constructorStandings WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'British')
SELECT c.constructorRef, cs.points FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId ORDER BY cs.points DESC LIMIT 1; 
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T2.raceid = 291 AND T2.points = 0
SELECT COUNT(*) FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  WHERE constructors.nationality = 'Japanese' AND constructorStandings.points = 0; 
SELECT T1.constructorRef FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1
SELECT COUNT(*) FROM constructors AS c JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId JOIN results AS r ON cs.raceId = r.raceId WHERE c.nationality = 'French' AND r.laps > 50; 
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'Japanese' AND T1.year BETWEEN 2007 AND 2009; 
SELECT YEAR, AVG(UNIX_TIMESTAMP(SUBSTRING_INDEX(time, '.', 1)) - UNIX_TIMESTAMP('00:00:00')) AS avg_time_seconds FROM results WHERE time IS NOT NULL AND YEAR < 1975 GROUP BY YEAR
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) > 1975 AND r.rank = 2; 
SELECT COUNT(*) FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL; 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverid = r.driverid ORDER BY r.fastestlaptime ASC LIMIT 1; 
SELECT fastestLap FROM results WHERE year = 2009 AND time LIKE '%:%' ORDER BY fastestLapTime ASC LIMIT 1; 
SELECT AVG(T1.fastestLapSpeed) AS avgFastestLapSpeed FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T1.year = 2009; 
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN YEAR(dob) < 1985 AND laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM drivers INNER JOIN results ON drivers.driverId = results.driverId WHERE YEAR(results.date) BETWEEN 2000 AND 2005; 
SELECT COUNT(DISTINCT d.driverId) AS french_drivers_less_than_2_minutes FROM drivers d JOIN laptimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND TIME_TO_SEC(lt.time) < 120; 
SELECT code FROM drivers WHERE nationality = 'American'
SELECT raceId FROM races WHERE YEAR = 2009
SELECT COUNT(*) FROM results WHERE raceId = 18; 
SELECT number FROM drivers WHERE nationality = 'Dutch' ORDER BY dob DESC LIMIT 3;
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'; 
SELECT COUNT(*) FROM drivers WHERE YEAR(dob) = 1980 AND nationality = 'British';
SELECT d.driverId, d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE YEAR(d.dob) BETWEEN 1980 AND 1990 AND d.nationality = 'German' GROUP BY d.driverId, d.forename, d.surname ORDER BY earliest_lap_time ASC LIMIT 3; 
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1; 
SELECT D.driverId, D.code FROM drivers D JOIN results R ON D.driverId = R.driverId WHERE EXTRACT(YEAR FROM D.dob) = 1971 AND R.fastestLapTime IS NOT NULL; 
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverid ORDER BY latest_lap_time DESC LIMIT 10; 
SELECT DISTINCT YEAR FROM races WHERE raceId IN (SELECT raceId FROM results WHERE fastestLapTime IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1); 
SELECT MIN(T1.time) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY TIME ASC LIMIT 5; 
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND time IS NOT NULL; 
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria'; 
SELECT raceId FROM results WHERE TIME IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1 
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId AND q.raceId = 23 WHERE q.q2 IS NOT NULL; 
SELECT MIN(races.date), races.name, races.time FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId JOIN races ON qualifying.raceId = races.raceId ORDER BY drivers.dob DESC LIMIT 1; 
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN status s ON r.statusid = s.statusid WHERE d.nationality = 'American' AND s.status = 'Puncture'; 
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1; 
SELECT T2.url FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid ORDER BY T1.wins DESC LIMIT 1 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.name = 'French Grand Prix' ORDER BY r.time DESC LIMIT 1; 
SELECT MIN(T1.time), T1.milliseconds FROM laptimes AS T1 WHERE T1.lap = 1; 
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2006 AND T2.name = 'United States Grand Prix' AND T1.rank <= 10; 
SELECT d.forename, d.surname FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND YEAR(d.dob) BETWEEN 1980 AND 1985 GROUP BY d.driverId ORDER BY AVG(ps.duration) ASC LIMIT 3; 
SELECT d.forename, d.surname, r.time FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 2008 AND ra.name = 'Canadian Grand Prix' AND r.position = 1; 
SELECT c.constructorRef, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN constructorResults cr ON cs.constructorId = cr.constructorId AND cs.raceId = cr.raceId JOIN races r ON cr.raceId = r.raceId WHERE r.year = 2009 AND r.name = 'Singapore Grand Prix' AND cs.position = 1; 
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991
SELECT forename || ' ' || surname AS fullName, url, dob FROM drivers WHERE nationality = 'German' AND EXTRACT(YEAR FROM dob) BETWEEN 1971 AND 1985 ORDER BY dob DESC; 
SELECT LOCATION, COUNTRY, LAT, LNG FROM circuits WHERE NAME = 'Hungaroring'
SELECT c.points, c.name, c.nationality FROM (     SELECT cs.constructorId, SUM(cs.points) AS points     FROM constructorStandings cs     JOIN races r ON cs.raceId = r.raceId     WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010     GROUP BY cs.constructorId ) c JOIN constructors con ON c.constructorId = con.constructorId ORDER BY c.points DESC LIMIT 1; 
SELECT AVG(points) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix'; 
SELECT AVG(COUNT(*)) FROM races WHERE YEAR BETWEEN 2000 AND 2010 GROUP BY YEAR
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(wins) AS victory_count FROM driverStandings WHERE points = 91; 
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT CONCAT(location, ', ', country) AS full_location FROM circuits WHERE circuitId = (     SELECT circuitId     FROM races     ORDER BY date DESC     LIMIT 1 ); 
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN circuits c ON q.circuitId = c.circuitId WHERE q.q3 IS NOT NULL AND q.position = 1 AND c.name = 'Marina Bay Street Circuit' AND YEAR(q.date) = 2008; 
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid ORDER BY T1.dob DESC LIMIT 1
SELECT COUNT(*) AS accident_count FROM results JOIN status ON results.statusid = status.statusid JOIN races ON results.raceid = races.raceid WHERE status.status = 'Accident' AND races.name = 'Canadian Grand Prix'; 
SELECT COUNT(wins), forename, surname FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers); 
SELECT MAX(duration) FROM pitStops
SELECT MIN(time) AS fastest_lap_time FROM lapTimes; 
SELECT MAX(T1.duration) AS longest_pit_stop_duration FROM pitStops AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'; 
SELECT p.lap FROM pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN races r ON p.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Australian Grand Prix' AND YEAR(r.date) = 2011; 
SELECT T1.driverid, SUM(T1.duration) FROM pitstops AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2011 AND T2.name = 'Australian Grand Prix' GROUP BY T1.driverid
SELECT MIN(T1.time) AS lap_record FROM laptimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlaptime IS NOT NULL ORDER BY TIME(T2.fastestlapspeed) ASC LIMIT 1
SELECT T1.position FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.fastestlaptime ASC LIMIT 1
SELECT MIN(T1.time) AS lap_record FROM laptimes AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix'; 
SELECT c.name AS circuit_name, MIN(r.fastestLapTime) AS fastest_lap_time FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN results res ON r.raceId = res.raceId WHERE c.country = 'Italy' GROUP BY c.name; 
SELECT T1.name FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T2.time ASC LIMIT 1
SELECT p.duration FROM pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN laps l ON d.driverId = l.driverId AND p.raceId = l.raceId JOIN races r ON p.raceId = r.raceId WHERE r.name = 'Austrian Grand Prix' AND l.time = (     SELECT MIN(time)     FROM laps     WHERE driverId = d.driverId AND raceId = r.raceId ); 
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN drivers AS T2 ON T1.circuitid = T2.circuitid WHERE T2.fastestlaptime = '1:29.488'
SELECT AVG(pitStops.milliseconds) AS average_pit_stop_time_ms FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT AVG(T1.milliseconds) AS avg_lap_time_ms FROM lapTimes AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Italy'; 
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
;
;
;
SELECT SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Deviation FROM Patient WHERE SEX = 'M'
SELECT CAST(SUM(CASE WHEN YEAR(Birthday) > '1930' AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE SEX = 'F'; 
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'; 
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'
SELECT E.Diagnosis, L.Date FROM Examination AS E JOIN Laboratory AS L ON E.ID = L.ID WHERE E.ID = '30609'; 
SELECT P.SEX, P.Birthday, E.Examination_Date, E.Symptoms FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.ID = '163109'; 
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.LDH > 500; 
SELECT ID ,  YEAR(CURRENT_TIMESTAMP) - YEAR(Birthday) AS Age FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE RVVT = '+')
SELECT P.ID, P.SEX, E.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2; 
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE EXTRACT(YEAR FROM P.Birthday) = 1937 AND L.`T-CHO` >= 250; 
SELECT P.ID, P.SEX, E.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE L.ALB < 3.5 AND E.Thrombosis = 0; 
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP IS NOT NULL AND (T2.TP < 6.0 OR T2.TP > 8.5)) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 LEFT JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP IS NOT NULL; 
SELECT AVG(aCL_IgG) AS Average_aCL_IgG FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Admission = '+' AND EXTRACT(YEAR FROM AGE(NOW(), Birthday)) >= 50; 
SELECT COUNT(*) FROM Patient WHERE YEAR(Description) = '1997' AND SEX = 'F' AND Admission = '-'; 
SELECT MIN(DATEDIFF(Year, Birthday, `First Date`)) AS YoungestAge FROM Patient WHERE `First Date` IS NOT NULL AND Birthday IS NOT NULL; 
SELECT COUNT(*) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SEX = 'F' AND E.Thrombosis = 1 AND YEAR(E.Examination_Date) = 1997; 
SELECT MAX(2023 - EXTRACT(YEAR FROM Birthday)) - MIN(2023 - EXTRACT(YEAR FROM Birthday)) AS AgeGap FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE TG IS NOT NULL AND TG >= 200; 
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms IS NOT NULL ORDER BY T1.Birthday DESC LIMIT 1; 
SELECT AVG(COUNT(Lab.ID)) AS Average_Male_Patients_Per_Month FROM Patient JOIN Lab ON Patient.ID = Lab.ID WHERE Patient.SEX = 'M' AND Lab.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY MONTH(Lab.Date); 
SELECT      MIN(L.Date) AS LabDate,     TIMESTAMPDIFF(YEAR, P.Birthday, P.`First Date`) AS AgeAtAdmission FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.Diagnosis LIKE '%SJS%' ORDER BY      P.Birthday ASC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN SEX = 'M' AND UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Laboratory; 
SELECT COUNT(DISTINCT `Patient`.`ID`) FROM `Patient` LEFT JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE DATEDIFF(YEAR, `Patient`.`First Date`, `Examination`.`Examination Date`) >= 1; 
SELECT COUNT(DISTINCT E.ID) AS UnderagePatientCount FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE YEAR(P.Birthday) < 18 AND YEAR(E.`Examination Date`) BETWEEN '1990' AND '1993'; 
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.T_BIL IS NOT NULL AND Laboratory.T_BIL >= 2.0; 
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT AVG(1999 - EXTRACT(YEAR FROM Birthday)) AS AverageAge FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30'; 
SELECT DATEDIFF(YEAR, Patient.Birthday, Examination.Examination_Date) AS Age, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID ORDER BY Examination.HGB DESC LIMIT 1; 
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'; 
SELECT CASE WHEN T2.T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Total_Cholesterol_Status FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = '2927464' AND T2.Date = '1995-09-04'; 
SELECT SEX FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'AORTITIS' ORDER BY Examination_Date ASC LIMIT 1)
SELECT aCL_IgM FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE Diagnosis = 'SLE' AND Description = '1994-02-19') AND Examination_Date = '1993-11-12'; 
SELECT SEX FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE Date = '1992-06-12' AND GPT = '9')
SELECT DATEDIFF(YEAR, Birthday, '1991-10-21') AS Age FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE UA = '8.4' AND Date = '1991-10-21'; 
SELECT COUNT(L.ID) AS Total_Laboratory_Tests FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.First_Date = '1991-06-13' AND P.Diagnosis = 'SJS' AND YEAR(L.Date) = 1995; 
SELECT p.Diagnosis AS OriginalDiagnose FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Examination_Date = '1997-01-27' AND e.Diagnosis LIKE '%SLE%' ORDER BY p.First_Date ASC LIMIT 1; 
SELECT Symptoms FROM Examination WHERE Examination_Date = '1993-09-27' AND ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-03-01'); 
SELECT      ((SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) -       SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-12-%' THEN T2.`T-CHO` ELSE 0 END)) /       SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END)) * 100 AS DecreaseRate FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description BETWEEN '1997-01-01' AND '1997-12-31' AND e.Diagnosis LIKE '%Behcet%' 
SELECT E.ID FROM Examination AS E JOIN Laboratory AS L ON E.ID = L.ID WHERE E.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND L.GPT > 30 AND L.ALB < 4; 
SELECT ID FROM Patient WHERE YEAR(Birthday) = 1964 AND SEX = 'F' AND Admission = '+' ORDER BY ID; 
SELECT COUNT(DISTINCT ID) AS NumberOfPatients FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination); 
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE U-PRO > 0 AND U-PRO < 30; 
SELECT CAST(SUM(CASE WHEN DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'M' AND YEAR(`First Date`) = '1981'; 
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0; 
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID NOT IN (SELECT ID FROM Examination WHERE ANA_PATTERN = 'P'); 
SELECT DISTINCT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis LIKE '%PSS%' AND l.CRP = '2+' AND l.CRE = 1 AND l.LDH = 123; 
SELECT AVG(T2.ALB) AS AverageAlbuminLevel FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE'; 
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT Description, Diagnosis FROM Patient WHERE ID = '48473'; 
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis LIKE '%APS%'; 
SELECT COUNT(*) FROM Laboratory WHERE YEAR(Date) = '1997' AND (TP IS NULL OR TP <= 6 OR TP >= 8.5); 
SELECT CAST(SUM(CASE WHEN DIAGNOSIS LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN DIAGNOSIS LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Examination WHERE Symptoms LIKE '%thrombocytopenia%' 
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE EXTRACT(YEAR FROM Birthday) = 1980 AND Diagnosis LIKE '%RA%'
SELECT COUNT(DISTINCT E.ID) AS Male_Patient_Count FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'M' AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND E.Diagnosis LIKE '%Behcet%' AND P.Admission = '-'; 
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND WBC < 3.5; 
SELECT DATEDIFF(`Examination Date`, `First Date`) AS DaysUntilEvaluation FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 821298; 
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 'Yes' ELSE 'No' END AS Normal_Uric_Acid FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.ID = 57266
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60; 
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT IS NOT NULL AND L.GOT < 60 AND EXTRACT(YEAR FROM L.Date) = 1994; 
SELECT DISTINCT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60
SELECT P.Description, L.GPT, P.Birthday, E.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE L.GPT > 60 AND P.Description IS NOT NULL AND E.Diagnosis IS NOT NULL ORDER BY P.Birthday ASC; 
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500; 
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;
SELECT DISTINCT T1.ID, T1.Admission FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300
SELECT P.ID, L.ALP FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Birthday = '1982-04-01' AND L.ALPH IS NOT NULL AND L.ALPH < 300; 
SELECT ID, SEX, Birthday FROM Patient WHERE TP < 6.0; 
SELECT ID, TP - 8.5 AS Deviation FROM Patient WHERE SEX = 'F' AND TP > 8.5; 
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC
SELECT p.ID, p.SEX, p.Birthday, l.ALB,        CASE WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Outside Normal Range' END AS Albumin_Status FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982; 
SELECT CAST(SUM(CASE WHEN UA > 8.0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F'; 
SELECT AVG(T1.UA) AS Average_UA FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE (T2.SEX = 'M' AND T1.UA < 8.0) OR (T2.SEX = 'F' AND T1.UA < 6.5); 
SELECT ID, SEX, Birthday FROM Patient WHERE UN = 29; 
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis LIKE '%RA%' AND L.UN < 30; 
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5
SELECT CASE WHEN SUM(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS Result; 
SELECT P.ID, P.SEX, P.Birthday, MAX(L.T_BIL) AS Max_T_BIL FROM Patient P JOIN Laboratory L ON P.ID = L.ID GROUP BY P.ID, P.SEX, P.Birthday; 
SELECT GROUP_CONCAT(DISTINCT ID), SEX FROM Laboratory WHERE T_BIL >= 2.0 GROUP BY SEX; 
SELECT P.ID, E.T_cho FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.T_cho IS NOT NULL ORDER BY P.Birthday ASC, E.T_cho DESC LIMIT 1; 
SELECT AVG(DATE_PART('year', AGE(NOW(), Birthday))) AS Average_Age FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Laboratory WHERE `T-CHO` >= 250); 
SELECT P.ID, P.Description, L.TG FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TG > 300 AND L.TG IS NOT NULL
SELECT COUNT(DISTINCT P.ID) AS PatientCount FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, P.Birthday)) > 50; 
SELECT DISTINCT ID FROM Patient WHERE Admission = '-' AND CPK < 250
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND YEAR(P.Birthday) BETWEEN 1936 AND 1956 AND L.CPK >= 250
SELECT P.ID, P.SEX, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_DATE) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250; 
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE EXTRACT(YEAR FROM p.Description) = 1991 AND l.GLU < 180; 
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY P.SEX, P.Age ORDER BY P.Age ASC; 
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age, E.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.RBC < 3.5
SELECT P.ID, P.SEX, P.Birthday, P.Admission, L.RBC FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0); 
SELECT DISTINCT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND p.HGB < 10; 
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND HGB BETWEEN 10 AND 17 ORDER BY Birthday ASC LIMIT 1
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_DATE) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) > 2
SELECT AVG(HCT) AS Average_Hematoctit FROM Laboratory WHERE Date LIKE '1991%' AND HCT IS NOT NULL AND HCT < 29; 
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) -      SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS calculation FROM      Laboratory WHERE      PLT IS NOT NULL AND      (PLT <= 100 OR PLT >= 400); 
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE EXTRACT(YEAR FROM L.Date) = 1984 AND P.Birthday IS NOT NULL AND P.SEX != '' AND P.Age < 50 AND L.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END) AS Percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE SUBSTR(CURRENT_TIMESTAMP, 1, 4) - SUBSTR(P.Birthday, 1, 4) > 55; 
SELECT P.ID, P.SEX, P.Birthday, P.Description, P.First_Date, P.Admission, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE YEAR(P.First_Date) > 1992 AND L.PT IS NOT NULL AND L.PT < 14; 
SELECT COUNT(*) FROM Examination WHERE Examination_Date > '1997-01-01' AND APTT = 'None'; 
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE APTT > 45 AND Thrombosis = 0
SELECT COUNT(DISTINCT p.ID) AS Abnormal_Fibrinogen_Count FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND p.WBC BETWEEN 3.5 AND 9.0 AND (l.FG <= 150 OR l.FG >= 450); 
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Birthday > '1980-01-01' AND (L.FG IS NOT NULL AND (L.FG < 150 OR L.FG > 450)); 
SELECT DISTINCT Diagnosis FROM Examination WHERE U_PRO >= 30
SELECT ID FROM Laboratory WHERE `U-PRO` BETWEEN 0 AND 30 AND ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SLE'); 
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000; 
SELECT COUNT(DISTINCT ID) FROM Examination WHERE IGG BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL
SELECT Diagnosis FROM Examination WHERE IGA = (SELECT MAX(IGA) FROM Examination WHERE IGA BETWEEN 80 AND 500); 
SELECT COUNT(DISTINCT p.ID) AS PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date >= '1990-01-01' AND l.IGA BETWEEN 80 AND 500; 
SELECT Diagnosis FROM Lab WHERE IGM <= 40 OR IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRP = '+' AND P.Description IS NULL; 
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) < 70
SELECT COUNT(DISTINCT ID) FROM Examination WHERE RA IN ('-', '+-') AND KCT = '+'
SELECT DISTINCT Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Patient.Birthday) >= 1985 AND Patient.RA IN ('-', '+-')
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday <= DATE_SUB(CURDATE(), INTERVAL 60 YEAR) AND L.RF < 20; 
SELECT COUNT(*) FROM Examination WHERE RF < 20 AND Thrombosis = '0'; 
SELECT COUNT(DISTINCT ID) FROM Examination WHERE C3 > 35 AND ANA_Pattern = 'P'; 
SELECT ID FROM Examination WHERE ID IN ( SELECT ID FROM Patient WHERE HCT NOT BETWEEN 29 AND 52 ) ORDER BY `aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Thrombosis > 0 AND L.C4 IS NOT NULL AND L.C4 > 10; 
SELECT COUNT(DISTINCT E.ID) AS NumberOfPatients FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.RNP IN ('-', '+-') AND P.Admission = '+'; 
SELECT Birthday FROM Patient WHERE ID = (SELECT ID FROM Examination WHERE RNP NOT IN ('-', '+-') ORDER BY Birthday DESC LIMIT 1)
SELECT COUNT(*) FROM Examination WHERE SM IN ('-', '+-') AND Thrombosis = 0; 
SELECT P.ID FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3; 
SELECT ID FROM Examination WHERE `Examination Date` > '1997-01-01' AND SC170 IN ('negative', '0') 
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.SC170 IN ('negative', '0') AND T2.Symptoms IS NULL
SELECT COUNT(DISTINCT E.ID) AS NumberOfPatients FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.First_Date IS NOT NULL AND EXTRACT(YEAR FROM P.First_Date) < 2000 AND E.SSA IN ('-', '+'); 
SELECT ID FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE SSA NOT IN ('negative', '0')) ORDER BY `First Date` ASC LIMIT 1; 
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN ('negative', '0') AND Diagnosis = 'SLE'; 
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN ('negative', '0') AND Symptoms IS NOT NULL; 
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SEX = 'M' AND P.CENTROMEA IN ('-', '+-') AND P.SSB IN ('-', '+-')
SELECT DISTINCT e.Diagnosis FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.DNA >= 8; 
SELECT COUNT(DISTINCT P.ID) AS Unique_Patient_Count FROM Patient P LEFT JOIN Laboratory L ON P.ID = L.ID WHERE P.Description IS NULL AND L.DNA < 8; 
SELECT COUNT(DISTINCT P.ID) AS Admitted_Patient_Count FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGG BETWEEN 900 AND 2000 AND P.Admission = '+'; 
SELECT CAST(SUM(CASE WHEN GOT >= 60 AND Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN GOT >= 60 THEN 1 ELSE 0 END) FROM Laboratory; 
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60; 
SELECT MIN(Birthday) AS Youngest_Birthdate FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE GOT >= 60; 
SELECT P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT IS NOT NULL AND L.GPT < 60 ORDER BY L.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT < 60 AND P.SEX = 'M'
SELECT MIN(T1.First_Date) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500
SELECT MAX(P.First_Date) AS Latest_Patient_Medical_Data FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH >= 500; 
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE ALP >= 300 AND Admission = '+'; 
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.ALP < 300; 
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SJS' AND Laboratory.TP BETWEEN 6.0 AND 8.5; 
SELECT T2.Date FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ALB BETWEEN 3.5 AND 5.5 ORDER BY T1.ALB DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ALB BETWEEN 3.5 AND 5.5 AND TP BETWEEN 6.0 AND 8.5; 
SELECT MAX(aCL_IgG), MAX(aCL_IgM), MAX(aCL_IgA) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND Patient.UA > 6.50; 
SELECT MAX(ANA) AS Highest_ANA_Concentration FROM Examination WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE CRE < 1.5 ); 
SELECT ID FROM Laboratory WHERE CRE < 1.5 ORDER BY aCL_IgA DESC LIMIT 1; 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ANA_Pattern LIKE '%P%' AND l.T_BIL >= 2.0; 
SELECT `ANA` FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.`T-BIL` < 2.0 ORDER BY Laboratory.`T-BIL` DESC LIMIT 1; 
SELECT COUNT(*) FROM Laboratory WHERE T_CHO >= 250 AND KCT = '-'; 
SELECT COUNT(*)  FROM Laboratory AS L  JOIN Examination AS E ON L.ID = E.ID  WHERE L.T_CHO < 250 AND E.ANA_Pattern = 'P'; 
SELECT COUNT(DISTINCT E.ID) AS NumberOfPatients FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.TG IS NOT NULL AND L.TG < 200 AND E.Symptoms IS NOT NULL; 
SELECT Diagnosis FROM Laboratory WHERE TG IS NOT NULL AND TG < 200 ORDER BY TG DESC LIMIT 1
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250; 
SELECT COUNT(DISTINCT E.ID) AS Positive_Coagulation_Patients FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+'); 
SELECT Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU > 180 ORDER BY Birthday ASC LIMIT 1)
SELECT COUNT(*) FROM Laboratory AS L JOIN Examination AS E ON L.ID = E.ID WHERE L.GLU < 180 AND E.Thrombosis = 0; 
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0; 
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Diagnosis = 'SLE' AND Examination.WBC BETWEEN 3.5 AND 9.0
SELECT DISTINCT L.ID FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.Admission = '-' AND (L.RBC <= 3.5 OR L.RBC >= 6.0)
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.PLT BETWEEN 100 AND 400 AND e.Thrombosis != 0
SELECT L.PLT FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE L.PLT BETWEEN 100 AND 400 AND E.Diagnosis = 'MCTD'; 
SELECT AVG(Lab.PT) FROM Patient AS Pat JOIN Laboratory AS Lab ON Pat.ID = Lab.ID WHERE Pat.SEX = 'M' AND Lab.PT < 14
SELECT COUNT(*) FROM Examination WHERE Thrombosis IN (1, 2) AND PT < 14
SELECT major_name FROM member JOIN link_to_major ON member.member_id = link_to_major.link_to_major WHERE first_name = 'Angela' AND last_name = 'Sanders'; 
SELECT COUNT(*) FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Wildland Resources Department' AND ma.college = 'College of Engineering';
SELECT m.first_name, m.last_name FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.department = 'Art and Design' AND m.position = 'Student'
SELECT COUNT(*) FROM attendance AS a JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'; 
SELECT m.phone FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'; 
SELECT COUNT(*) FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'; 
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM attendance GROUP BY link_to_event ORDER BY COUNT(link_to_event) DESC LIMIT 1)
SELECT m.college FROM member m JOIN attendance a ON m.member_id = a.link_to_member WHERE m.position = 'Vice President'; 
SELECT e.event_name FROM event AS e JOIN attendance AS a ON e.event_id = a.link_to_event JOIN member AS m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean'; 
SELECT COUNT(*) FROM attendance AS a JOIN member AS m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(a.event_date) = 2019; 
SELECT COUNT(DISTINCT event_id) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY event_id HAVING COUNT(event_id) > 10; 
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type != 'Fundraiser' GROUP BY e.event_name HAVING COUNT(a.link_to_event) > 20; 
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'
SELECT expense_description FROM expense ORDER BY cost DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE link_to_major IN ( SELECT major_id FROM major WHERE major_name = 'Environmental Engineering' ); 
SELECT m.first_name, m.last_name FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud'; 
SELECT last_name FROM member WHERE link_to_major IN ( SELECT major_id FROM major WHERE major_name = 'Law and Constitutional Studies' )
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey'; 
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT SUM(amount) AS total_funds_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President'; 
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.event_name = 'September Meeting'; 
SELECT m.first_name, m.last_name, z.city, z.state FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'President' GROUP BY m.first_name, m.last_name, z.city, z.state LIMIT 1; 
SELECT m.first_name, m.last_name FROM member AS m JOIN zip_code AS z ON m.zip = z.zip_code WHERE z.state = 'Illinois'; 
SELECT SUM(spent) FROM budget WHERE category = 'Advertisement' AND link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Meeting'); 
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Pierce' AND T1.last_name = 'Guidi'
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker'; 
SELECT T2.approved FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Meeting' AND T1.event_date = '2019-10-08'; 
SELECT AVG(cost) AS average_cost FROM expense JOIN link_to_member ON expense.link_to_member = link_to_member.member_id WHERE first_name = 'Elijah' AND last_name = 'Allen' AND (SUBSTR(expense_date, 6, 2) = '09' OR SUBSTR(expense_date, 6, 2) = '10'); 
SELECT (SUM(CASE WHEN strftime('%Y', event_date) = '2019' THEN spent ELSE 0 END) - SUM(CASE WHEN strftime('%Y', event_date) = '2020' THEN spent ELSE 0 END)) AS difference FROM budget JOIN expense ON budget.link_to_budget = expense.link_to_budget WHERE budget.event_status = 'Closed'; 
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'; 
SELECT budget.remaining FROM budget WHERE budget.category = 'Food' AND budget.amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' ); 
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'; 
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'; 
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'
SELECT COUNT(*) FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'November Meeting') AND remaining < 0; 
SELECT SUM(b.amount) AS total_budget_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker'; 
SELECT T2.event_status FROM expense AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.expense_date = '2019-8-20' AND T1.expense_description = 'Post Cards, Posters'; 
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Brent' AND T2.last_name = 'Thomason'
SELECT COUNT(*) FROM member WHERE link_to_major IN ( SELECT major_id FROM major WHERE major_name = 'Business' ) AND t_shirt_size = 'Medium'
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Christof' AND m.last_name = 'Nielsen'; 
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'
SELECT T2.date_received FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Connor' AND T1.last_name = 'Hilton' AND T2.source = 'Dues'; 
SELECT m.first_name, m.last_name FROM member AS m JOIN income AS i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1; 
SELECT (SUM(CASE WHEN b.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END)) / (SUM(CASE WHEN b.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement'; 
SELECT (SUM(CASE WHEN b.category = 'Parking' AND e.event_name = 'November Speaker' THEN b.amount ELSE 0 END) / COUNT(CASE WHEN e.event_name = 'November Speaker' THEN 1 ELSE NULL END)) * 100 AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id; 
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'; 
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'; 
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth'
SELECT T1.expense_description FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining ASC LIMIT 1
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'; 
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T2.college) DESC LIMIT 1
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.phone = '809-555-3360'
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event ORDER BY amount DESC LIMIT 1
SELECT e.expense_description, e.cost FROM expense e JOIN link_to_member ltm ON e.link_to_member = ltm.member_id JOIN member m ON ltm.member_id = m.member_id WHERE m.position = 'Vice President'; 
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'; 
SELECT date_received FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason'); 
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland'); 
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = '954-555-6240'; 
SELECT T1.first_name ,  T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major  =  T2.major_id WHERE T2.department  =  'School of Applied Sciences, Technology and Education'
SELECT e.event_name, (b.spent / b.amount) AS spend_to_budget_ratio FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.status = 'Closed' ORDER BY spend_to_budget_ratio DESC LIMIT 1; 
SELECT COUNT(*) FROM member WHERE position = 'President'; 
SELECT MAX(spent) AS max_spent FROM budget; 
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'; 
SELECT SUM(spent) FROM budget WHERE category = 'Food'; 
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7; 
SELECT M.first_name, M.last_name FROM member AS M JOIN major AS MA ON M.link_to_major = MA.major_id JOIN attendance AS A ON M.member_id = A.link_to_member JOIN event AS E ON A.link_to_event = E.event_id WHERE MA.major_name = 'Interior Design' AND E.event_name = 'Community Theater'
SELECT first_name, last_name FROM member WHERE link_to_zip IN (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina'); 
SELECT SUM(amount) AS total_income FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour'); 
SELECT m.first_name, m.last_name FROM member AS m JOIN income AS i ON m.member_id = i.link_to_member WHERE i.amount > 40; 
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN event ev ON e.link_to_budget = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'; 
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff'; 
SELECT m.first_name, m.last_name, i.source, SUM(i.amount) AS total_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.first_name, m.last_name, i.source ORDER BY total_income DESC LIMIT 1; 
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1; 
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN exp.cost ELSE 0 END) / SUM(exp.cost)) * 100 AS percentage FROM expense exp JOIN event e ON exp.link_to_event = e.event_id; 
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_physics_ratio FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major; 
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1; 
SELECT first_name, last_name, email FROM member WHERE position = 'Treasurer'; 
SELECT COUNT(*) FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Physics Teaching'; 
SELECT COUNT(link_to_member) AS member_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event_name = 'Community Theater' AND EXTRACT(YEAR FROM event_date) = 2019; 
SELECT COUNT(a.link_to_event) AS events_attended, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN major m ON m.major_id = m.link_to_major WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi'; 
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE category = 'Advertisement' ORDER BY spent DESC LIMIT 1; 
SELECT CASE WHEN EXISTS (     SELECT 1     FROM member m     JOIN attendance a ON m.member_id = a.link_to_member     JOIN event e ON a.link_to_event = e.event_id     WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended; 
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(event_id)) * 100 AS community_service_percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'; 
SELECT expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Posters' AND event.event_name = 'September Speaker'; 
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.status = 'Closed' AND T1.remaining < 0 ORDER BY T1.remaining ASC LIMIT 1
SELECT expense_description, SUM(cost) AS total_value FROM expense JOIN event ON expense.link_to_budget = event.event_id WHERE event_name = 'October Meeting' AND approved = 'true' GROUP BY expense_description; 
SELECT category, SUM(amount) AS total_amount_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_amount_budgeted ASC; 
SELECT budget_id, category, amount FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1; 
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3; 
SELECT SUM(cost) AS total_cost_spent_for_parking FROM expense WHERE expense_description = 'Parking'; 
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'; 
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name
SELECT T1.expense_description FROM expense AS T1 JOIN link_to_member AS T2 ON T1.link_to_member = T2.link_to_member JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison'; 
SELECT DISTINCT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large'; 
SELECT DISTINCT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50; 
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'; 
SELECT T1.position FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*) FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Business' AND m.t_shirt_size = 'Medium'; 
SELECT DISTINCT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30; 
SELECT DISTINCT category FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE location = 'MU 215'); 
SELECT category FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_date = '2020-03-24T12:00:00'); 
SELECT major_name FROM member WHERE position = 'Vice President'; 
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id
SELECT DISTINCT b.category  FROM budget AS b  JOIN event AS e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215'; 
SELECT COUNT(*) FROM income WHERE amount = 50; 
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large' AND position = 'Member'; 
SELECT COUNT(major_id) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences'; 
SELECT m.last_name, d.department, c.college FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id JOIN department AS d ON mj.department = d.department_name JOIN college AS c ON d.college = c.college_name WHERE mj.major_name = 'Environmental Engineering'
SELECT category FROM budget WHERE event_id IN ( SELECT event_id FROM event WHERE location = 'MU 215' AND type = 'Guest Speaker' ) AND spent = 0
SELECT m.first_name, m.last_name, z.city, z.state FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id JOIN zip_code AS z ON m.zip = z.zip_code WHERE mj.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member'; 
SELECT event_name  FROM event  JOIN attendance ON event.event_id = attendance.link_to_event  JOIN member ON attendance.link_to_member = member.member_id  WHERE member.position = 'Vice President' AND event.location = '900 E. Washington St.' AND event.type = 'Social'; 
SELECT T3.last_name, T3.position FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.expense_date = '2019-09-10' AND T1.expense_description = 'Pizza'
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member'; 
SELECT CAST(SUM(CASE WHEN T1.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'Medium'; 
SELECT DISTINCT country FROM zip_code WHERE type = 'PO Box'; 
SELECT DISTINCT zip_code FROM zip_code WHERE city = 'San Juan Municipio' AND state = 'Puerto Rico' AND type = 'PO Box'; 
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'; 
SELECT DISTINCT T2.link_to_event FROM expense AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.cost > 50
SELECT DISTINCT m.member_id, m.first_name, m.last_name, a.link_to_event FROM member AS m JOIN expense AS e ON m.member_id = e.link_to_member JOIN attendance AS a ON m.member_id = a.link_to_member AND a.link_to_event = e.link_to_budget WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'; 
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Katy' AND T2.link_to_major = 'rec1N0upiVLy5esTO'; 
SELECT T2.phone FROM major AS T1 JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.college = 'College of Agriculture and Applied Sciences' AND T1.major_name = 'Business'
SELECT DISTINCT m.email FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 20 AND i.date_received BETWEEN '2019-09-10' AND '2019-11-19'; 
SELECT COUNT(*) FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Education' AND m.position = 'Member'; 
SELECT (COUNT(CASE WHEN remaining < 0 THEN 1 ELSE NULL END) * 100.0 / COUNT(event_id)) AS percentage_over_budget FROM budget; 
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'; 
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code)) * 100 AS percentage_of_po_boxes FROM zip_code; 
SELECT event_name, location FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE remaining > 0); 
SELECT e.event_name, e.event_date  FROM event e  JOIN expense ex ON e.event_id = ex.link_to_event  WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100; 
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100
SELECT z.city, z.county  FROM zip_code z  JOIN event e ON z.zip_code = e.location  WHERE (SELECT COUNT(*) FROM income WHERE link_to_event = e.event_id) > 40; 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(DISTINCT e.event_id) > 1 ORDER BY total_spent DESC LIMIT 1; 
SELECT AVG(T1.cost) AS average_amount_paid FROM expense AS T1 JOIN attendance AS T2 ON T1.link_to_event = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position != 'Member'; 
SELECT T2.event_name FROM expense AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Parking' AND T1.cost < ( SELECT AVG(cost) FROM expense WHERE category = 'Parking' )
SELECT (SUM(CASE WHEN T1.type = 'Meeting' THEN T2.cost ELSE 0 END) / COUNT(T1.event_id)) * 100 AS percentage FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event
SELECT MAX(T1.cost) FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Water, chips, cookies'; 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5; 
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense); 
SELECT (SUM(CASE WHEN m.state = 'New Jersey' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.position)) - (SUM(CASE WHEN m.state = 'Vermont' THEN 1 ELSE 0 END) * 100.0 / COUNT(m.position)) AS percentage_difference FROM member m JOIN zip_code z ON m.zip = z.zip_code; 
SELECT T1.major_name, T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'; 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.first_name, m.last_name; 
SELECT last_name, phone FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Elementary Education'); 
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'January Speaker'; 
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'; 
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09'; 
SELECT category FROM budget WHERE budget_id IN (SELECT link_to_budget FROM expense WHERE expense_description = 'Posters'); 
SELECT m.first_name, m.last_name, d.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN department d ON ma.department = d.department WHERE m.position = 'Secretary'; 
SELECT SUM(b.spent), e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts'; 
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT first_name, last_name, position FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE city = 'Lincolnton' AND state = 'North Carolina'); 
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'; 
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS Ratio FROM customers; 
SELECT c.CustomerID, c.Segment, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date BETWEEN '201201' AND '201212' WHERE c.Segment = 'LAM' ORDER BY y.Consumption ASC LIMIT 1; 
SELECT AVG(Consumption) / 12 AS AvgMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date BETWEEN '201301' AND '201312'; 
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS TotalSpent FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.Currency = 'CZK' AND t.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalSpent DESC; 
SELECT COUNT(DISTINCT c.CustomerID) AS CustomerCount FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' AND y.Date BETWEEN '201201' AND '201212' AND y.Consumption < 30000; 
SELECT (SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END)) AS ConsumptionDifference FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date BETWEEN '201201' AND '201212'; 
SELECT strftime('%Y', t.Date) AS Year, SUM(t.Amount * t.Price) AS TotalSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY Year ORDER BY TotalSpent DESC LIMIT 1; 
SELECT T2.Segment FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T2.Segment ORDER BY SUM(T1.Consumption) ASC LIMIT 1
SELECT Date, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date LIKE '%CZK' GROUP BY Date ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT MAX(Consumption) AS PeakConsumption, SUBSTR(Date, 1, 6) AS Month FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date BETWEEN '201301' AND '201312' GROUP BY SUBSTR(Date, 1, 6) ORDER BY PeakConsumption DESC LIMIT 1; 
SELECT      (SELECT AVG(Consumption)       FROM yearmonth       WHERE CustomerID IN (          SELECT CustomerID           FROM transactions_1k           JOIN customers ON transactions_1k.CustomerID = customers.CustomerID           WHERE YearMonth BETWEEN '201301' AND '201312'             AND customers.Segment = 'SME'           ORDER BY SUM(Amount * Price) ASC           LIMIT 1      )       AND YearMonth BETWEEN '201301' AND '201312'     ) -       (SELECT AVG(Consumption)       FROM yearmonth       WHERE CustomerID IN (          SELECT CustomerID           FROM transactions_1k           JOIN customers ON transactions_1k.CustomerID = customers.CustomerID           WHERE YearMonth BETWEEN '201301' AND '201312'             AND customers.Segment = 'LAM'           ORDER BY SUM(Amount * Price) ASC           LIMIT 1      )       AND YearMonth BETWEEN '201301' AND '201312'     ) AS Diff_SME_LAM,      (SELECT AVG(Consumption)       FROM yearmonth       WHERE CustomerID IN (          SELECT CustomerID           FROM transactions_1k           JOIN customers ON transactions_1k.CustomerID = customers.CustomerID           WHERE YearMonth BETWEEN '201301' AND '201312'             AND customers.Segment = 'LAM'           ORDER BY SUM(Amount * Price) ASC           LIMIT 1      )       AND YearMonth BETWEEN '201301' AND '201312'     ) -       (SELECT AVG(Consumption)       FROM yearmonth       WHERE CustomerID IN (          SELECT CustomerID           FROM transactions_1k           JOIN customers ON transactions_1k.CustomerID = customers.CustomerID           WHERE YearMonth BETWEEN '201301' AND '201312'             AND customers.Segment = 'KAM'           ORDER BY SUM(Amount * Price) ASC           LIMIT 1      )       AND YearMonth BETWEEN '201301' AND '201312'     )
WITH consumption_data AS (     SELECT         ym.Segment,         SUM(CASE WHEN ym.Date LIKE '2012%' THEN ym.Consumption END) AS consumption_2012,         SUM(CASE WHEN ym.Date LIKE '2013%' THEN ym.Consumption END) AS consumption_2013     FROM         yearmonth ym     JOIN         customers c ON ym.CustomerID = c.CustomerID     WHERE         c.Segment IN ('SME', 'LAM', 'KAM')     GROUP BY         ym.Segment ) SELECT     Segment,     ((consumption_2013 - consumption_2012) / consumption_2013) * 100 AS percentage_increase FROM     consumption_data ORDER BY     percentage_increase DESC; 
SELECT SUM(Consumption) AS Total_Consumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'; 
SELECT (SUM(CASE WHEN Country = 'CZE' AND Segment = 'Discount' THEN 1 ELSE 0 END) -         SUM(CASE WHEN Country = 'SVK' AND Segment = 'Discount' THEN 1 ELSE 0 END)) AS DiscountDifference; 
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304'); 
SELECT SUM(CASE WHEN c.Segment = 'SME' AND t.Currency = 'CZK' THEN 1 ELSE 0 END) -        SUM(CASE WHEN c.Segment = 'SME' AND t.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID; 
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1; 
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT SUM(t.Consumption) AS TotalConsumption FROM yearmonth t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND t.Date = '201305'; 
SELECT      ((SUM(CASE WHEN T1.Consumption > 46.73 THEN 1 ELSE 0 END) / COUNT(T1.CustomerID)) * 100) AS Percentage FROM      yearmonth AS T1 JOIN      customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE      T2.Segment = 'LAM'; 
SELECT g.Country, COUNT(*) AS NumberOfValueForMoneyStations FROM gasstations g WHERE g.Segment = 'Value for money' GROUP BY g.Country; 
SELECT CAST(SUM(CASE WHEN c.Segment = 'KAM' AND t.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.CustomerID) AS Percentage FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID; 
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date LIKE '201202%'; 
SELECT (COUNT(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE NULL END) / COUNT(T1.GasStationID)) * 100 AS PremiumPercentage FROM gasstations AS T1 JOIN yearmonth AS T2 ON T1.GasStationID = T2.CustomerID WHERE T1.Country = 'SVK'; 
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1; 
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '2012%'; 
SELECT MAX(Consumption) AS MaxMonthlyConsumption FROM (     SELECT SUM(Amount * Price) / 12 AS Consumption     FROM transactions_1k t     JOIN customers c ON t.CustomerID = c.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY t.CustomerID, YEAR(t.Date), MONTH(t.Date) ) subquery; 
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date LIKE '201309%'; 
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date LIKE '201306%'; 
SELECT DISTINCT g.ChainID, g.Country, g.Segment FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Currency = 'EUR'; 
SELECT DISTINCT p.Description FROM products AS p JOIN transactions_1k AS t ON p.ProductID = t.ProductID WHERE t.Currency = 'EUR'
SELECT AVG(Amount * Price) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01-%'; 
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000; 
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE'; 
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11); 
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000; 
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'; 
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'; 
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'; 
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS TotalPaid FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY TotalPaid DESC LIMIT 1; 
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1; 
SELECT DISTINCT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00'; 
SELECT c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00'; 
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Currency = 'CZK'; 
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers); 
SELECT T3.Country  FROM transactions_1k AS T1  JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID  WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'; 
SELECT ProductID FROM transactions_1k AS T1 WHERE Date = '2012-08-23' AND Time = '21:20:00'; 
SELECT SUM(t.Price * t.Amount) AS TotalSpent, y.Date, y.Consumption FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID AND y.Date LIKE '2012-01%' WHERE t.Date = '2012-08-24' AND t.Price * t.Amount = 124.05; 
SELECT COUNT(*)  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-26'  AND T1.Time BETWEEN '08:00:00' AND '09:00:00'  AND T2.Country = 'CZE'; 
SELECT DISTINCT T2.Currency FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.Date LIKE '%201306%' WHERE T1.Amount * T1.Price = 214582.17; 
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467; 
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Amount * T1.Price = 548.4; 
SELECT (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) / COUNT(c.CustomerID)) * 100 AS Percentage FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25'; 
SELECT ((c.Consumption - y.Consumption) / c.Consumption) AS ConsumptionDecreaseRate FROM (     SELECT t.CustomerID, SUM(t.Amount * t.Price) AS Consumption     FROM transactions_1k t     WHERE t.Date = '2012-08-25'     GROUP BY t.CustomerID ) c JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date LIKE '2013%'; 
SELECT g.GasStationID, SUM(t.Amount * t.Price) AS TotalRevenue FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID GROUP BY g.GasStationID ORDER BY TotalRevenue DESC LIMIT 1; 
SELECT      (SUM(CASE WHEN T1.Segment = 'Premium' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS PremiumPercentage FROM      gasstations AS T1 JOIN      transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE      T1.Country = 'SVK'; 
SELECT SUM(t.Amount) AS TotalAmountSpentByCustomer38508,        SUM(CASE WHEN ym.Date = '201201' THEN t.Amount ELSE 0 END) AS AmountSpentInJanuary2012 FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND t.Date LIKE CONCAT(ym.Date, '%') WHERE t.CustomerID = 38508; 
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.Description ORDER BY COUNT(*) DESC LIMIT 5; 
SELECT c.CustomerID, AVG(t.Price / t.Amount) AS AveragePricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Price) DESC LIMIT 1; 
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1
SELECT c.CustomerID, y.Consumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date LIKE '201208%' WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29.00; 
