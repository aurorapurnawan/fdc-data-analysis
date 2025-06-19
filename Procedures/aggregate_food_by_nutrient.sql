create procedure aggregate_food_by_nutrient()
BEGIN
    -- First, delete today's existing aggregation to avoid duplicates
    DELETE FROM aggr_food_by_nutrient;

    -- Now insert the aggregated data
    INSERT INTO aggr_food_by_nutrient (fdc_id, data_type, description, food_category, nutrient_name, amount, unit_name)
    WITH nutrient_percentage as(
    SELECT
        f.fdc_id,
        sum(amount) as total_nutrient
    FROM food f
    JOIN food_nutrient fn on f.fdc_id = fn.fdc_id
    JOIN nutrient n on n.id = fn.nutrient_id
    GROUP BY fdc_id
)

SELECT
    f.fdc_id,
    f.data_type,
    f.description,
    CASE
        WHEN f.data_type != 'branded_food' then fc.description
        ELSE f.food_category_id
    END as food_category,
    n.name as nutrient_name,
    fn.amount,
    n.unit_name
FROM food f
JOIN food_nutrient fn ON f.fdc_id = fn.fdc_id
JOIN nutrient n ON fn.nutrient_id = n.id
JOIN nutrient_percentage np on f.fdc_id = np.fdc_id
LEFT JOIN food_category fc on f.data_type!= 'branded_food' and f.food_category_id = fc.id
ORDER BY fn.amount DESC;
END;

