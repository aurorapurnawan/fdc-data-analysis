create table aggr_food_by_energy_kcal
(
    fdc_id           int          not null ,
    data_type        varchar(50)  null,
    description      text         null,
    food_category    varchar(100) null,
    protein_amount   int          null,
    carbo_amount     int          null,
    fat_amount       int          null,
    total_energy     int          null,
    protein_ratio    float        null,
    carbo_ratio      float        null,
    fat_ratio        float        null
);

CREATE INDEX idx_data_type_food_category
ON aggr_food_by_energy_kcal (data_type, food_category);

CREATE INDEX idx_data_type
ON aggr_food_by_energy_kcal (data_type);

CREATE INDEX idx_food_category
ON aggr_food_by_energy_kcal (food_category);