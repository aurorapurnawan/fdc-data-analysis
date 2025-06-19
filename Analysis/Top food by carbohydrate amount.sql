SELECT *
FROM aggr_food_by_nutrient
WHERE nutrient_name in ('Carbohydrate, by difference',
        'Carbohydrate, by summation',
        'Carbohydrate, other',
        'Carbohydrates')
ORDER BY amount DESC