/*
Student name: Ahmed-Mustapha DRAME              
Student ID: 240034521            
*/

/* SECTION 1 - CREATING TABLE STATEMENTS */
CREATE TABLE invstUser (
    user_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE invstMarket (
    market_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(50),
    opening_price DECIMAL(18, 2),
    closing_price DECIMAL(18, 2),
    date_updated INTEGER
);

CREATE TABLE invstProduct (
    product_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    market_ID INTEGER,
    market_value DECIMAL(18, 2),
    date_updated INTEGER,
    type ENUM('Stock', 'RealEstate', 'Bond'), -- Type specifies the product type
    ticker_symbol VARCHAR(10) DEFAULT NULL,        
    dividend_yield DECIMAL(5, 2) DEFAULT NULL,    
    property_type VARCHAR(50) DEFAULT NULL,        
    location VARCHAR(100) DEFAULT NULL,           
    maturity_date INTEGER DEFAULT NULL,               
    bond_type VARCHAR(50) DEFAULT NULL,        
    FOREIGN KEY (market_ID) REFERENCES invstMarket(market_ID) ON DELETE CASCADE
);

CREATE TABLE invstInvestment (
    investment_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_ID INTEGER,
    product_ID INTEGER,
    date_invested INTEGER,
    transaction_amount DECIMAL(18, 2),
    FOREIGN KEY (user_ID) REFERENCES invstUser(user_ID),
    FOREIGN KEY (product_ID) REFERENCES invstProduct(product_ID) ON DELETE CASCADE
);

CREATE TABLE invstMonthly_report (
    report_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_ID INTEGER,
    lost_value DECIMAL(18, 2),
    return_amount DECIMAL(18, 2),
    report_date INTEGER,
    investment_ID INTEGER,
    FOREIGN KEY (user_ID) REFERENCES invstUser(user_ID),
    FOREIGN KEY (investment_ID) REFERENCES invstInvestment(investment_ID) ON DELETE CASCADE
);

/* SECTION 2 - INSERT STATEMENTS */
INSERT INTO invstUser (login, email, password) VALUES
    ('John Doe', 'john.doe@gmail.com', 'password123'),
    ('Jane Smith', 'jane.smith@yahoo.com', 'securePassword1'),
    ('Alice Debauviers', 'alice.debauviers@gmail.com', 'alicePass2024'),
    ('Bob Williams', 'bob.williams@outlook.com', 'bobSecure2024'),
    ('Charlie Brown', 'charlie.brown@yahoo.com', 'charlie1234'),
    ('Emma Davis', 'emma.davis@outlook.com', 'emmaStrong456'),
    ('Romeo Beckham', 'romeo.beckham@gmail.com', 'noahPass567'),
    ('Megan Fox', 'megan.martin@outlook.com', 'foxmeg789'),
    ('Roberto Carlos', 'roberto.carlos@gmail.com', 'dasilvar6'),
    ('Lilly Clark', 'lily.clark@yahoo.com', 'lilyPass12');

INSERT INTO invstMarket (name, type, opening_price, closing_price, date_updated) VALUES
    ('NASDAQ Stock Market', 'StockMarket', 100.00, 150.50, 240101),
    ('New York Stock Exchange', 'StockMarket', 250.00, 255.00, 240202),
    ('London Stock Exchange', 'StockMarket', 1025.75, 1030.50, 240303),
    ('Tokyo Stock Exchange', 'StockMarket', 200.00, 220.00, 240404),
    ('Euronext Paris', 'StockMarket', 350.00, 355.00, 240505),
    ('Shenzhen Stock Exchange', 'StockMarket', 1005.25, 1008.50, 240606),
    ('Australian Stock Exchange', 'StockMarket', 75.00, 90.00, 240707),
    ('Shanghai Stock Exchange', 'StockMarket', 450.00, 460.00, 240808),
    ('Singapore Exchange', 'StockMarket', 1200.00, 1205.00, 240909),
    ('Hong Kong Stock Exchange', 'StockMarket', 120.00, 130.00, 241010),
    ('Real Estate Market New York', 'RealEstateMarket', NULL, NULL, 240101),
    ('Bond Market USA', 'BondMarket', NULL, NULL, 240202),
    ('Municipal Bond Market USA', 'BondMarket', NULL, NULL, 240303);

INSERT INTO invstProduct (name, market_ID, market_value, date_updated, type, ticker_symbol, dividend_yield, property_type, location, maturity_date, bond_type) VALUES
/* Stocks */
    ('Apple Inc.', 1, 150.50, 240101, 'Stock', 'AAPL', 3.50, NULL, NULL, NULL, NULL),
    ('Microsoft Corporation', 2, 250.00, 240202, 'Stock', 'MSFT', 1.50, NULL, NULL, NULL, NULL),
    ('Tesla Inc.', 3, 650.00, 240303, 'Stock', 'TSLA', 0.50, NULL, NULL, NULL, NULL),
    ('Amazon.com Inc.', 4, 1025.75, 240404, 'Stock', 'AMZN', 2.00, NULL, NULL, NULL, NULL),
    ('Alphabet Inc.', 5, 1250.00, 240505, 'Stock', 'GOOGL', 0.00, NULL, NULL, NULL, NULL),
    ('Meta Platforms, Inc.', 6, 300.00, 240606, 'Stock', 'META', 0.00, NULL, NULL, NULL, NULL),
/* Real estates */
    ('Brookfield Place', 11, 270000.00, 240101, 'RealEstate', NULL, 5.89, 'Commercial Office Building', 'New York City', NULL, NULL),
    ('One World Trade Center', 11, 500000.00, 260405, 'RealEstate', NULL, 12, 'Office Building', 'New York City', NULL, NULL),
/* Bonds */
    ('US Treasury Bond 2025', 13, 1025.75, 240303, 'Bond', NULL, 1.50, NULL, NULL, 250531, 'Government'),
    ('UK Gilt Bond 2027', 13, 1002.50, 240404, 'Bond', NULL, 2.00, NULL, NULL, 270613, 'Government'),
    ('Goldman Sachs Corporate Bond 2025', 13, 1050.00, 240505, 'Bond', NULL, 3.25, NULL, NULL, 250730, 'Corporate'),
    ('Municipal Bond 2024 - Los Angeles', 13, 1200.00, 240606, 'Bond', NULL, 1.75, NULL, NULL, 250922, 'Municipal');

INSERT INTO invstInvestment (user_ID, product_ID, date_invested, transaction_amount) VALUES
    (6, 12, 240922, 4000.00),   -- User 6 invests in Municipal Bond 2024 - Los Angeles
    (5, 9, 240531, 3000.00),   -- User 5 invests in US Treasury Bond 2025
    (2, 4, 240404, 10000.00),  -- User 2 invests in Amazon.com Inc.
    (3, 6, 240606, 8000.00),   -- User 3 invests in Meta Platforms, Inc.
    (1, 2, 240202, 3000.00),   -- User 1 invests in Microsoft Corporation
    (7, 9, 240531, 6000.00),   -- User 7 invests in US Treasury Bond 2025 (another investment)
    (5, 10, 240613, 5000.00),   -- User 5 invests in UK Gilt Bond 2027
    (2, 3, 240303, 7000.00),   -- User 2 invests in Tesla Inc.
    (1, 1, 240101, 5000.00),   -- User 1 invests in Apple Inc.
    (6, 11, 240730, 8000.00),   -- User 6 invests in Goldman Sachs Corporate Bond 2025
    (3, 7, 240707, 9000.00),   -- User 3 invests in Brookfield Place (Real Estate)
    (4, 8, 260808, 250000.00), -- User 4 invests in One World Trade Center (Real Estate)
    (2, 5, 240505, 12000.00);  -- User 2 invests in Alphabet Inc

INSERT INTO invstMonthly_report (user_ID, lost_value, return_amount, report_date, investment_ID) VALUES
    (1, 500.00, 1000.00, 250203, 5),     -- User 1 has a report for Feb 2025
    (1, 0.00, 1200.10, 250102, 9),       -- User 1 has a report for Jan 2025
    (2, 250.00, 11750.68, 240304, 8),    -- User 2 has a report for Mar 2024
    (2, 500.00, 800.00, 240506, 13),     -- User 2 has a report for May 2024
    (2, 100.00, 1500.00, 241005, 3),     -- User 2 has a report for Oct 2024
    (3, 0.00, 2000.00, 241207, 4),       -- User 3 has a report for Dec 2024
    (3, 450.00, 2200.00, 290708, 11),    -- User 3 has a report for Jul 2029 
    (4, 11000.00, 20000.00, 310809, 12), -- User 4 has a report for Aug 2031 
    (5, 300.00, 900.00, 250531, 2),      -- User 5 has a report for May 2025
    (5, 500.00, 1100.00, 241213, 7),     -- User 5 has a report for Dec 2024
    (6, 0.00, 1500.00, 250731, 10),      -- User 6 has a report for Jul 2024
    (6, 200.00, 800.00, 250323, 1),      -- User 6 has a report for Mar 2025
    (7, 100.00, 1000.00, 250531, 6);     -- User 7 has a report for May 2025
                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */


/* 1)  Modifying the dividend_yield for "One World Trade Center" in the invstProduct table */

UPDATE invstProduct
SET dividend_yield = 11.45 
WHERE name = 'One World Trade Center';

/* 2) Jane Smith recently changed her password */

UPDATE invstUser
SET password = 'jajane76Sm'
WHERE login = 'Jane Smith';


/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 
1) Who lost the most money on their investment and how much ?

