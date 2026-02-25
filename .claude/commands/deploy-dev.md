You are deploying to development environment (Firebase App Distribution).

## Build Variant

$ARGUMENTS

If not specified, use default development configuration.

## Protocol

### 1. Pre-deploy Checks

```bash
flutter analyze
flutter test
```

Ensure no errors before deployment.

### 2. Build APK/IPA

**Android:**
```bash
flutter build apk --debug --flavor dev
```

**iOS:**
```bash
flutter build ios --debug --flavor dev
```

### 3. Deploy to Firebase App Distribution

**Android:**
```bash
firebase appdistribution:distribute build/app/outputs/flutter-apk/app-dev-debug.apk \
  --app <firebase-app-id> \
  --groups "developers"
```

**iOS:**
```bash
firebase appdistribution:distribute build/ios/ipa/*.ipa \
  --app <firebase-app-id> \
  --groups "developers"
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
DEPLOYED TO DEV
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Environment: Development
Platform: Android/iOS
Build: debug
Version: X.Y.Z+build
Distribution: Firebase App Distribution
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. Next Step

> Deploy complete. Share with team or run `/health` to verify?
