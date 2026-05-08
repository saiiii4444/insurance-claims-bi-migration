# Dashboard Specification - Insurance Claims BI Migration

## Purpose

This document defines the dashboard structure for the migrated BI environment. The dashboards are designed for claims managers, operational teams, risk analysts, and business leadership.

The objective is to make claims performance easier to monitor, reduce manual reporting, and provide reliable KPIs after migration from the legacy BI environment.

---

# Dashboard 1 - Executive Claims Overview

## Target Users

- Claims leadership
- Business managers
- Insurance operations directors

## Main Questions

- How many claims were registered?
- What is the total financial exposure?
- Are settlement costs increasing?
- Which regions need attention?

## KPI Cards

| KPI | Description |
|---|---|
| Total Claims | Number of claims registered |
| Total Claim Amount | Total estimated claim exposure |
| Total Settled Amount | Total paid amount |
| Average Settlement Days | Average time to close claims |
| SLA Breach Rate | Percentage of claims settled late |
| Fraud Suspected Rate | Percentage of claims flagged as risky |

## Suggested Visuals

- KPI card row for executive metrics
- Monthly claims trend line chart
- Claim amount by region bar chart
- Claim type distribution donut chart
- Top 10 high-value claims table

---

# Dashboard 2 - Claims Operations Monitoring

## Target Users

- Claims processing teams
- Operations analysts
- Regional managers

## Main Questions

- Which claims are delayed?
- Which regions have the highest workload?
- Which claim types take longest to settle?
- Where are bottlenecks happening?

## Suggested Visuals

- Average settlement days by claim type
- SLA breach rate by region
- Open claims aging table
- Claim status breakdown
- Overdue claims drill-through table

## Filters

- Region
- Claim type
- Claim status
- Claim date
- Vehicle type

---

# Dashboard 3 - Recours and Recovery Monitoring

## Target Users

- Recovery teams
- Finance teams
- Claims managers

## Main Questions

- How much recovery is expected?
- Which claims have third-party recovery potential?
- Which regions recover the most money?
- Which recovery cases remain unresolved?

## KPI Cards

| KPI | Description |
|---|---|
| Total Recovery Amount | Total amount recovered or expected |
| Recovery Rate | Recovery amount divided by settlement amount |
| Open Recours Cases | Recovery cases still pending |
| Average Recovery Days | Time taken to recover money |

## Suggested Visuals

- Recovery amount by region
- Recovery rate by claim type
- Open recovery cases table
- Monthly recovery trend

---

# Dashboard 4 - Fraud and Risk Monitoring

## Target Users

- Risk analysts
- Claims audit teams
- Business control teams

## Main Questions

- Which claims need investigation?
- Which claim types carry higher risk?
- Which customers have repeated suspicious claims?
- What is the financial exposure of high-risk claims?

## Suggested Visuals

- High-risk claims table
- Risk score distribution
- Fraud suspected rate by claim type
- Claim amount vs risk score scatter plot
- Repeated claims by customer

---

# Dashboard 5 - Migration Validation Dashboard

## Target Users

- BI migration team
- Product owners
- Business testers
- Data analysts

## Main Questions

- Do old and new KPI values match?
- Which KPI failed validation?
- Are dashboards loading faster after migration?
- Which dashboard requires correction before release?

## KPI Cards

| KPI | Description |
|---|---|
| KPI Parity Rate | Share of KPIs passing validation |
| Failed KPI Count | Number of KPIs with mismatch |
| Average Load Time | Dashboard performance metric |
| Critical Defects | Blocking migration issues |

## Suggested Visuals

- KPI comparison table
- Pass/fail status chart
- Dashboard load-time before vs after
- Defect severity matrix

---

# Design Principles

- Keep KPI definitions consistent with legacy dashboards
- Use filters that business users already understand
- Avoid overloaded visuals
- Prioritize operational decisions over decorative charts
- Display exceptions clearly: delayed claims, failed KPIs, high-risk claims

---

# Business Value

The migrated dashboard layer helps the insurance team:

- reduce manual Excel reporting
- improve claims monitoring
- detect delays faster
- validate migration quality
- support better operational decisions
- improve user trust in migrated BI applications
