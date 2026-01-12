-- Use Database 
use projects;

-- List the Tables 
select * from sys.tables;

-- Check table data --
select * from Train;
select * from Test;

-- ############################## After Model ################################

-- Getting Dataset From Python

-- Created the Empty Table
CREATE TABLE Price_Predictions (
    product_id INT,
    timestamp DATETIME,
    predicted_price FLOAT
);

-- Getting Predicted dataset 
CREATE VIEW vw_Pricing_Live AS
SELECT
    t.product_id,
    t.timestamp,
    t.base_price,
    p.predicted_price,
    DATENAME(MONTH, t.timestamp) AS Month_Name,
    MONTH(t.timestamp) AS Month_No
FROM Test t
LEFT JOIN Price_Predictions p
    ON t.product_id = p.product_id
    AND t.timestamp = p.timestamp;

-- Table
select * from vw_Pricing_Live;

-- count the rows
select count(product_id) from vw_Pricing_Live;

-- ################################# Connect dataset to Tableau ################################

-- Extract the Data Table as a Excel file to connect Tableau --

