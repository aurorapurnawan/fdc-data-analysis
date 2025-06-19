SELECT *
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
ORDER BY amount DESC