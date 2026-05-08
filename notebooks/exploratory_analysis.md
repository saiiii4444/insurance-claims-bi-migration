# Exploratory Data Analysis Notes

## Objectives

- understand claims distribution
- analyze operational bottlenecks
- detect abnormal claims patterns
- validate data quality before warehouse loading
- identify migration-sensitive KPIs

---

# Example Exploratory Questions

## Claims volume

- Which regions generate highest claims volume?
- Which months contain seasonal peaks?

## Settlement behavior

- Which claim types exceed SLA most often?
- Which claims remain open longest?

## Fraud indicators

- Are high-value claims more likely to be suspicious?
- Do repeated claims appear in short periods?

---

# Example Visualizations

- monthly claims trend
- settlement days distribution
- fraud rate by claim type
- claim amount histogram
- SLA breach heatmap by region

---

# Key Analytical Findings

1. Collision claims generate highest operational workload.
2. High-value claims correlate with longer review periods.
3. Dashboard performance degrades when raw transactional queries are used directly.
4. Aggregated marts improve dashboard responsiveness significantly.
