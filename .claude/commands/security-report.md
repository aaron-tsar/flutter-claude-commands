You are generating a security audit report for this Flutter project.

## Report Scope

$ARGUMENTS

If not specified, generate comprehensive report.

## Protocol

### 1. Run All Scans

Execute all security checks:
- Dependency scan
- Secrets detection
- SAST analysis

### 2. Generate Report

Create `security-report.md` in project root:

```markdown
# Security Audit Report

**Date:** YYYY-MM-DD
**Project:** [Project Name]
**Version:** X.Y.Z

## Executive Summary

Overall security status: ✅ PASS / ⚠️ WARNINGS / ❌ FAIL

## Findings Summary

| Category | Critical | High | Medium | Low |
|----------|----------|------|--------|-----|
| Dependencies | X | X | X | X |
| Secrets | X | X | X | X |
| SAST | X | X | X | X |
| **Total** | X | X | X | X |

## Detailed Findings

### Critical Issues
[List with remediation]

### High Issues
[List with remediation]

### Medium Issues
[List with remediation]

### Low Issues
[List with remediation]

## Recommendations

1. [Priority action items]

## Compliance Checklist

- [ ] OWASP Mobile Top 10
- [ ] No hardcoded secrets
- [ ] Secure storage implemented
- [ ] Network security configured
- [ ] Input validation in place

## Next Steps

[Action items with owners]
```

### 3. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECURITY REPORT GENERATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
File: security-report.md
Issues: X total (X critical, X high)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
