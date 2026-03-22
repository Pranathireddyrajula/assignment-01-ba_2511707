## ETL Decisions

### Decision 1 — Standardizing Inconsistent Date Formats

Problem: The 'date' column in retail_transactions.csv had three different formats mixed across rows. Some rows used 'DD/MM/YYYY (e.g., 29/08/2023), some used DD-MM-YYYY (e.g., 20-02-2023), and others used the ISO standard YYYY-MM-DD (e.g., 2023-02-05). This means the same column had completely different structures depending on which row you looked at, making it impossible to sort or compare dates reliably.

Resolution: All dates were converted to the ISO standard format YYYY-MM-DD before loading into the warehouse. This is the format MySQL's DATE type expects, and it makes sorting and filtering by month or year straightforward. The 'date_id' in dim_date is stored as an integer in YYYYMMDD format (e.g., 20230809) so it can be used as a fast lookup key in the fact table.


### Decision 2 — Normalizing Inconsistent Category Values

Problem: The category column had 5 distinct values for what should have been 3 categories. Electronics appeared as both electronics (lowercase) and 'Electronics' (title case). Groceries appeared as both Grocery (singular) and 'Groceries' (plural). This means a simple GROUP BY on category would return 5 groups instead of 3, breaking any reporting that aggregates by category.

Resolution: All category values were standardized to title case with a consistent spelling before loading into dim_product. The mapping applied was: electronics to Electronics, Grocery to Groceries. Now the category column has exactly 3 values: Electronics, Clothing, and Groceries.

---

### Decision 3 — Filling NULL Values in store_city

Problem: 19 rows in the raw data had NULL values in the 'store_city' column. Without a city, store-level location analysis would be incomplete or misleading. However, the 'store_name'column was always populated, and each store name maps to exactly one city (e.g., "Mumbai Central" is always in Mumbai, "Chennai Anna" is always in Chennai).

Resolution: The NULL city values were filled by looking up the correct city from the store name before loading into dim_store. Since each store has a fixed location, this is a safe and accurate fill — not a guess. The mapping used was: Mumbai Central to Mumbai, Chennai Anna to Chennai, Delhi South to Delhi, Pune FC Road to Pune, Bangalore MG to Bangalore. The dim_store table now has no NULL values.