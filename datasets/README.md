# Datasets

This folder is intentionally structured like an enterprise data project.

Large generated CSV files are not committed by default because GitHub repositories should not store heavy raw data. Instead, datasets are generated locally using:

```bash
python src/generate_large_insurance_dataset.py
```

## Folder structure

```text
datasets/
├── raw/          # generated raw synthetic insurance data
├── processed/    # cleaned ETL output
└── sample/       # small sample files for quick inspection
```

## Generated datasets

| File | Description |
|---|---|
| customers.csv | synthetic insurance customers |
| policies.csv | automobile insurance policies |
| claims.csv | claims transactions |
| clean_customers.csv | cleaned customer table |
| clean_policies.csv | cleaned policy table |
| clean_claims.csv | cleaned claims fact input |
| claims_with_risk_scores.csv | claims enriched with risk scoring |
| risk_summary.csv | summary of risk segments |

## Data privacy note

The project uses synthetic data because real insurance claims data contains sensitive customer, policy and claims information.
