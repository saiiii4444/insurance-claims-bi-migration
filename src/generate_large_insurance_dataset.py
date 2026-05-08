import pandas as pd
import numpy as np
from faker import Faker
from datetime import datetime, timedelta
import random

fake = Faker('fr_FR')
np.random.seed(42)
random.seed(42)

NUM_CUSTOMERS = 50000
NUM_POLICIES = 60000
NUM_CLAIMS = 120000

regions = ['Paris', 'Lyon', 'Marseille', 'Nice', 'Toulouse', 'Bordeaux']
claim_types = ['Collision', 'Glass Damage', 'Vehicle Theft', 'Fire', 'Flood']
claim_status = ['Open', 'Closed', 'Rejected', 'Under Review']
vehicle_types = ['SUV', 'Sedan', 'Truck', 'Electric', 'Motorcycle']

print('Generating customers...')
customers = []
for customer_id in range(1, NUM_CUSTOMERS + 1):
    customers.append([
        customer_id,
        fake.name(),
        random.randint(18, 80),
        random.choice(regions),
        random.randint(25000, 120000),
        fake.date_between(start_date='-5y', end_date='today')
    ])

customers_df = pd.DataFrame(customers, columns=[
    'customer_id',
    'customer_name',
    'age',
    'region',
    'annual_income',
    'signup_date'
])

print('Generating policies...')
policies = []
for policy_id in range(1, NUM_POLICIES + 1):
    policies.append([
        policy_id,
        random.randint(1, NUM_CUSTOMERS),
        random.choice(vehicle_types),
        random.randint(400, 3000),
        random.choice(['Active', 'Expired']),
        fake.date_between(start_date='-4y', end_date='today')
    ])

policies_df = pd.DataFrame(policies, columns=[
    'policy_id',
    'customer_id',
    'vehicle_type',
    'premium_amount',
    'policy_status',
    'policy_start_date'
])

print('Generating claims...')
claims = []
for claim_id in range(1, NUM_CLAIMS + 1):
    claim_date = fake.date_between(start_date='-3y', end_date='today')
    settlement_days = random.randint(1, 90)

    claims.append([
        claim_id,
        random.randint(1, NUM_POLICIES),
        random.choice(claim_types),
        random.randint(500, 50000),
        random.choice(claim_status),
        claim_date,
        claim_date + timedelta(days=settlement_days),
        random.choice([0, 0, 0, 1])
    ])

claims_df = pd.DataFrame(claims, columns=[
    'claim_id',
    'policy_id',
    'claim_type',
    'claim_amount',
    'claim_status',
    'claim_date',
    'settlement_date',
    'fraud_flag'
])

customers_df.to_csv('customers.csv', index=False)
policies_df.to_csv('policies.csv', index=False)
claims_df.to_csv('claims.csv', index=False)

print('Insurance datasets generated successfully.')
