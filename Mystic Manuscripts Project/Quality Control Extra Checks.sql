-- SQ-8 Null value check
SELECT 
    COUNT(*) - COUNT(id) +
    COUNT(*) - COUNT(purchase_date) +
    COUNT(*) - COUNT(date) +
    COUNT(*) - COUNT(time) +
    COUNT(*) - COUNT(quarter) +
    COUNT(*) - COUNT(qtr) +
    COUNT(*) - COUNT(year) +
    COUNT(*) - COUNT(month) +
    COUNT(*) - COUNT(day_of_month) +
    COUNT(*) - COUNT(special_day) +
    COUNT(*) - COUNT(online_sale_offers) +
    COUNT(*) - COUNT(day) +
    COUNT(*) - COUNT(weekend) +
    COUNT(*) - COUNT(morning) +
    COUNT(*) - COUNT(afternoon) +
    COUNT(*) - COUNT(evening) +
    COUNT(*) - COUNT(night) +
    COUNT(*) - COUNT(gender) +
    COUNT(*) - COUNT(customer_id) +
    COUNT(*) - COUNT(gender_letter) +
    COUNT(*) - COUNT(product_name) +
    COUNT(*) - COUNT(item_status) +
    COUNT(*) - COUNT(quantity) +
    COUNT(*) - COUNT(currency) +
    COUNT(*) - COUNT(item_price) +
    COUNT(*) - COUNT(shipping_price) +
    COUNT(*) - COUNT(ship_city) +
    COUNT(*) - COUNT(ship_state) +
    COUNT(*) - COUNT(ship_postal_code) +
    COUNT(*) - COUNT(category) +
    COUNT(*) - COUNT(total_amount) +
    COUNT(*) - COUNT(author) +
    COUNT(*) - COUNT(publication) +
    COUNT(*) - COUNT(profit_percentage) +
    COUNT(*) - COUNT(profit_inr) +
    COUNT(*) - COUNT(cost_price)
    AS null_value_count
FROM 
    mystic_manuscript."having";


-- SQ-9 Max Total Amount Check
SELECT
    id,
    total_amount
FROM
    mystic_manuscript."having"
ORDER BY total_amount DESC
LIMIT 1;


-- SQ-10 Minumum Cost Price Check
SELECT
    id,
    cost_price
FROM
    mystic_manuscript."having"
ORDER BY cost_price ASC
LIMIT 1;


-- SQ-11 Date range check
SELECT 
    COUNT(*)
FROM 
    mystic_manuscript."having"
WHERE 
    TO_DATE(date, 'MM/DD/YYYY')  >= '2019-01-01':: DATE AND TO_DATE(date, 'MM/DD/YYYY') <= '2019-12-31':: DATE;