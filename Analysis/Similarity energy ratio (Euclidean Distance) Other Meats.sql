# Example of using ratio of protein:carbohydrate:fat = 60:30:10. Cater the ratio based on preferences
SELECT *,
  SQRT(
    POW(protein_ratio - 0.6, 2) +
    POW(carbo_ratio - 0.3, 2) +
    POW(fat_ratio - 0.1, 2)
  ) AS distance_to_target
FROM aggr_food_by_energy_kcal
WHERE food_category = 'Other Meats'
ORDER BY distance_to_target ASC
LIMIT 10;