CREATE TABLE Products (
  product_id VARCHAR(10) PRIMARY KEY,
  category VARCHAR(50)
);

CREATE TABLE Stores (
  store_id VARCHAR(10),
  region VARCHAR(50),
  PRIMARY KEY (store_id, region)
);

CREATE TABLE Inventory (
  inventory_id SERIAL PRIMARY KEY,
  date DATE,
  store_id VARCHAR(10),
  region VARCHAR(50),
  product_id VARCHAR(10),
  inventory_level INT,
  units_sold INT,
  units_ordered INT,
  demand_forecast FLOAT,
  FOREIGN KEY (store_id, region) REFERENCES Stores (store_id, region),
  FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

CREATE TABLE Pricing (
  date DATE,
  product_id VARCHAR(10),
  price FLOAT,
  discount INT,
  competitor_pricing FLOAT,
  PRIMARY KEY (date, product_id),
  FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

CREATE TABLE External_Factors (
  date DATE,
  store_id VARCHAR(10),
  region VARCHAR(50),
  weather_condition VARCHAR(20),
  holiday_promotion BOOLEAN,
  seasonality VARCHAR(20),
  PRIMARY KEY (date, store_id, region),
  FOREIGN KEY (store_id, region) REFERENCES Stores (store_id, region)
);

CREATE TABLE Inventory_Staging (
    date DATE,
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    category VARCHAR(50),
    region VARCHAR(50),
    inventory_level INT,
    units_sold INT,
    units_ordered INT,
    demand_forecast FLOAT,
    price FLOAT,
    discount INT,
    weather_condition VARCHAR(50),
    holiday_promotion BOOLEAN,
    competitor_pricing FLOAT,
    seasonality VARCHAR(20)
);

