import pandas as pd

# Load
df = pd.read_excel("data/raw/online_retail.xlsx")

# Create revenue
df["Revenue"] = df["Quantity"] * df["UnitPrice"]

# ========================
# CLEANING RULES
# ========================

# Remove missing customerID
df = df.dropna(subset=["CustomerID"])

# Remove negative quantity (returns)
df = df[df["Quantity"] > 0]

# Remove negative or zero price
df = df[df["UnitPrice"] > 0]

# Remove duplicates
df = df.drop_duplicates()

# Convert date
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

# ========================
# EXPORT CLEAN DATA
# ========================
df.to_csv("data/processed/clean_data.csv", index=False)

print("Cleaned shape:", df.shape)
print(df.head())