You are running tests for this Flutter project.

## What to Test

$ARGUMENTS

If not specified, run all tests.

## Test Strategy

### 1. Analyze First

Use `analyze_files` or `dart analyze` to check for issues before testing.

### 2. Run Tests

Use `run_tests` MCP tool or:

```bash
# All tests
flutter test

# Specific file
flutter test test/path/to/test.dart

# With coverage
flutter test --coverage
```

### 3. Report Results

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TEST RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total: X tests
Passed: X
Failed: X
Skipped: X
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 4. If Tests Fail

- Show failed test names and error messages
- Suggest fixes based on error analysis
- Ask if user wants you to fix them
