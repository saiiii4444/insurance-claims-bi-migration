# UAT Test Book - Insurance Claims BI Migration

## Objective

The purpose of this UAT (User Acceptance Testing) document is to validate that migrated BI dashboards reproduce the same business KPIs as the legacy reporting environment while maintaining acceptable performance and usability.

---

# Validation Scope

The following areas are validated:

- KPI consistency
- Dashboard filters
- Regional segmentation
- Claims aggregation logic
- Settlement calculations
- Fraud monitoring indicators
- Dashboard load performance
- User navigation behavior

---

# Test Cases

| Test ID | Test Scenario | Expected Result |
|---|---|---|
| UAT-001 | Validate total claims KPI | Same value in legacy and migrated dashboard |
| UAT-002 | Validate total settlement amount | Difference less than 0.01% |
| UAT-003 | Validate fraud claim count | Fraud totals match source data |
| UAT-004 | Validate region filter | Dashboard filters correctly by region |
| UAT-005 | Validate SLA breach calculation | SLA KPI follows defined threshold logic |
| UAT-006 | Validate dashboard load time | Dashboard loads within target threshold |
| UAT-007 | Validate date filtering | Claims appear correctly for selected date range |
| UAT-008 | Validate open claims KPI | Open claims count matches operational source |

---

# KPI Validation Logic

## KPI: Total Claims

Definition:

> Number of unique claims registered during selected period.

Validation Query:

```sql
SELECT COUNT(DISTINCT claim_id)
FROM fact_claims;
```

Expected Result:

- Legacy dashboard and migrated dashboard return identical values.

---

## KPI: SLA Breach Rate

Definition:

> Percentage of claims settled after the 30-day operational SLA.

Validation Query:

```sql
SELECT
    ROUND(100.0 * SUM(sla_breach_flag) / COUNT(*), 2)
FROM fact_claims;
```

Expected Result:

- SLA rate difference below tolerance threshold.

---

# Performance Validation

| Dashboard | Target Load Time |
|---|---|
| Executive Dashboard | < 3 seconds |
| Claims Operations Dashboard | < 5 seconds |
| Fraud Monitoring Dashboard | < 5 seconds |
| Migration Validation Dashboard | < 4 seconds |

---

# UAT Conclusion

Migration validation is considered successful when:

- KPI parity exceeds 99%
- Dashboard performance remains acceptable
- Business users validate dashboard usability
- No critical calculation mismatch remains unresolved
