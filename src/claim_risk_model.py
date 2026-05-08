import pandas as pd
import numpy as np

print('Loading cleaned claims dataset...')
claims = pd.read_csv('clean_claims.csv')

print('Creating rule-based claim risk score...')

def calculate_risk_score(row):
    score = 0

    if row['claim_amount'] > 30000:
        score += 30
    elif row['claim_amount'] > 15000:
        score += 15

    if row['settlement_days'] > 60:
        score += 20
    elif row['settlement_days'] > 30:
        score += 10

    if row['fraud_flag'] == 1:
        score += 40

    if row['claim_status'] == 'Under Review':
        score += 10

    return min(score, 100)

claims['risk_score'] = claims.apply(calculate_risk_score, axis=1)
claims['risk_segment'] = np.where(
    claims['risk_score'] >= 70, 'High Risk',
    np.where(claims['risk_score'] >= 40, 'Medium Risk', 'Low Risk')
)

risk_summary = claims.groupby('risk_segment').agg(
    total_claims=('claim_id', 'count'),
    avg_claim_amount=('claim_amount', 'mean'),
    avg_settlement_days=('settlement_days', 'mean'),
    fraud_rate=('fraud_flag', 'mean')
).reset_index()

claims.to_csv('claims_with_risk_scores.csv', index=False)
risk_summary.to_csv('risk_summary.csv', index=False)

print('Risk scoring completed successfully.')
print(risk_summary)
