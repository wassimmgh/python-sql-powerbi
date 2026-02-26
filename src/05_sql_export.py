import pandas as pd
from sqlalchemy import create_engine

# Load clean data
df = pd.read_csv("data/processed/clean_data.csv")

# SQLite database
engine = create_engine("sqlite:///data/analytics/ecommerce.db")

# Export fact table
df.to_sql("fact_sales", engine, if_exists="replace", index=False)

# Dimension tables
customers = df[["CustomerID", "Country"]].drop_duplicates()
customers.to_sql("dim_customers", engine, if_exists="replace", index=False)

products = df[["StockCode", "Description"]].drop_duplicates()
products.to_sql("dim_products", engine, if_exists="replace", index=False)

print("Tables exported to SQLite")