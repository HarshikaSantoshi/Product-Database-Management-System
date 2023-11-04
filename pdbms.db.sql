BEGIN TRANSACTION;
DROP TABLE IF EXISTS "Customer";
CREATE TABLE IF NOT EXISTS "Customer" (
	"customerID"	number,
	"cus_name"	varchar(255) DEFAULT NULL,
	"cus_email"	varchar(255) DEFAULT NULL,
	PRIMARY KEY("customerID")
);
DROP TABLE IF EXISTS "Inventory";
CREATE TABLE IF NOT EXISTS "Inventory" (
	"inventoryID"	INTEGER,
	"inStockQuantity"	TEXT DEFAULT NULL,
	"reorder_level"	TEXT DEFAULT NULL,
	"productID"	INTEGER,
	PRIMARY KEY("inventoryID"),
	FOREIGN KEY("productID") REFERENCES "Product"("productID")
);
DROP TABLE IF EXISTS "SalesTransaction";
CREATE TABLE IF NOT EXISTS "SalesTransaction" (
	"transactionID"	INTEGER,
	"transactionDate"	varchar(255),
	"sales_quantity"	TEXT DEFAULT NULL,
	"sales_revenue"	TEXT DEFAULT NULL,
	"productID"	INTEGER,
	PRIMARY KEY("transactionID"),
	FOREIGN KEY("productID") REFERENCES "Product"("productID")
);
DROP TABLE IF EXISTS "Product";
CREATE TABLE IF NOT EXISTS "Product" (
	"productID"	INTEGER,
	"product_name"	varchar(255) DEFAULT NULL,
	"product_category"	varchar(255) DEFAULT NULL,
	"product_brand"	varchar(255) DEFAULT NULL,
	"price"	mediumint DEFAULT NULL,
	"discount"	mediumint,
	"inventoryID"	INTEGER,
	"reviewID"	INTEGER,
	PRIMARY KEY("productID" AUTOINCREMENT),
	FOREIGN KEY("reviewID") REFERENCES "CustomerReview"("reviewID"),
	FOREIGN KEY("inventoryID") REFERENCES "Inventory"("inventoryID")
);
DROP TABLE IF EXISTS "CustomerReview";
CREATE TABLE IF NOT EXISTS "CustomerReview" (
	"reviewID"	INTEGER,
	"review_text"	TEXT DEFAULT NULL,
	"rating"	TEXT DEFAULT NULL,
	"productID"	INTEGER,
	PRIMARY KEY("reviewID"),
	FOREIGN KEY("productID") REFERENCES "Product"("productID")
);
DROP TABLE IF EXISTS "DemandForecast";
CREATE TABLE IF NOT EXISTS "DemandForecast" (
	"forecastID"	INTEGER,
	"forecasted_demand"	TEXT DEFAULT NULL,
	"forecast_date"	varchar(255),
	"confidence_level"	TEXT DEFAULT NULL,
	"productID"	INTEGER,
	PRIMARY KEY("forecastID"),
	FOREIGN KEY("productID") REFERENCES "Product"("productID")
);
DROP TABLE IF EXISTS "Purchase";
CREATE TABLE IF NOT EXISTS "Purchase" (
	"purchaseID"	INTEGER,
	"purchase_date"	varchar(255),
	"customerID"	INTEGER,
	"productID"	INTEGER,
	PRIMARY KEY("purchaseID"),
	FOREIGN KEY("productID") REFERENCES "Product"("productID"),
	FOREIGN KEY("customerID") REFERENCES "Customer"("customerID")
);
INSERT INTO "Customer" VALUES (1,'Shelby Lawson','egestas.rhoncus@hotmail.org');
INSERT INTO "Customer" VALUES (2,'Micah Simon','amet@icloud.ca');
INSERT INTO "Customer" VALUES (3,'Patricia Underwood','nec.orci@outlook.net');
INSERT INTO "Customer" VALUES (4,'Colton Atkins','massa.lobortis@icloud.edu');
INSERT INTO "Customer" VALUES (5,'Rahim Goodwin','at.arcu@google.net');
INSERT INTO "Customer" VALUES (6,'Jamalia Bishop','enim.commodo.hendrerit@protonmail.ca');
INSERT INTO "Customer" VALUES (7,'Illiana Mcclure','nibh.quisque.nonummy@icloud.net');
INSERT INTO "Customer" VALUES (8,'Briar Bass','vel.sapien@protonmail.ca');
INSERT INTO "Customer" VALUES (9,'Chloe Wooten','elit.etiam.laoreet@icloud.org');
INSERT INTO "Customer" VALUES (10,'Ainsley Townsend','amet.orci@outlook.couk');
INSERT INTO "Customer" VALUES (11,'Callie Lindsay','tortor.nibh@aol.com');
INSERT INTO "Customer" VALUES (12,'Alvin Wall','vestibulum@aol.edu');
INSERT INTO "Customer" VALUES (13,'Victor Crosby','id.ante.dictum@yahoo.couk');
INSERT INTO "Customer" VALUES (14,'Medge Horne','ornare.placerat@yahoo.com');
INSERT INTO "Customer" VALUES (15,'Colorado Hoffman','quisque.varius@yahoo.org');
INSERT INTO "Customer" VALUES (16,'Selma Fuller','tortor.nunc@google.ca');
INSERT INTO "Customer" VALUES (17,'Ulysses Hansen','dui.nec@outlook.couk');
INSERT INTO "Customer" VALUES (18,'Macy Kirby','amet@yahoo.org');
INSERT INTO "Customer" VALUES (19,'Xena Quinn','purus.maecenas@protonmail.ca');
INSERT INTO "Customer" VALUES (20,'Indigo Baker','nulla@yahoo.org');
INSERT INTO "Inventory" VALUES (1,'10','50',1);
INSERT INTO "Inventory" VALUES (2,'10','50',2);
INSERT INTO "Inventory" VALUES (3,'20','100',3);
INSERT INTO "Inventory" VALUES (4,'20','100',4);
INSERT INTO "Inventory" VALUES (5,'5','80',5);
INSERT INTO "Inventory" VALUES (6,'5','80',6);
INSERT INTO "Inventory" VALUES (7,'47','25',7);
INSERT INTO "Inventory" VALUES (8,'47','25',8);
INSERT INTO "Inventory" VALUES (9,'56','75',9);
INSERT INTO "Inventory" VALUES (10,'56','75',10);
INSERT INTO "Inventory" VALUES (11,'10','10',11);
INSERT INTO "Inventory" VALUES (12,'10','10',12);
INSERT INTO "Inventory" VALUES (13,'20','50',13);
INSERT INTO "Inventory" VALUES (14,'20','50',14);
INSERT INTO "Inventory" VALUES (15,'5','100',15);
INSERT INTO "Inventory" VALUES (16,'5','100',16);
INSERT INTO "Inventory" VALUES (17,'47','80',17);
INSERT INTO "Inventory" VALUES (18,'47','80',18);
INSERT INTO "Inventory" VALUES (19,'56','25',19);
INSERT INTO "Inventory" VALUES (20,'56','25',20);
INSERT INTO "SalesTransaction" VALUES (1,'May 24 23','1','2.99',1);
INSERT INTO "SalesTransaction" VALUES (2,'Jun 20 24','1','2.99',2);
INSERT INTO "SalesTransaction" VALUES (3,'Mar 19 24','2','10',3);
INSERT INTO "SalesTransaction" VALUES (4,'Dec 9 22','2','10',4);
INSERT INTO "SalesTransaction" VALUES (5,'Jun 6 24','3','6',5);
INSERT INTO "SalesTransaction" VALUES (6,'Oct 28 24','3','6',6);
INSERT INTO "SalesTransaction" VALUES (7,'Jun 15 23','4','5',7);
INSERT INTO "SalesTransaction" VALUES (8,'May 27 23','4','5',8);
INSERT INTO "SalesTransaction" VALUES (9,'Feb 8 24','5','8.99',9);
INSERT INTO "SalesTransaction" VALUES (10,'Mar 25 24','5','8.99',10);
INSERT INTO "SalesTransaction" VALUES (11,'Jan 9 23','1','9.49',11);
INSERT INTO "SalesTransaction" VALUES (12,'Jun 6 23','1','9.49',12);
INSERT INTO "SalesTransaction" VALUES (13,'Nov 26 22','2','2.99',13);
INSERT INTO "SalesTransaction" VALUES (14,'Feb 8 23','2','2.99',14);
INSERT INTO "SalesTransaction" VALUES (15,'Jul 23 23','3','10',15);
INSERT INTO "SalesTransaction" VALUES (16,'May 1 23','3','10',16);
INSERT INTO "SalesTransaction" VALUES (17,'Jun 7 24','4','6',17);
INSERT INTO "SalesTransaction" VALUES (18,'Apr 19 23','4','6',18);
INSERT INTO "SalesTransaction" VALUES (19,'Oct 10 23','5','5',19);
INSERT INTO "SalesTransaction" VALUES (20,'Oct 25 24','5','5',20);
INSERT INTO "Product" VALUES (1,'laptop','electronics','apple',284,0,NULL,NULL);
INSERT INTO "Product" VALUES (2,'yogurt','grocery','dannon',1.74,0,NULL,NULL);
INSERT INTO "Product" VALUES (3,'earphones','electronics','apple',109,22,NULL,NULL);
INSERT INTO "Product" VALUES (4,'laptop','electronics','intel',199,50,NULL,NULL);
INSERT INTO "Product" VALUES (5,'milk','grocery','greatvalue',2.99,0,NULL,NULL);
INSERT INTO "Product" VALUES (6,'milk','grocery','horizon',1.65,0,NULL,NULL);
INSERT INTO "Product" VALUES (7,'earphones','electronics','boat',20.5,6.53,NULL,NULL);
INSERT INTO "Product" VALUES (8,'earphones','electronics','bose',120,22.8,NULL,NULL);
INSERT INTO "Product" VALUES (9,'coffee','grocery','starbucks',25.3,0,NULL,NULL);
INSERT INTO "Product" VALUES (10,'coffee','grocery','greatvalue',18.1,0,NULL,NULL);
INSERT INTO "Product" VALUES (11,'laptop','electronics','HP',180,40,NULL,NULL);
INSERT INTO "Product" VALUES (12,'earphones','electronics','HP',15.3,0,NULL,NULL);
INSERT INTO "Product" VALUES (13,'yogurt','grocery','chobani',1.83,0,NULL,NULL);
INSERT INTO "Product" VALUES (14,'laptop','electronics','Dell',278,50,NULL,NULL);
INSERT INTO "Product" VALUES (15,'earphones','electronics','Beatz',24.6,0,NULL,NULL);
INSERT INTO "Product" VALUES (16,'keyboard','electronics','HP',18.9,0,NULL,NULL);
INSERT INTO "Product" VALUES (17,'oil','grocery','greatvalue',4.99,0,NULL,NULL);
INSERT INTO "Product" VALUES (18,'keyboard','electronics','Dell',14.3,0,NULL,NULL);
INSERT INTO "Product" VALUES (19,'yogurt','grocery','activia',2.39,0,NULL,NULL);
INSERT INTO "Product" VALUES (20,'milk','grocery','crystal',5.7,0,NULL,NULL);
INSERT INTO "CustomerReview" VALUES (1,'"Terrible quality, don''t waste your money." "Not','1',1);
INSERT INTO "CustomerReview" VALUES (2,'"Terrible quality.','1',2);
INSERT INTO "CustomerReview" VALUES (3,'"Terrible quality."','2',3);
INSERT INTO "CustomerReview" VALUES (4,'"Poor packaging, half of the items arrived"','2',4);
INSERT INTO "CustomerReview" VALUES (5,'"Not satisfied, this product tastes awful."','3',5);
INSERT INTO "CustomerReview" VALUES (6,'"Mediocre performance, wouldn''t recommend it."','3',6);
INSERT INTO "CustomerReview" VALUES (7,'"Good value for the price, it does the job, but not exceptional."','4',7);
INSERT INTO "CustomerReview" VALUES (8,'"Good value for the price, it does the job, but not exceptional."','4',8);
INSERT INTO "CustomerReview" VALUES (9,'"Excellent product, works flawlessly."','5',9);
INSERT INTO "CustomerReview" VALUES (10,'"Excellent product, works flawlessly."','5',10);
INSERT INTO "CustomerReview" VALUES (11,'"Terrible quality, don''t waste your money."','1',11);
INSERT INTO "CustomerReview" VALUES (12,'"Terrible quality."','1',12);
INSERT INTO "CustomerReview" VALUES (13,'"Poor packaging, half of the items arrived"','2',13);
INSERT INTO "CustomerReview" VALUES (14,'"Terrible quality, don''t waste your money."','2',14);
INSERT INTO "CustomerReview" VALUES (15,'"Just average, it gets the job done, but nothing more."','3',15);
INSERT INTO "CustomerReview" VALUES (16,'"Decent product, but there''s room for improvement."','3',16);
INSERT INTO "CustomerReview" VALUES (17,'"Good value for the price, it does the job, but not exceptional."','4',17);
INSERT INTO "CustomerReview" VALUES (18,'"Good value for the price, it does the job, but not exceptional."','4',18);
INSERT INTO "CustomerReview" VALUES (19,'"Excellent electronic product, works flawlessly."','5',19);
INSERT INTO "CustomerReview" VALUES (20,'"Excellent electronic product, works flawlessly."','5',20);
INSERT INTO "DemandForecast" VALUES (1,'10','Oct 30, 2024','0.1',1);
INSERT INTO "DemandForecast" VALUES (2,'10','Aug 5, 2024','0.1',2);
INSERT INTO "DemandForecast" VALUES (3,'50','Mar 13, 2023','0.2',3);
INSERT INTO "DemandForecast" VALUES (4,'50','Nov 28, 2022','0.2',4);
INSERT INTO "DemandForecast" VALUES (5,'25','Jul 11, 2024','0.5',5);
INSERT INTO "DemandForecast" VALUES (6,'25','Mar 2, 2024','0.5',6);
INSERT INTO "DemandForecast" VALUES (7,'75','Feb 1, 2024','0.8',7);
INSERT INTO "DemandForecast" VALUES (8,'75','Jan 16, 2024','0.8',8);
INSERT INTO "DemandForecast" VALUES (9,'10','Aug 4, 2024','0.9',9);
INSERT INTO "DemandForecast" VALUES (10,'10','Jul 21, 2023','0.9',10);
INSERT INTO "DemandForecast" VALUES (11,'50','May 26, 2023','0.1',11);
INSERT INTO "DemandForecast" VALUES (12,'50','Dec 31, 2023','0.1',12);
INSERT INTO "DemandForecast" VALUES (13,'25','Oct 18, 2023','0.2',13);
INSERT INTO "DemandForecast" VALUES (14,'25','Apr 9, 2023','0.2',14);
INSERT INTO "DemandForecast" VALUES (15,'75','Aug 17, 2023','0.5',15);
INSERT INTO "DemandForecast" VALUES (16,'75','Oct 1, 2024','0.5',16);
INSERT INTO "DemandForecast" VALUES (17,'10','Jan 10, 2023','0.8',17);
INSERT INTO "DemandForecast" VALUES (18,'10','Oct 12, 2024','0.8',18);
INSERT INTO "DemandForecast" VALUES (19,'50','Dec 7, 2022','0.9',19);
INSERT INTO "DemandForecast" VALUES (20,'50','Mar 26, 2024','0.9',20);
INSERT INTO "Purchase" VALUES (1,'Oct 17, 2023',1,1);
INSERT INTO "Purchase" VALUES (2,'Sep 17, 2023',2,2);
INSERT INTO "Purchase" VALUES (3,'Jan 15, 2024',3,3);
INSERT INTO "Purchase" VALUES (4,'Jan 30, 2024',4,4);
INSERT INTO "Purchase" VALUES (5,'Aug 12, 2024',5,5);
INSERT INTO "Purchase" VALUES (6,'Jan 8, 2023',6,6);
INSERT INTO "Purchase" VALUES (7,'Jul 15, 2024',7,7);
INSERT INTO "Purchase" VALUES (8,'Nov 24, 2022',8,8);
INSERT INTO "Purchase" VALUES (9,'Jul 6, 2024',9,9);
INSERT INTO "Purchase" VALUES (10,'May 25, 2023',10,10);
INSERT INTO "Purchase" VALUES (11,'Jun 4, 2023',11,11);
INSERT INTO "Purchase" VALUES (12,'Aug 1, 2024',12,12);
INSERT INTO "Purchase" VALUES (13,'Jul 9, 2023',13,13);
INSERT INTO "Purchase" VALUES (14,'Apr 22, 2024',14,14);
INSERT INTO "Purchase" VALUES (15,'Oct 25, 2023',15,15);
INSERT INTO "Purchase" VALUES (16,'Sep 6, 2023',16,16);
INSERT INTO "Purchase" VALUES (17,'Jun 18, 2023',17,17);
INSERT INTO "Purchase" VALUES (18,'Jul 12, 2023',18,18);
INSERT INTO "Purchase" VALUES (19,'Dec 27, 2022',19,19);
INSERT INTO "Purchase" VALUES (20,'Oct 17, 2023',20,20);
COMMIT;
