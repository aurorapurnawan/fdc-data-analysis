# Data Analysis Project – Food Data Central (FDC)

This project processes and analyzes nutritional data from the FDC (Food Data Central) API. It involves setting up a MySQL environment with appropriate tables, loading data, and executing SQL scripts for data aggregation and analysis.

---

## Project Structure

- `Aggregation Table/`: Scripts to generate aggregated summary tables.
- `Analysis/`: SQL scripts for FDC data analysis.
- `Installation/`: SQL scripts for table creation and data loading.
- `Procedures/`: SQL stored procedures serve as a pipeline that transforms raw tables into aggregated tables.

---

## Setup & Execution Steps

1. **Extract the data**  
   Download the dataset from the USDA FDC website:  
   [FDC CSV Dataset – 2025-04-24](https://fdc.nal.usda.gov/fdc-datasets/FoodData_Central_csv_2025-04-24.zip)

   Extract the `fdc.zip` file into this directory: `C:/ProgramData/MySQL/MySQL Server X.X/Uploads/`. This directory should contain the CSV files to be loaded into MySQL.

2. **Create database tables**  
   Run the `create_fdc_tables.sql` script in the `Installation/` folder to create the necessary database schema.

3. **Load the data**  
   Execute the `load_fdc_data.sql` script to import the extracted CSV data into MySQL.

4. **Create aggregated tables**  
   Run the scripts in the `Aggregation Tables/` folder:
   - `aggr_food_by_nutrient.sql`
   - `aggr_food_by_energy_kcal.sql`

5. **Create stored procedures**  
   Execute the following scripts from the `Procedures/` folder:
   - `aggregate_food_by_nutrient.sql`
   - `aggregate_food_by_energy_in_kcal.sql`

6. **Run backfill**  
   Call the stored procedures to perform the backfill:
   ```sql
   CALL aggregate_food_by_nutrient();
   CALL aggregate_food_by_energy_in_kcal();

## Analysis Queries

The `Analysis/` folder contains advanced SQL scripts for evaluating and comparing food items based on their nutrient composition. These queries provide deeper insights after the data has been processed.

### Included Scripts:
- **Top food by carbohydrate amount** – Lists foods with the highest carbohydrate content.
- **Top food by fat amount** – Lists foods with the highest fat content.
- **Top food by protein amount** – Lists foods with the highest protein content.
- **Similarity energy ratio (Cosine Similarity)** – Compares food items based on energy ratios using cosine similarity.
- **Similarity energy ratio (Euclidean Distance)** – Compares food items based on energy ratios using Euclidean distance.

These scripts are useful for nutrient comparison, food clustering, or building recommendation systems.

   