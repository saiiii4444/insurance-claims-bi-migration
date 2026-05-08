# Data Dictionary

## dim_customers

| Column | Description |
|---|---|
| customer_id | Unique identifier for each customer |
| customer_name | Customer full name |
| age | Customer age |
| region | Customer region/location |
| annual_income | Estimated annual income |
| signup_date | Date customer joined insurance services |

---

## dim_policies

| Column | Description |
|---|---|
| policy_id | Unique insurance policy identifier |
| customer_id | Associated customer |
| vehicle_type | Insured vehicle category |
| premium_amount | Annual premium amount |
| policy_status | Active or expired policy |
| policy_start_date | Policy activation date |

---

## fact_claims

| Column | Description |
|---|---|
| claim_id | Unique claim identifier |
| policy_id | Associated insurance policy |
| claim_type | Type of insurance claim |
| claim_amount | Estimated claim amount |
| claim_status | Current claim processing status |
| claim_date | Date claim was registered |
| settlement_date | Date claim was settled |
| settlement_days | Number of days to settle claim |
| fraud_flag | Indicates suspicious claim behavior |
| sla_breach_flag | Indicates SLA violation |
| risk_score | Rule-based operational risk score |
| risk_segment | Low, Medium or High risk category |

---

# KPI Definitions

## Total Claims

Definition:

> Count of unique claims registered during selected reporting period.

---

## Total Claim Amount

Definition:

> Sum of estimated claim amounts before settlement.

---

## Average Settlement Days

Definition:

> Average number of days between claim registration and settlement.

---

## SLA Breach Rate

Definition:

> Percentage of claims exceeding the operational settlement target.

---

## Fraud Suspected Rate

Definition:

> Percentage of claims marked with suspicious or abnormal behavior indicators.
