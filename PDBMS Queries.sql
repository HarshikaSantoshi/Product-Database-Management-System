--- JOIN with three tables(Product, Inventory, and SalesTransaction): Retrieves product information along with inventory and sales data.
SELECT p.productID, p.product_name, i.inStockQuantity, st.sales_quantity
FROM Product as p
JOIN Inventory as i ON p.productID = i.productID
LEFT JOIN SalesTransaction as st ON p.productID = st.productID;


--- Subquery execution
SELECT productID, product_name, price
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);


--- CASE/WHEN Expression
SELECT product_name,
       CASE
           WHEN price < 10 THEN 'Low'
           WHEN price >= 10 AND Price < 50 THEN 'Moderate'
           ELSE 'High'
       END AS price_category
FROM Product;



--- JOIN with TWO tables(Product and CustomerReview): Retrieves product names and their corresponding customer reviews.
SELECT p.product_name, cr.review_text
FROM Product as p
LEFT JOIN CustomerReview as cr ON p.productID = cr.productID;


--- GROUP BY with HAVING CLAUSE: alculates the total sales revenue for each product and filters products with total sales revenue greater than a specified amount.
SELECT p.productID, p.product_name, SUM(st.sales_revenue) AS TotalSalesRevenue
FROM Product as p
JOIN SalesTransaction as st ON p.productID = st.productID
GROUP BY p.productID, p.product_name
HAVING SUM(st.sales_revenue) > 5;


--- Complex Search Criterion with Logical Connectors: Retrieves products with high forecasted demand and a price range of $50 or less.
SELECT p.productID, p.product_name, df.forecasted_demand, p.price
FROM Product as p
JOIN DemandForecast as df ON p.productID = df.productID
WHERE df.forecasted_demand > 25 AND (p.price <= 50 OR p.price IS NULL);

---Complex Search Criterion: Retrieves products that have been purchased by customers with a specific email address & fall within a price range.
SELECT p.productID, p.product_name, pu.purchase_date, c.cus_email, p.price
FROM Product as p
JOIN Purchase as pu ON p.productID = pu.productID
JOIN Customer as c ON pu.customerID = c.customerID
WHERE c.cus_email = 'nibh.quisque.nonummy@icloud.net' AND (p.price >= 10 AND p.price <= 50);






































