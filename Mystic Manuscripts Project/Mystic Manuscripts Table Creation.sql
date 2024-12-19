--- First table creation

CREATE TABLE mystic_manuscript."having"
(
	id int,
	purchase_date timestamp,
	"date" date,
	"time" time ,
	quarter varchar(50),
	qtr int,
	"year" int,
	"month" int,
	day_of_month int,
	special_day int,
	online_sale_offers int,
	"day" int,
	weekend int,
	morning int,
	afternoon int,
	evening int,
	night int,
	gender int,
	customer_id varchar(50),
	gender_letter char(2),
	product_name varchar(1000),
	item_status varchar(50),
	quantity int,
	currency varchar(50),
	item_price int,
	shipping_price int,
	ship_city varchar(50),
	ship_state varchar(50),
	ship_postal_code int,
	category varchar(50),
	total_amount int,
	author varchar(50),
	"publication" varchar(200),
	profit_percentage int,
	profit_inr float,
	cost_price float
);

SELECT * FROM mystic_manuscript."having" h; 

--- Chaning column data types to more accurately reflect the data being stored/accomodate for longer strings

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "author" TYPE varchar(100);

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "item_price" TYPE float;

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "shipping_price" TYPE float;

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "total_amount" TYPE float;

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "purchase_date" TYPE varchar(100);

--- Grant permissions to team members to allow them to view the table

GRANT SELECT ON mystic_manuscript."having" TO de11_ruwa;
GRANT SELECT ON mystic_manuscript."having" TO da11_jobr;
GRANT SELECT ON mystic_manuscript."having" TO de11_dekn;

--- Looking into a solution to remove blank spaces from strings to increase accuracy for future queries

--- UPDATE mystic_manuscript."having"
--- SET author = TRIM(author)

--- These functions replace the non-break blank spaces with regular blank spaces, allowing us to trim the strings

UPDATE mystic_manuscript."having"
SET author = REPLACE(author, CHR(160), ' ')
WHERE author LIKE '%' || CHR(160) || '%';

UPDATE mystic_manuscript."having"
SET author = TRIM(author);

--- Used to check to see if the spaces have been cleared correctly

SELECT author
FROM mystic_manuscript."having"
WHERE 
	author LIKE '% ';

--- Repeat for other columns experiencing the same problems
	
UPDATE mystic_manuscript."having"
SET "publication" = REPLACE("publication", CHR(160), ' ')
WHERE "publication" LIKE '%' || CHR(160) || '%';

UPDATE mystic_manuscript."having"
SET "publication" = TRIM("publication");

SELECT "publication"
FROM mystic_manuscript."having"
WHERE 
	"publication" LIKE '% ';

--- These queries return us the distinct values seen in each column. This was used to determine if there are any
--- values that shouldn't belong and don't follow the consistency rules of the rest of the column.
	
SELECT DISTINCT category
FROM mystic_manuscript."having"

SELECT DISTINCT item_status
FROM mystic_manuscript."having"

--- Considering the necessity of converting 1 and 0 fields into boolean values. This would be a question to be asked to ensure
--- we don't represent information as the wrong data type.

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "morning" TYPE boolean USING morning::boolean;

--- We start again here once receiving the new data set with greater accuracy. We drop the table to clear unnecessary columns and data
--- while redefining it in a similar way. However, we now have new data types and are able to define a primary key

DROP TABLE mystic_manuscript."having"

CREATE TABLE mystic_manuscript."having"
(
	id serial PRIMARY KEY,
	purchase_date timestamp,
	"date" date,
	"time" time ,
	quarter varchar(50),
	qtr int,
	"year" int,
	"month" int,
	day_of_month int,
	special_day int,
	online_sale_offers int,
	"day" int,
	weekend int,
	morning int,
	afternoon int,
	evening int,
	night int,
	gender int,
	customer_id varchar(50),
	gender_letter char(2),
	product_name varchar(1000),
	item_status varchar(50),
	quantity int,
	currency varchar(50),
	item_price float,
	shipping_price float,
	ship_city varchar(50),
	ship_state varchar(50),
	ship_postal_code int,
	category varchar(50),
	total_amount float,
	author varchar(100),
	"publication" varchar(200),
	profit_percentage int,
	profit_inr float,
	cost_price float
);

