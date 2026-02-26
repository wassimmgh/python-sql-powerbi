import pandas as pd

# Load clean data
df = pd.read_csv("data/processed/clean_data.csv")

df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

# Reference date
snapshot_date = df["InvoiceDate"].max() + pd.Timedelta(days=1)

# RFM metrics
rfm = df.groupby("CustomerID").agg({
    "InvoiceDate": lambda x: (snapshot_date - x.max()).days,
    "InvoiceNo": "nunique",
    "Revenue": "sum"
})

rfm.columns = ["Recency", "Frequency", "Monetary"]

# Score with quantiles
rfm["R_score"] = pd.qcut(rfm["Recency"], 5, labels=[5,4,3,2,1])
rfm["F_score"] = pd.qcut(rfm["Frequency"].rank(method="first"), 5, labels=[1,2,3,4,5])
rfm["M_score"] = pd.qcut(rfm["Monetary"], 5, labels=[1,2,3,4,5])

rfm["RFM_score"] = rfm["R_score"].astype(str) + rfm["F_score"].astype(str) + rfm["M_score"].astype(str)

print(rfm.head())

# Export
rfm.to_csv("data/analytics/rfm_table.csv")