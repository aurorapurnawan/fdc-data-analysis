-- SQL Scripts to load all CSV files into respective tables

-- Before execute these queries, please make sure the FDC data is in MySQL Uploads directory

-- 1. Load agricultural_samples
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/agricultural_samples.csv'
INTO TABLE agricultural_samples
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, acquisition_date, market_class, treatment, state);

-- 2. Load acquisition_samples
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/acquisition_samples.csv'
INTO TABLE acquisition_samples
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id_of_sample_food, fdc_id_of_acquisition_food);

-- 3. Load branded_food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/branded_food.csv'
INTO TABLE branded_food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, brand_owner, brand_name, subbrand_name, gtin_upc, ingredients, not_a_significant_source_of,
@serving_size, serving_size_unit, household_serving_fulltext, branded_food_category, data_source,
package_weight, @modified_date, @available_date, market_country, @discontinued_date,
preparation_state_code, trade_channel, short_description, @abc)
SET discontinued_date = NULLIF(@discontinued_date, ''),
modified_date = NULLIF(@modified_date, ''),
available_date = NULLIF(@available_date, ''),
serving_size = NULLIF(@serving_size, '');

-- 4. Load fndds_derivation
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/fndds_derivation.csv'
INTO TABLE fndds_derivation
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(derivation_code, derivation_description);

-- 5. Load fndds_ingredient_nutrient_value
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/fndds_ingredient_nutrient_value.csv'
INTO TABLE fndds_ingredient_nutrient_value
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ingredient_code, Ingredient_description, nutrient_code, nutrient_value, nutrient_value_source,
@fdc_id, derivation_code, @sr_addmod_year, foundation_year_acquired, start_date, end_date)
SET sr_addmod_year = NULLIF(@sr_addmod_year,''),
fdc_id = NULLIF(@fdc_id,'');

-- 6. Load food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food.csv'
INTO TABLE food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, data_type, description, food_category_id, publication_date);

-- 7. Load food_attribute
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_attribute.csv'
INTO TABLE food_attribute
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, fdc_id, @seq_num, @food_attribute_type_id, name, value)
SET seq_num = NULLIF(@seq_num, ''),
food_attribute_type_id = NULLIF(@food_attribute_type_id, '');

-- 8. Load food_attribute_type
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_attribute_type.csv'
INTO TABLE food_attribute_type
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, name, description);

-- 9. Load food_calorie_conversion_factor
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_calorie_conversion_factor.csv'
INTO TABLE food_calorie_conversion_factor
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(food_nutrient_conversion_factor_id, @protein_value, @fat_value, @carbohydrate_value)
SET protein_value = NULLIF(@protein_value, ''),
fat_value = NULLIF(@protein_value, ''),
carbohydrate_value = NULLIF(@carbohydrate_value, '');

-- 10. Load food_category
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_category.csv'
INTO TABLE food_category
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, code, description);

-- 11. Load food_component
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_component.csv'
INTO TABLE food_component
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, fdc_id, name, @pct_weight, is_refuse, gram_weight, data_points, @min_year_acquired)
SET pct_weight = NULLIF(@pct_weight, ''),
    min_year_acquired = NULLIF(@min_year_acquired, '');

-- 12. Load food_nutrient
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_nutrient.csv'
INTO TABLE food_nutrient
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, fdc_id, nutrient_id, amount, @data_points, @derivation_id, @min, @max, @median, loq, footnote, @min_year_acquired, @percent_daily_value)
SET data_points = NULLIF(@data_points, ''),
derivation_id = NULLIF(@derivation_id, ''),
min = NULLIF(@min, ''),
max = NULLIF(@max, ''),
median = NULLIF(@median, ''),
min_year_acquired = NULLIF(@min_year_acquired, ''),
percent_daily_value = NULLIF(@percent_daily_value, '');

-- 13. Load food_nutrient_conversion_factor
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_nutrient_conversion_factor.csv'
INTO TABLE food_nutrient_conversion_factor
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, fdc_id);

