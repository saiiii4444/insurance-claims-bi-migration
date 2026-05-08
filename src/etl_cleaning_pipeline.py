import pandas as pd

print('Loading datasets...')
customers = pd.read_csv('customers.csv')
policies = pd.read_csv('policies.csv')
claims = pd.read_csv('claims.csv')

print('Cleaning customer dataset...')
customers.drop_duplicates(inplace=True)
customers['annual_income'] = customers['annual_income'].fillna(customers['annual_income'].median())

print('Cleaning policies dataset...')
policies.drop_duplicates(inplace=True)
policies['premium_amount'] = policies['premium_amount'].fillna(policies['premium_amount'].median())

print('Cleaning claims dataset...')
claims.drop_duplicates(inplace=True)
claims['claim_amount'] = claims['claim_amount'].fillna(claims['claim_amount'].median())
claims['settlement_days'] = (
    pd.to_datetime(claims['settlement_date']) - pd.to_datetime(claims['claim_date'])
).dt.days

claims['sla_breach_flag'] = claims['settlement_days'].apply(lambda x: 1 if x > 30 else 0)

print('Saving cleaned datasets...')
customers.to_csv('clean_customers.csv', index=False)
policies.to_csv('clean_policies.csv', index=False)
claims.to_csv('clean_claims.csv', index=False)

print('ETL cleaning pipeline completed successfully.')
