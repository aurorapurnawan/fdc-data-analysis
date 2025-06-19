# Example of using ratio of protein:carbohydrate:fat = 40:40:20. Cater the ratio based on preferences
SELECT *,
  (
    (protein_ratio * 0.4 + carbo_ratio * 0.4 + fat_ratio * 0.2) /
    (SQRT(POW(protein_ratio, 2) + POW(carbo_ratio, 2) + POW(fat_ratio, 2)) *
     SQRT(POW(0.4, 2) + POW(0.4, 2) + POW(0.2, 2)))
  ) AS cosine_similarity
FROM aggr_food_by_energy_kcal
WHERE food_category = 'Cake, Cookie & Cupcake Mixes'
ORDER BY cosine_similarity DESC
LIMIT 10;