-- 14. Load food_nutrient_derivation
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_nutrient_derivation.csv'
INTO TABLE food_nutrient_derivation
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, code, description);

-- 15. Load food_nutrient_source
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_nutrient_source.csv'
INTO TABLE food_nutrient_source
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, code, description);

-- 16. Load food_portion
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_portion.csv'
INTO TABLE food_portion
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, fdc_id, @seq_num, @amount, measure_unit_id, portion_description, modifier, gram_weight, @data_points, footnote, @min_year_acquired)
SET seq_num = NULLIF(@seq_num, ''),
    amount = NULLIF(@amount, ''),
    data_points = NULLIF(@data_points, ''),
    min_year_acquired = NULLIF(@min_year_acquired, '');

-- 17. Load food_protein_conversion_factor
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_protein_conversion_factor.csv'
INTO TABLE food_protein_conversion_factor
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(food_nutrient_conversion_factor_id, value);

-- 18. Load food_update_log_entry
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/food_update_log_entry.csv'
INTO TABLE food_update_log_entry
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, description, fdc_publication_date);

-- 19. Load foundation_food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/foundation_food.csv'
INTO TABLE foundation_food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, NDB_number, footnote);

-- 20. Load input_food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/input_food.csv'
INTO TABLE input_food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, fdc_id, @fdc_id_of_input_food, seq_num, amount, sr_code, sr_description, unit, portion_code, portion_description, gram_weight, retention_code)
SET fdc_id_of_input_food = NULLIF(@fdc_id_of_input_food, '');

-- 21. Load lab_method
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/lab_method.csv'
INTO TABLE lab_method
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, description, technique);

-- 22. Load lab_method_code
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/lab_method_code.csv'
INTO TABLE lab_method_code
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(lab_method_id, code);

-- 23. Load lab_method_nutrient
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/lab_method_nutrient.csv'
INTO TABLE lab_method_nutrient
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(lab_method_id, nutrient_id);

-- 24. Load market_acquisition
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/market_acquisition.csv'
INTO TABLE market_acquisition
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, brand_description, @expiration_date, label_weight, location, @acquisition_date, sales_type, sample_lot_nbr, @sell_by_date, store_city, store_name, store_state, upc_code)
SET acquisition_date = NULLIF(@acquisition_date, ''),
    expiration_date = NULLIF(@expiration_date, ''),
    sell_by_date = NULLIF(@sell_by_date, '');

-- 25. Load measure_unit
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/measure_unit.csv'
INTO TABLE measure_unit
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, name);

-- 26. Load microbe
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/microbe.csv'
INTO TABLE microbe
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, foodid, method, microbe_code, min_value, @max_value, uom)
SET max_value = nullif(@max_value, '');

-- 27. Load nutrient
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/nutrient.csv'
INTO TABLE nutrient
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, name, unit_name, nutrient_nbr, @`rank`)
SET `rank` = NULLIF(@`rank`, '');

-- 28. Load retention_factor
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/retention_factor.csv'
INTO TABLE retention_factor
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, retention_code, food_group_code, retention_description);

-- 29. Load sample_food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/sample_food.csv'
INTO TABLE sample_food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id);

-- 30. Load sr_legacy_food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/sr_legacy_food.csv'
INTO TABLE sr_legacy_food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, NDB_number);

-- 31. Load sub_sample_food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/sub_sample_food.csv'
INTO TABLE sub_sample_food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, fdc_id_of_sample_food);

-- 32. Load sub_sample_result
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/sub_sample_result.csv'
INTO TABLE sub_sample_result
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(food_nutrient_id, @adjusted_amount, lab_method_id, nutrient_name)
SET adjusted_amount = NULLIF(@adjusted_amount, '');

-- 33. Load survey_fndds_food
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/survey_fndds_food.csv'
INTO TABLE survey_fndds_food
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(fdc_id, food_code, wweia_category_code, start_date, end_date);

-- 34. Load wweia_food_category
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/fdc/wweia_food_category.csv'
INTO TABLE wweia_food_category
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(wweia_food_category_code, wweia_food_category_description);