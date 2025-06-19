CREATE TABLE aggr_food_by_nutrient (
    fdc_id INT,
    data_type VARCHAR(50),
    description TEXT,
    food_category VARCHAR(100),
    nutrient_name VARCHAR(255),
    amount BIGINT,
    unit_name VARCHAR(10)
);

CREATE INDEX idx_nutrient_name ON aggr_food_by_nutrient(nutrient_name);
