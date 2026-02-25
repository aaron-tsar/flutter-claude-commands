You are running integration tests for this Flutter project.

## Test Target

$ARGUMENTS

If not specified, run all integration tests.

## Protocol

### 1. Check Environment

Ensure device/emulator is running:
```bash
flutter devices
```

### 2. Run Integration Tests

```bash
flutter test integration_test/
```

Or specific test:
```bash
flutter test integration_test/$ARGUMENTS
```

For device testing:
```bash
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```

### 3. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INTEGRATION TEST RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total: X tests
Passed: X
Failed: X
Duration: Xs
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 4. Critical Paths to Test

- [ ] User authentication flow
- [ ] Core business workflows
- [ ] Navigation between screens
- [ ] Data persistence
- [ ] Network error handling
- [ ] Offline mode (if applicable)

### 5. If Tests Fail

Capture screenshots, show error logs, and suggest fixes.
