CREATE TABLE agricultural_samples (
    fdc_id INT,
    acquisition_date DATE,
    market_class VARCHAR(255),
    treatment VARCHAR(255),
    state VARCHAR(255)
);

CREATE TABLE acquisition_samples (
    fdc_id_of_sample_food INT,
    fdc_id_of_acquisition_food INT
);

CREATE TABLE branded_food (
    fdc_id INT PRIMARY KEY,
    brand_owner VARCHAR(255),
    brand_name VARCHAR(255),
    subbrand_name VARCHAR(255),
    gtin_upc VARCHAR(50),
    ingredients TEXT,
    not_a_significant_source_of TEXT,
    serving_size INT,
    serving_size_unit VARCHAR(50),
    household_serving_fulltext TEXT,
    branded_food_category VARCHAR(255),
    data_source VARCHAR(255),
    package_weight VARCHAR(255),
    modified_date DATE,
    available_date DATE,
    market_country VARCHAR(255),
    discontinued_date DATE,
    preparation_state_code VARCHAR(50),
    trade_channel VARCHAR(255),
    short_description VARCHAR(255)
);

CREATE TABLE fndds_derivation (
    derivation_code VARCHAR(50) PRIMARY KEY,
    derivation_description TEXT
);

CREATE TABLE fndds_ingredient_nutrient_value (
    ingredient_code INT,
    Ingredient_description TEXT,
    nutrient_code INT,
    nutrient_value INT,
    nutrient_value_source VARCHAR(255),
    fdc_id INT,
    derivation_code VARCHAR(50),
    sr_addmod_year YEAR,
    foundation_year_acquired YEAR,
    start_date DATE,
    end_date DATE
);

CREATE TABLE food (
    fdc_id INT PRIMARY KEY,
    data_type VARCHAR(50),
    description TEXT,
    food_category_id VARCHAR(100),
    publication_date DATE
);

CREATE TABLE food_attribute (
    id INT PRIMARY KEY,
    fdc_id INT,
    seq_num INT,
    food_attribute_type_id INT,
    name VARCHAR(255),
    value VARCHAR(500)
);

CREATE TABLE food_attribute_type (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

CREATE TABLE food_calorie_conversion_factor (
    food_nutrient_conversion_factor_id INT PRIMARY KEY,
    protein_value DECIMAL(10,4),
    fat_value DECIMAL(10,4),
    carbohydrate_value DECIMAL(10,4)
);

CREATE TABLE food_category (
    id INT PRIMARY KEY,
    code VARCHAR(50),
    description TEXT
);

CREATE TABLE food_component (
    id INT PRIMARY KEY,
    fdc_id INT,
    name VARCHAR(255),
    pct_weight DECIMAL(10,4),
    is_refuse varchar(1),
    gram_weight DECIMAL(10,4),
    data_points INT,
    min_year_acquired YEAR
);

CREATE TABLE food_nutrient (
    id INT PRIMARY KEY,
    fdc_id INT,
    nutrient_id INT,
    amount BIGINT,
    data_points INT,
    derivation_id INT,
    min DECIMAL(10,4),
    max DECIMAL(10,4),
    median DECIMAL(10,4),
    loq VARCHAR(255),
    footnote TEXT,
    min_year_acquired YEAR,
    percent_daily_value DECIMAL(10,4)
);

CREATE TABLE food_nutrient_conversion_factor (
    id INT PRIMARY KEY,
    fdc_id INT
);

CREATE TABLE food_nutrient_derivation (
    id INT PRIMARY KEY,
    code VARCHAR(50),
    description TEXT
);

CREATE TABLE food_nutrient_source (
    id INT PRIMARY KEY,
    code VARCHAR(50),
    description TEXT
);

CREATE TABLE food_portion (
    id INT PRIMARY KEY,
    fdc_id INT,
    seq_num INT,
    amount BIGINT,
    measure_unit_id INT,
    portion_description TEXT,
    modifier VARCHAR(255),
    gram_weight DECIMAL(10,4),
    data_points INT,
    footnote TEXT,
    min_year_acquired YEAR
);

CREATE TABLE food_protein_conversion_factor (
    food_nutrient_conversion_factor_id INT PRIMARY KEY,
    value DECIMAL(10,4)
);

CREATE TABLE food_update_log_entry (
    fdc_id INT,
    description TEXT,
    fdc_publication_date DATE
);

CREATE TABLE foundation_food (
    fdc_id INT PRIMARY KEY,
    NDB_number VARCHAR(50),
    footnote TEXT
);

CREATE TABLE input_food (
    id INT PRIMARY KEY,
    fdc_id INT,
    fdc_id_of_input_food INT,
    seq_num INT,
    amount BIGINT,
    sr_code VARCHAR(50),
    sr_description TEXT,
    unit VARCHAR(50),
    portion_code VARCHAR(50),
    portion_description TEXT,
    gram_weight DECIMAL(10,4),
    retention_code VARCHAR(50)
);

CREATE TABLE lab_method (
    id INT PRIMARY KEY,
    description TEXT,
    technique VARCHAR(255)
);

CREATE TABLE lab_method_code (
    lab_method_id INT,
    code VARCHAR(100)
);

CREATE TABLE lab_method_nutrient (
    lab_method_id INT,
    nutrient_id INT
);

CREATE TABLE market_acquisition (
    fdc_id INT PRIMARY KEY,
    brand_description VARCHAR(255),
    expiration_date DATE,
    label_weight VARCHAR(50),
    location VARCHAR(255),
    acquisition_date DATE,
    sales_type VARCHAR(255),
    sample_lot_nbr VARCHAR(50),
    sell_by_date DATE,
    store_city VARCHAR(255),
    store_name VARCHAR(255),
    store_state VARCHAR(50),
    upc_code VARCHAR(50)
);

CREATE TABLE measure_unit (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE microbe (
    id INT PRIMARY KEY,
    foodid INT,
    method VARCHAR(255),
    microbe_code VARCHAR(50),
    min_value INT,
    max_value INT,
    uom VARCHAR(50)
);

CREATE TABLE nutrient (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    unit_name VARCHAR(50),
    nutrient_nbr VARCHAR(50),
    `rank` INT
);

CREATE TABLE retention_factor (
    id INT PRIMARY KEY,
    retention_code VARCHAR(50),
    food_group_code VARCHAR(50),
    retention_description TEXT
);

CREATE TABLE sample_food (
    fdc_id INT PRIMARY KEY
);

CREATE TABLE sr_legacy_food (
    fdc_id INT PRIMARY KEY,
    NDB_number VARCHAR(50)
);

CREATE TABLE sub_sample_food (
    fdc_id INT,
    fdc_id_of_sample_food INT
);

CREATE TABLE sub_sample_result (
    food_nutrient_id INT,
    adjusted_amount DECIMAL(10,4),
    lab_method_id INT,
    nutrient_name VARCHAR(255)
);

CREATE TABLE survey_fndds_food (
    fdc_id INT,
    food_code VARCHAR(50),
    wweia_category_code VARCHAR(50),
    start_date DATE,
    end_date DATE
);

CREATE TABLE wweia_food_category (
    wweia_food_category_code VARCHAR(50) PRIMARY KEY,
    wweia_food_category_description TEXT
);
