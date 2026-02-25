You are deploying to staging environment (Firebase + TestFlight).

## Build Variant

$ARGUMENTS

If not specified, use staging configuration.

## Protocol

### 1. Pre-deploy Checks

- [ ] All tests pass
- [ ] Security scan passed
- [ ] Code reviewed
- [ ] Version bumped

```bash
flutter analyze
flutter test
```

### 2. Build Release

**Android:**
```bash
flutter build apk --release --flavor staging
```

**iOS:**
```bash
flutter build ipa --release --flavor staging --export-options-plist=ios/exportOptions-staging.plist
```

### 3. Deploy

**Android → Firebase:**
```bash
firebase appdistribution:distribute build/app/outputs/flutter-apk/app-staging-release.apk \
  --app <firebase-app-id> \
  --groups "qa,stakeholders"
```

**iOS → TestFlight:**
```bash
xcrun altool --upload-app -f build/ios/ipa/*.ipa \
  -t ios \
  -u $APPLE_ID \
  -p $APP_SPECIFIC_PASSWORD
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
DEPLOYED TO STAGING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Environment: Staging
Version: X.Y.Z+build
Android: Firebase App Distribution
iOS: TestFlight
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. Next Steps

> Staging deploy complete. Run:
> - `/test:integration` for E2E tests
> - `/health` to verify deployment
