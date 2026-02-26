import pandas as pd

# Load clean data
df = pd.read_csv("data/processed/clean_data.csv")

# ========================
# KPIs
# ========================
total_revenue = df["Revenue"].sum()
total_orders = df["InvoiceNo"].nunique()
total_customers = df["CustomerID"].nunique()
avg_order_value = total_revenue / total_orders

print("Total Revenue:", round(total_revenue, 2))
print("Total Orders:", total_orders)
print("Total Customers:", total_customers)
print("Average Order Value:", round(avg_order_value, 2))

# ========================
# Top countries
# ========================
top_countries = df.groupby("Country")["Revenue"].sum().sort_values(ascending=False).head(10)
print("\nTop Countries:\n", top_countries)

# ========================
# Top products
# ========================
top_products = df.groupby("Description")["Revenue"].sum().sort_values(ascending=False).head(10)
print("\nTop Products:\n", top_products)

# ========================
# Monthly trend
# ========================
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])
df["Month"] = df["InvoiceDate"].dt.to_period("M")

monthly_sales = df.groupby("Month")["Revenue"].sum()
print("\nMonthly Trend:\n", monthly_sales.head())