GRANT SELECT ON mystic_manuscript."having" TO de11_ruwa;
GRANT SELECT ON mystic_manuscript."having" TO da11_jobr;
GRANT SELECT ON mystic_manuscript."having" TO de11_dekn;

--- We needed to redefine the table to allow us to properly format the 'purchase_date' column as a timestamp. Previously, it was in the
--- wrong dd/mm/yyyy format and this was the solution we completed

DROP TABLE mystic_manuscript."having"

CREATE TABLE mystic_manuscript."having"
(
	id serial PRIMARY KEY,
	purchase_date varchar(100),
	"date" date,
	"time" time ,
	quarter varchar(50),
	qtr int,
	"year" int,
	"month" int,
	day_of_month int,
	special_day int,
	online_sale_offers int,
	"day" int,
	weekend int,
	morning int,
	afternoon int,
	evening int,
	night int,
	gender int,
	customer_id varchar(50),
	gender_letter char(2),
	product_name varchar(1000),
	item_status varchar(50),
	quantity int,
	currency varchar(50),
	item_price float,
	shipping_price float,
	ship_city varchar(50),
	ship_state varchar(50),
	ship_postal_code int,
	category varchar(50),
	total_amount float,
	author varchar(100),
	"publication" varchar(200),
	profit_percentage int,
	profit_inr float,
	cost_price float
);

GRANT SELECT ON mystic_manuscript."having" TO de11_ruwa;
GRANT SELECT ON mystic_manuscript."having" TO da11_jobr;
GRANT SELECT ON mystic_manuscript."having" TO de11_dekn;

--- This function allows us to transform the string value of the timestamp into the correct format by recasting it.

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN purchase_date TYPE TIMESTAMP
USING TO_TIMESTAMP(purchase_date, 'DD/MM/YYYY HH24:MI');

--- This group of queries changes all the values in the column into a standardised format. Previously, multiple values containing
--- the same words were returned which may create some problems down the line.

SELECT DISTINCT category
FROM mystic_manuscript."having" h 

UPDATE mystic_manuscript."having"
SET category = lower(category)

SELECT DISTINCT category
FROM mystic_manuscript."having" h 

SELECT COUNT(*) AS total_rows
FROM mystic_manuscript."having";

------------------------------------------------------------------------------------------------------------------------------------------------------

GRANT SELECT ON mystic_manuscript."having" TO github_classroom

SELECT * FROM mystic_manuscript."having" h 

--- Query 3
/*
SELECT 
    round(
    CAST(
      SUM(qtr)
    + SUM(year)
    + SUM(month)
    + SUM(day_of_month)
    + SUM(special_day)
    + SUM(online_sale_offers)
    + SUM("day")
    + SUM(weekend)
    + SUM(morning)
    + SUM(afternoon)
    + SUM(evening)
    + SUM(night)
    + SUM(gender)
    + SUM(quantity)
    + SUM(item_price)
    + SUM(shipping_price)
    + SUM(total_amount)
    + SUM(profit_percentage)
    + SUM(profit_inr)
    + SUM(cost_price)    
    AS NUMERIC), 2) AS sum_of_column_sums
FROM 
    mystic_manuscript."having";
   
*/
	
--- Resetting date-related columns to varchars. Postgresql storage of dates has predefined formats that are not the same as the original data.
--- As a result, storing dates as texts is the most accurate method.
	
ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "purchase_date" TYPE varchar(50);

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "date" TYPE varchar(50);

ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "time" TYPE varchar(50);
	
ALTER TABLE mystic_manuscript."having"
ALTER COLUMN "date" TYPE TEXT
USING TO_CHAR("date"::DATE, 'MM/DD/YYYY');

--- Query 6

/*

SELECT id,
date
FROM mystic_manuscript."having"
ORDER BY
    RANDOM()
LIMIT
    5;

*/
