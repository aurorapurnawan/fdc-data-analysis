# Example of using ratio of protein:carbohydrate:fat = 60:30:10. Cater the ratio based on preferences
SELECT *,
  (
    (protein_ratio * 0.6 + carbo_ratio * 0.3 + fat_ratio * 0.1) /
    (SQRT(POW(protein_ratio, 2) + POW(carbo_ratio, 2) + POW(fat_ratio, 2)) *
     SQRT(POW(0.6, 2) + POW(0.3, 2) + POW(0.1, 2)))
  ) AS cosine_similarity
FROM aggr_food_by_energy_kcal
WHERE food_category = 'Other Meats'
ORDER BY cosine_similarity DESC
LIMIT 10;