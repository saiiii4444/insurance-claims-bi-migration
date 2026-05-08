-- =========================================================
-- Warehouse Transformation Script
-- Project: Insurance Claims BI Migration
-- Purpose: Convert cleaned staging tables into BI-ready facts, dimensions and KPI marts
-- SQL dialect: SQL Server style
-- =========================================================

-- 1. Customer Dimension
INSERT INTO dim_customers (
    customer_id,
    customer_name,
    age,
    region,
    annual_income,
    signup_date
)
SELECT DISTINCT
    customer_id,
    customer_name,
    age,
    region,
    annual_income,
    signup_date
FROM stg_customers;

-- 2. Policy Dimension
INSERT INTO dim_policies (
    policy_id,
    customer_id,
    vehicle_type,
    premium_amount,
    policy_status,
    policy_start_date
)
SELECT DISTINCT
    policy_id,
    customer_id,
    vehicle_type,
    premium_amount,
    policy_status,
    policy_start_date
FROM stg_policies;

-- 3. Claims Fact Table
INSERT INTO fact_claims (
    claim_id,
    policy_id,
    claim_type,
    claim_amount,
    claim_status,
    claim_date,
    settlement_date,
    settlement_days,
    fraud_flag,
    sla_breach_flag
)
SELECT
    claim_id,
    policy_id,
    claim_type,
    claim_amount,
    claim_status,
    claim_date,
    settlement_date,
    DATEDIFF(DAY, claim_date, settlement_date) AS settlement_days,
    fraud_flag,
    CASE
        WHEN DATEDIFF(DAY, claim_date, settlement_date) > 30 THEN 1
        ELSE 0
    END AS sla_breach_flag
FROM stg_claims;

-- 4. Claims KPI Mart
CREATE VIEW vw_claims_kpi_mart AS
SELECT
    c.region,
    f.claim_type,
    f.claim_status,
    p.vehicle_type,
    COUNT(DISTINCT f.claim_id) AS total_claims,
    SUM(f.claim_amount) AS total_claim_amount,
    AVG(CAST(f.settlement_days AS FLOAT)) AS avg_settlement_days,
    SUM(f.sla_breach_flag) AS sla_breached_claims,
    ROUND(100.0 * SUM(f.sla_breach_flag) / COUNT(*), 2) AS sla_breach_rate,
    SUM(f.fraud_flag) AS suspicious_claims,
    ROUND(100.0 * SUM(f.fraud_flag) / COUNT(*), 2) AS fraud_suspected_rate
FROM fact_claims f
JOIN dim_policies p ON f.policy_id = p.policy_id
JOIN dim_customers c ON p.customer_id = c.customer_id
GROUP BY
    c.region,
    f.claim_type,
    f.claim_status,
    p.vehicle_type;

-- 5. Executive KPI View
CREATE VIEW vw_executive_claims_summary AS
SELECT
    COUNT(DISTINCT claim_id) AS total_claims,
    SUM(claim_amount) AS total_claim_amount,
    AVG(CAST(settlement_days AS FLOAT)) AS avg_settlement_days,
    ROUND(100.0 * SUM(sla_breach_flag) / COUNT(*), 2) AS sla_breach_rate,
    ROUND(100.0 * SUM(fraud_flag) / COUNT(*), 2) AS fraud_suspected_rate
FROM fact_claims;
