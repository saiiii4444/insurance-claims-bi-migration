-- Claims by region
SELECT
    c.region,
    COUNT(f.claim_id) AS total_claims,
    SUM(f.claim_amount) AS total_claim_amount
FROM fact_claims f
JOIN dim_policies p ON f.policy_id = p.policy_id
JOIN dim_customers c ON p.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_claim_amount DESC;

-- Average settlement days
SELECT
    claim_type,
    AVG(settlement_days) AS avg_settlement_days
FROM fact_claims
GROUP BY claim_type
ORDER BY avg_settlement_days DESC;

-- SLA breach monitoring
SELECT
    claim_type,
    COUNT(*) AS total_claims,
    SUM(sla_breach_flag) AS breached_claims,
    ROUND(100.0 * SUM(sla_breach_flag) / COUNT(*), 2) AS sla_breach_rate
FROM fact_claims
GROUP BY claim_type;

-- Fraud monitoring
SELECT
    claim_type,
    COUNT(*) AS suspicious_claims,
    SUM(claim_amount) AS suspicious_claim_amount
FROM fact_claims
WHERE fraud_flag = 1
GROUP BY claim_type
ORDER BY suspicious_claim_amount DESC;
