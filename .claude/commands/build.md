You are building a Flutter feature with full validation (no commit).

## Plan File or Issue

$ARGUMENTS

If plan file provided: implement from plan.
If issue description: quick fix mode.
If not provided: look for `plan.md`.

## Rules Reference

Follow all Flutter & Dart rules in `CLAUDE.md`.

## Protocol

This is EXECUTE + WRITE TESTS + RUN TESTS + SECURITY + LINT + REVIEW (stops before commit).

### Step 1: Execute

Implement the feature/fix following the plan or issue description.

For each phase:
1. **Implement** — Follow rules, use MCP tools
2. **Validate** — `analyze_files` → `dart_fix` → `dart_format`

### Step 2: Write Tests (MANDATORY)

Generate tests for all new/modified code:

**Unit Tests** (`test/unit/`):
- Test all public classes and methods
- Cover happy path, edge cases, error handling
- Use `package:checks` for assertions

**Widget Tests** (`test/widget/`):
- Test all new widgets/screens
- Cover rendering, interactions, states

Test structure:
```dart
import 'package:test/test.dart';
import 'package:checks/checks.dart';

void main() {
  group('ClassName', () {
    test('should do X when Y', () {
      // Arrange → Act → Assert
    });
  });
}
```

### Step 3: Run Tests (≥80% coverage required)

```bash
flutter test --coverage
```

Check coverage:
```bash
lcov --summary coverage/lcov.info
```

If coverage < 80%: STOP, generate more tests until coverage met.

### Step 4: Security Scan

Run all security checks:
- **Dependencies**: Check for vulnerabilities
- **Secrets**: Scan for hardcoded keys/tokens
- **SAST**: Static security analysis

Report any issues found.

### Step 5: Lint & Format

```
analyze_files → dart_fix → dart_format
```

Ensure zero errors, zero warnings.

### Step 6: Review

Perform AI code review:
- Code quality check
- Flutter best practices
- Security review
- Performance review
- Test quality review

### Final Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD COMPLETE (Ready to commit)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Feature: <name>
Files: X created, Y modified
Tests: Z test files generated
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Coverage:  ✅ XX% (≥80%)
Security:  ✅ No issues
Lint:      ✅ Clean
Review:    ✅ Approved
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Next Step

> Build complete. Choose next action:
> - `/commit "feat(scope): message"` → Commit changes
> - `/build:fast @plan.md` → Re-run with auto-commit
> - `/pr` → Create pull request (if already committed)

## If Any Step Fails

Stop and report which step failed with details.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD STOPPED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Failed at: <step name>
Reason: <details>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Fix the issue and run `/build @plan.md` again.
```