*/
SELECT T1.login, SUM(T2.lost_value) AS MaxLoss
FROM invstUser T1
JOIN invstMonthly_report T2 
ON T1.user_ID = T2.user_ID
GROUP BY T1.user_ID
ORDER BY MaxLoss DESC;

/* 
2)  List all users whose email addresses contain the domain gmail.com

*/
SELECT login, email 
FROM invstUser 
WHERE email LIKE '%@gmail.com';

/* 
3)  List all investments with market value lower than £1000 in the NASDAQ Stock Market

*/
SELECT p.name AS product_name, p.market_value, m.name AS market_name
FROM invstProduct p
JOIN invstMarket m 
ON p.market_ID = m.market_ID
WHERE m.name = 'NASDAQ Stock Market' AND p.market_value < 1000
ORDER BY p.market_value DESC;


/* 
4)  Finding all users who invested in both stocks and bonds

*/
(SELECT u.login
 FROM invstUser u
 JOIN invstInvestment ii 
 ON u.user_ID = ii.user_ID
 JOIN invstProduct ip 
 ON ii.product_ID = ip.product_ID
 WHERE ip.type = 'Stock')
UNION
(SELECT u.login
 FROM invstUser u
 JOIN invstInvestment ii ON u.user_ID = ii.user_ID
 JOIN invstProduct ip ON ii.product_ID = ip.product_ID
 WHERE ip.type = 'Bond')
