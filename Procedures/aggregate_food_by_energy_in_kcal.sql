DELIMITER //

CREATE PROCEDURE aggregate_food_by_energy_in_kcal()
BEGIN
    DELETE FROM aggr_food_by_energy_kcal;

    INSERT INTO aggr_food_by_energy_kcal(fdc_id, data_type, description, food_category, protein_amount, carbo_amount, fat_amount, total_energy, protein_ratio, carbo_ratio, fat_ratio)
    WITH all_food as (
        SELECT distinct fdc_id, data_type, description, food_category
        FROM aggr_food_by_nutrient),
    food_conversion_factor as (
        SELECT
            fncf.fdc_id,
            fccf.protein_value,
            fccf.carbohydrate_value,
            fccf.fat_value
        FROM food_nutrient_conversion_factor fncf
        INNER JOIN food_calorie_conversion_factor fccf on fncf.id = fccf.food_nutrient_conversion_factor_id
    ),
    protein_kcal as(
        SELECT
            fdc_id,
            sum(amount) as protein_amount
        FROM aggr_food_by_nutrient af
        WHERE nutrient_name in ('Protein', 'Adjusted Protein')
        GROUP BY fdc_id),
    carbo_kcal as(
        SELECT
            fdc_id,
            sum(amount) as carbo_amount
        FROM aggr_food_by_nutrient af
        WHERE nutrient_name in ('Carbohydrate, by difference',
        'Carbohydrate, by summation',
        'Carbohydrate, other',
        'Carbohydrates')
        GROUP BY fdc_id),
    fat_kcal as (
        SELECT
            fdc_id,
            sum(amount) as fat_amount
        FROM aggr_food_by_nutrient
        WHERE nutrient_name in ('Total lipid (fat)',
        'Solids, non-fat',
        'Total fat (NLEA)',
        'Fatty acids, total trans',
        'Fatty acids, total saturated',
        'Fatty acids, other than 607-615, 617-621, 624-632, 652-654, 686-689)',
        'Fatty acids, total monounsaturated',
        'Fatty acids, total polyunsaturated',
        'Fatty acids, saturated, other',
        'Fatty acids, monounsat., other',
        'Fatty acids, polyunsat., other',
        'Fatty acids, total sat., NLEA',
        'Fatty acids, total monounsat., NLEA',
        'Fatty acids, total polyunsat., NLEA',
        'Fatty acids, total trans-monoenoic',
        'Fatty acids, total trans-dienoic',
        'Fatty acids, total trans-polyenoic'
        )
        GROUP BY fdc_id)

    SELECT
        aggr_nutrient_calorie.*,
        protein_amount+carbo_amount+fat_amount as total_energy,
        CASE
            WHEN (protein_amount+carbo_amount+fat_amount) != 0 THEN ROUND(protein_amount/(protein_amount+carbo_amount+fat_amount),2) end as protein_ratio,
        CASE
            WHEN (protein_amount+carbo_amount+fat_amount) != 0 THEN ROUND(carbo_amount/(protein_amount+carbo_amount+fat_amount),2) end as carbo_ratio,
        CASE
            WHEN (protein_amount+carbo_amount+fat_amount) != 0 THEN ROUND(fat_amount/(protein_amount+carbo_amount+fat_amount),2) end as fat_ratio
    FROM (
        SELECT
            af.fdc_id,
            af.data_type,
            af.description,
            af.food_category,
            ROUND(CASE
                WHEN fcf.protein_value != null or fcf.protein_value != 0 THEN pk.protein_amount*fcf.protein_value
                ELSE pk.protein_amount*4
            END, 2) as protein_amount,
            ROUND(CASE
                WHEN fcf.carbohydrate_value != null or fcf.carbohydrate_value != 0 THEN ck.carbo_amount*fcf.carbohydrate_value
                ELSE ck.carbo_amount*4
            END,2) AS carbo_amount,
            ROUND(CASE
                WHEN fcf.fat_value != null or fcf.fat_value != 0 THEN fk.fat_amount*fcf.fat_value
                ELSE fk.fat_amount*9
            END,2) AS fat_amount
        FROM all_food af
        LEFT JOIN protein_kcal pk on pk.fdc_id = af.fdc_id
        LEFT JOIN carbo_kcal ck on ck.fdc_id = af.fdc_id
        LEFT JOIN fat_kcal fk on fk.fdc_id = af.fdc_id
        LEFT JOIN food_conversion_factor fcf ON af.fdc_id = fcf.fdc_id
    ) as aggr_nutrient_calorie
    WHERE (protein_amount+carbo_amount+fat_amount) != null or (protein_amount+carbo_amount+fat_amount) != 0;
END //

DELIMITER ;


