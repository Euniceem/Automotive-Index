CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars OWNER indexed_cars_user;
\c 'indexed_cars';

SELECT COUNT(*) FROM car_models; 

SELECT DISTINCT make_title FROM car_models WHERE make_code ~ 'LAM';
-- 1 result
SELECT DISTINCT model_title FROM car_models WHERE make_code ~ 'NISSAN' AND model_code ~ 'GT-R';
-- 1 result
SELECT DISTINCT COUNT(model_title) FROM car_models WHERE make_code ~ 'LAM';
-- 1360 rows
SELECT DISTINCT COUNT(*) FROM car_models WHERE year BETWEEN 2010 AND 2015;
-- 78840 rows
SELECT DISTINCT COUNT(*) FROM car_models WHERE year = 2010;
-- 13140 rows

CREATE INDEX title_car 
  ON car_models (make_title);

SELECT DISTINCT make_title FROM car_models WHERE make_code ~ 'LAM';
DROP INDEX title_car;

CREATE INDEX model_title_class
  ON car_models (model_title);

SELECT DISTINCT model_title FROM car_models WHERE make_code ~ 'NISSAN' AND model_code ~ 'GT-R';
SELECT DISTINCT COUNT(model_title) FROM car_models WHERE make_code ~ 'LAM';
DROP INDEX model_title_class;

CREATE INDEX car_model_year
  ON car_models (year);

SELECT DISTINCT COUNT(*) FROM car_models WHERE year BETWEEN 2010 AND 2015;
SELECT DISTINCT COUNT(*) FROM car_models WHERE year = 2010;
DROP INDEX car_model_year;

