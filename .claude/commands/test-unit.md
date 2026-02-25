You are running unit tests for this Flutter project.

## Test Path

$ARGUMENTS

If not specified, run all unit tests in `test/unit/`.

## Protocol

### 1. Analyze First

Use `analyze_files` or `dart analyze` to check for issues.

### 2. Run Unit Tests

```bash
flutter test test/unit/ --coverage
```

Or specific file:
```bash
flutter test test/unit/$ARGUMENTS
```

### 3. Check Coverage

Coverage must be ≥80%. Parse coverage report:
```bash
flutter test --coverage
lcov --summary coverage/lcov.info
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
UNIT TEST RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total: X tests
Passed: X
Failed: X
Coverage: XX% (required: 80%)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. If Coverage < 80%

List uncovered files/functions and suggest tests to write.

### 6. If Tests Fail

Show failed test names, error messages, and suggest fixes.
