SELECT *
FROM aggr_food_by_nutrient
WHERE nutrient_name in ('Protein', 'Adjusted Protein')
ORDER BY amount DESC