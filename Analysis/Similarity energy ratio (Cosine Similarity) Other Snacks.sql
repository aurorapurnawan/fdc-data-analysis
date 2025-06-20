# Example of using ratio of protein:carbohydrate:fat = 30:50:20. Cater the ratio based on preferences
SELECT *,
  (
    (protein_ratio * 0.3 + carbo_ratio * 0.5 + fat_ratio * 0.2) /
    (SQRT(POW(protein_ratio, 2) + POW(carbo_ratio, 2) + POW(fat_ratio, 2)) *
     SQRT(POW(0.3, 2) + POW(0.5, 2) + POW(0.2, 2)))
  ) AS cosine_similarity
FROM aggr_food_by_energy_kcal
WHERE food_category = 'Other Snacks'
ORDER BY cosine_similarity DESC
LIMIT 10;