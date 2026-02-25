You are generating a test coverage report for this Flutter project.

## Coverage Target

$ARGUMENTS

If not specified, generate full coverage report.

## Protocol

### 1. Run Tests with Coverage

```bash
flutter test --coverage
```

### 2. Generate HTML Report (if lcov available)

```bash
genhtml coverage/lcov.info -o coverage/html
```

### 3. Parse Coverage

```bash
lcov --summary coverage/lcov.info
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COVERAGE REPORT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Overall: XX.X% (required: 80%)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
By Directory:
  lib/features/auth/     XX%
  lib/features/home/     XX%
  lib/core/              XX%
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. Coverage Status

If coverage ≥80%:
```
✅ PASS - Coverage meets requirement
```

If coverage <80%:
```
❌ FAIL - Coverage below 80%

Files needing tests:
- lib/path/to/file.dart (XX%)
- lib/path/to/another.dart (XX%)
```

### 6. Suggestions

List specific functions/classes that need test coverage.
