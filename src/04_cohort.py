import pandas as pd

# Load clean data
df = pd.read_csv("data/processed/clean_data.csv")

df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

# Cohort month
df["InvoiceMonth"] = df["InvoiceDate"].dt.to_period("M")

# First purchase
df["CohortMonth"] = df.groupby("CustomerID")["InvoiceMonth"].transform("min")

# Cohort index
df["CohortIndex"] = (df["InvoiceMonth"] - df["CohortMonth"]).apply(lambda x: x.n)

# Cohort table
cohort = df.groupby(["CohortMonth", "CohortIndex"])["CustomerID"].nunique().unstack(0)

print(cohort.head())

# Export
import os
os.makedirs("data/analytics", exist_ok=True)
cohort.to_csv("data/analytics/cohort_table.csv")