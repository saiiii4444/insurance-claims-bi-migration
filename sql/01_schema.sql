CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    age INT,
    region VARCHAR(100),
    annual_income DECIMAL(12,2),
    signup_date DATE
);

CREATE TABLE dim_policies (
    policy_id INT PRIMARY KEY,
    customer_id INT,
    vehicle_type VARCHAR(100),
    premium_amount DECIMAL(12,2),
    policy_status VARCHAR(50),
    policy_start_date DATE
);

CREATE TABLE fact_claims (
    claim_id INT PRIMARY KEY,
    policy_id INT,
    claim_type VARCHAR(100),
    claim_amount DECIMAL(12,2),
    claim_status VARCHAR(100),
    claim_date DATE,
    settlement_date DATE,
    settlement_days INT,
    fraud_flag INT,
    sla_breach_flag INT
);
