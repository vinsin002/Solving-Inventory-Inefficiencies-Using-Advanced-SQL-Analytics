-- Fill Products
INSERT INTO Products (product_id, category)
SELECT DISTINCT product_id, category
FROM Inventory_Staging
ON CONFLICT (product_id) DO NOTHING;

-- Fill Stores
INSERT INTO Stores (store_id, region)
SELECT DISTINCT store_id, region
FROM Inventory_Staging
ON CONFLICT (store_id, region) DO NOTHING;

-- Fill Inventory
INSERT INTO Inventory (
    date, store_id, region, product_id, inventory_level, units_sold, units_ordered, demand_forecast
)
SELECT
    date, store_id, region, product_id, inventory_level, units_sold, units_ordered, demand_forecast
FROM Inventory_Staging;

-- Fill Pricing
INSERT INTO Pricing (date, product_id, price, discount, competitor_pricing)
SELECT DISTINCT date, product_id, price, discount, competitor_pricing
FROM Inventory_Staging
ON CONFLICT (date, product_id) DO NOTHING;

-- Fill External_Factors
INSERT INTO External_Factors (
	date, store_id, region, weather_condition, holiday_promotion, seasonality
)
SELECT DISTINCT
	date, store_id, region, weather_condition, holiday_promotion, seasonality
FROM Inventory_Staging
ON CONFLICT (date, store_id, region) DO NOTHING;


DROP TABLE Inventory_Staging;

