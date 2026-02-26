import pandas as pd

# Load dataset
df = pd.read_excel("data/raw/online_retail.xlsx")

# Basic checks
print("Shape:", df.shape)
print("\nHEAD:\n", df.head())

print("\nINFO:")
print(df.info())

print("\nMissing values:")
print(df.isna().sum().sort_values(ascending=False).head(10))

# Convert date
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

# Create revenue
df["Revenue"] = df["Quantity"] * df["UnitPrice"]

print("\nDescribe:")
print(df.describe())