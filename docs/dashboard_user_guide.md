# Dashboard User Guide

## Purpose

This guide helps business users understand how to use the migrated insurance claims dashboards.

The dashboards are designed to simplify operational monitoring, improve KPI visibility, and reduce manual reporting effort.

---

# Executive Claims Dashboard

## What this dashboard shows

This dashboard provides a high-level overview of insurance claims activity.

Main metrics include:

- total claims
- total claim amount
- settlement amount
- SLA breach rate
- fraud suspected rate

---

## How to use filters

Users can filter the dashboard by:

- region
- claim type
- date range
- vehicle type
- claim status

Changing filters updates all KPI cards and charts automatically.

---

# Claims Operations Dashboard

## Purpose

This dashboard helps operational teams identify delayed claims and workload concentration.

## Recommended workflow

1. Filter by region
2. Identify overdue claims
3. Review claim type causing delays
4. Investigate open high-value claims

---

# Fraud Monitoring Dashboard

## Purpose

This dashboard highlights claims requiring additional review.

## Risk score interpretation

| Risk Segment | Meaning |
|---|---|
| Low Risk | Standard operational claim |
| Medium Risk | Claim requiring additional monitoring |
| High Risk | Claim requiring investigation or escalation |

---

# Migration Validation Dashboard

## Purpose

This dashboard validates whether migrated KPIs match the legacy reporting environment.

## Pass / Fail interpretation

| Status | Meaning |
|---|---|
| PASS | KPI values match expected tolerance |
| FAIL | KPI mismatch detected and requires review |

---

# Best Practices

- Always validate selected date filters before interpreting KPIs
- Review SLA breaches regularly to monitor operational performance
- Investigate unusual spikes in fraud indicators
- Use drill-through tables to inspect detailed claims records
- Avoid exporting excessive raw data when dashboard summaries already answer the business question

---

# Business Benefits

The migrated dashboards help business users:

- monitor claims performance faster
- reduce manual Excel reporting
- identify operational bottlenecks
- improve visibility of delayed claims
- validate reporting consistency after migration
- support faster operational decision-making
