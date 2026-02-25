You are building a Flutter feature with full validation AND auto-commit.

## Plan File or Issue

$ARGUMENTS

If plan file provided: implement from plan.
If issue description: quick fix mode.
If not provided: look for `plan.md`.

## Rules Reference

Follow all Flutter & Dart rules in `CLAUDE.md`.

## Protocol

This is EXECUTE + WRITE TESTS + RUN TESTS + SECURITY + LINT + REVIEW + **COMMIT** (full auto).

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

### Step 3: Run Tests (≥80% coverage required)

```bash
flutter test --coverage
```

If tests fail or coverage < 80%: STOP immediately, do NOT proceed.

### Step 4: Security Scan

Run all security checks:
- **Dependencies**: Check for vulnerabilities
- **Secrets**: Scan for hardcoded keys/tokens
- **SAST**: Static security analysis

If critical issues found: STOP immediately, do NOT proceed.

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

If critical issues found: STOP, request user confirmation to proceed.

### Step 7: Auto Commit

Generate commit message based on changes:

```bash
git add -A
git commit -m "<type>(<scope>): <description>

- <change 1>
- <change 2>
..."
```

### Final Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD FAST COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Feature: <name>
Files: X created, Y modified
Tests: Z test files generated
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Coverage:  ✅ XX% (≥80%)
Security:  ✅ No issues
Lint:      ✅ Clean
Review:    ✅ Approved
Commit:    ✅ <hash> <message>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### Next Step

> Build & commit complete. Choose next action:
> - `/pr` → Create pull request to develop
> - `git push` → Push to remote
> - `/deploy:dev` → Deploy to development

## If Any Step Fails

Stop immediately and report. Do NOT commit.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD FAST STOPPED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Failed at: <step name>
Reason: <details>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Fix the issue and run `/build:fast @plan.md` again.
```
