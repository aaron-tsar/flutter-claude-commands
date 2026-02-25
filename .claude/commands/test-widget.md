You are running widget tests for this Flutter project.

## Test Path

$ARGUMENTS

If not specified, run all widget tests in `test/widget/`.

## Protocol

### 1. Analyze First

Use `analyze_files` or `dart analyze` to check for issues.

### 2. Run Widget Tests

```bash
flutter test test/widget/
```

Or specific file:
```bash
flutter test test/widget/$ARGUMENTS
```

### 3. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WIDGET TEST RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total: X tests
Passed: X
Failed: X
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 4. Widget Test Checklist

- [ ] Widget renders correctly
- [ ] User interactions work (tap, scroll, input)
- [ ] State changes reflected in UI
- [ ] Error states handled
- [ ] Loading states displayed
- [ ] Accessibility labels present

### 5. If Tests Fail

Show failed test names, widget tree dump, and suggest fixes.