ORDER BY login;


/* 
5)  List all investment, their corresponding market with their closing price

*/
SELECT T1.investment_ID, T2.name AS ProductName, T3.name AS MarketName, T3.closing_price
FROM invstInvestment T1
JOIN invstProduct T2
ON T1.product_ID = T2.product_ID
JOIN invstMarket T3
ON T2.market_ID = T3.market_ID
ORDER BY T3.closing_price DESC;


/* 
6) Calculating the average market value of products grouped by their type and display those above £500
*/
SELECT  p.type AS product_type, m.name AS market_name, AVG(p.market_value) AS average_market_value
FROM invstProduct p
JOIN  invstMarket m 
ON p.market_ID = m.market_ID
GROUP BY  p.type, m.name
HAVING AVG(p.market_value) > 500
ORDER BY average_market_value ASC;



/* 
7)  Calculate the total investment amount grouped by market type, filtering only those with investments over £10,000.

*/

SELECT m.type AS MarketType,
       (SELECT SUM(i.transaction_amount) 
        FROM invstInvestment i
        JOIN invstProduct p ON 
        i.product_ID = p.product_ID
        WHERE p.market_ID = m.market_ID) AS TotalInvestment
FROM invstMarket m
WHERE (SELECT SUM(i.transaction_amount) 
       FROM invstInvestment i
       JOIN invstProduct p 
       ON i.product_ID = p.product_ID
       WHERE p.market_ID = m.market_ID) > 10000;


/* 
8)  List the top 3 highest-valued markets based on their closing price

*/
SELECT name AS market_name, MAX(closing_price) AS highest_closing_price
FROM invstMarket
GROUP BY market_ID
ORDER BY highest_closing_price DESC
LIMIT 3;



/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/*
1) Tokyo Stock Exchange is no longer available as a market to invest from

*/
DELETE FROM invstMarket 
WHERE name = 'Tokyo Stock Exchange';

/*
2) Delete users who do not have any report

*/
DELETE FROM invstUser
WHERE user_ID NOT IN ( SELECT DISTINCT user_ID 
                        FROM invstMonthly_report);


/* SECTION 6 - DROP TABLES */

DROP TABLE IF EXISTS invstMonthly_report;
DROP TABLE IF EXISTS invstInvestment;
DROP TABLE IF EXISTS invstProduct;
DROP TABLE IF EXISTS invstMarket;
DROP TABLE IF EXISTS invstUser;

SHOW TABLES;