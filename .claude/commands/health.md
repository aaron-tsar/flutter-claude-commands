You are checking app health after deployment.

## Environment

$ARGUMENTS

If not specified, check all environments.

## Protocol

### 1. Build Health Check

```bash
flutter analyze
flutter test --reporter compact
```

### 2. Check Crash Reports

Connect to Firebase Crashlytics:
- New crashes since deployment
- Crash-free users percentage
- Top crash issues

### 3. Check Analytics

Review key metrics:
- Active users
- Session duration
- Screen views
- User retention

### 4. Check API Health

Verify backend connectivity:
- API response times
- Error rates
- Success rates

### 5. Check App Store Status

- Review latest reviews/ratings
- Download numbers
- Update adoption rate

### 6. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
APP HEALTH CHECK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Environment: dev/staging/prod
Version: X.Y.Z

Build:
  Analyzer: ✅ No issues
  Tests: ✅ All passing

Stability:
  Crash-free: XX.X%
  New crashes: X
  
Performance:
  API latency: XXms avg
  Error rate: X.X%

User Metrics:
  Active users: X,XXX
  Sessions: X,XXX
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Overall: ✅ HEALTHY / ⚠️ WARNING / ❌ CRITICAL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 7. If Issues Detected

Recommend actions:
- Investigate specific crashes
- Monitor specific metrics
- Consider rollback if critical
