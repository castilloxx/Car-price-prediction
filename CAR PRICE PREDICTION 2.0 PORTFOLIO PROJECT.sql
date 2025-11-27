CREATE TABLE car_price_prediction_staging
LIKE car_price_prediction_;

SELECT *
FROM car_price_prediction_staging;

INSERT car_price_prediction_staging
SELECT *
FROM car_price_prediction_;

SELECT
  SUM(Car_id IS NULL) AS Car_id_null,
  SUM(brand IS NULL OR brand='') AS brand_null,
  SUM(model IS NULL OR model='') AS model_null,
  SUM(year IS NULL) AS year_null,
  SUM(engine_size IS NULL) AS engine_size_null,
  SUM(fuel_type IS NULL) AS fuel_type_null,
  SUM(transmission IS NULL) AS transmission_null,
  SUM(mileage IS NULL) AS mileage_null,
  SUM(`condition` IS NULL OR `condition`='') AS condition_null,
  SUM(price IS NULL) AS price_null
FROM car_price_prediction_staging;

SHOW COLUMNS FROM car_price_prediction_staging;

ALTER TABLE car_price_prediction_staging
  CHANGE COLUMN `Car ID` car_id INT NOT NULL PRIMARY KEY;
  
  ALTER TABLE car_price_prediction_staging
  CHANGE COLUMN `Engine Size` engine_size INT NOT NULL;
  
  ALTER TABLE car_price_prediction_staging
  CHANGE COLUMN `Fuel Type` fuel_type varchar(50) NOT NULL;

SELECT
  SUM(Car_id IS NULL) AS Car_id_null,
  SUM(brand IS NULL OR brand='') AS brand_null,
  SUM(model IS NULL OR model='') AS model_null,
  SUM(year IS NULL) AS year_null,
  SUM(engine_size IS NULL) AS engine_size_null,
  SUM(fuel_type IS NULL) AS fuel_type_null,
  SUM(transmission IS NULL) AS transmission_null,
  SUM(mileage IS NULL) AS mileage_null,
  SUM(`condition` IS NULL OR `condition`='') AS condition_null,
  SUM(price IS NULL) AS price_null
FROM car_price_prediction_staging;

SELECT * 
FROM car_price_prediction_staging
WHERE price <= 0 OR mileage < 0 OR engine_size <= 0 OR year < 1900 OR year > YEAR(CURDATE())+1
LIMIT 50;

SELECT brand, 
COUNT(*) AS count
FROM car_price_prediction_staging
GROUP BY brand
ORDER BY count DESC;

UPDATE car_price_prediction_staging
SET brand = TRIM(LOWER(brand)),
    model = TRIM(model),
    fuel_type = TRIM(LOWER(fuel_type)),
    transmission = TRIM(LOWER(transmission)),
    `condition` = TRIM(LOWER(`condition`));
    
    SET SQL_SAFE_UPDATES = 0;

UPDATE car_price_prediction_staging
SET brand = TRIM(LOWER(brand)),
    model = TRIM(model),
    fuel_type = TRIM(LOWER(fuel_type)),
    transmission = TRIM(LOWER(transmission)),
    `condition` = TRIM(LOWER(`condition`));

-- Optional: turn safe updates back on
SET SQL_SAFE_UPDATES = 1;

select *
FROM car_price_prediction_staging;

ALTER TABLE car_price_prediction_staging ADD COLUMN age SMALLINT;
UPDATE car_price_prediction_staging SET age = YEAR(CURDATE()) - year;

ALTER TABLE car_price_prediction_staging
ADD COLUMN price_bucket VARCHAR(20);

UPDATE car_price_prediction_staging
SET price_bucket = CASE
  WHEN price < 5000 THEN 'budget'
  WHEN price BETWEEN 5000 AND 20000 THEN 'mid'
  ELSE 'premium'
END;

SELECT brand, COUNT(*) AS n, AVG(price) AS avg_price
FROM car_price_prediction_staging
GROUP BY brand
ORDER BY avg_price DESC;

SELECT brand, year, AVG(price) AS avg_price, COUNT(*) AS n
FROM car_price_prediction_staging
GROUP BY brand, year
ORDER BY brand, year;

SELECT price, mileage 
FROM car_price_prediction_staging 
WHERE price IS NOT NULL AND mileage IS NOT NULL;

SELECT `condition`, COUNT(*) AS n, AVG(price) AS avg_price
FROM car_price_prediction_staging
GROUP BY `condition`
ORDER BY avg_price DESC;

SELECT brand, model, COUNT(*) AS cnt, AVG(price) AS avg_price
FROM car_price_prediction_staging
GROUP BY brand, model
ORDER BY cnt DESC
LIMIT 30;




