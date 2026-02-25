You are building a Flutter feature with full validation AND auto-commit.

## Plan File or Issue

$ARGUMENTS

If plan file provided: implement from plan.
If issue description: quick fix mode.
If not provided: look for `plan.md`.

## Rules Reference

Follow all Flutter & Dart rules in `CLAUDE.md`.

## Protocol

This is EXECUTE + TEST + SECURITY + LINT + REVIEW + **COMMIT** (full auto).

### Step 1: Execute

Implement the feature/fix following the plan or issue description.

For each phase:
1. **Implement** — Follow rules, use MCP tools
2. **Validate** — `analyze_files` → `dart_fix` → `dart_format`

### Step 2: Test (≥80% coverage required)

```bash
flutter test --coverage
```

If tests fail or coverage < 80%: STOP immediately, do NOT proceed.

### Step 3: Security Scan

Run all security checks:
- **Dependencies**: Check for vulnerabilities
- **Secrets**: Scan for hardcoded keys/tokens
- **SAST**: Static security analysis

If critical issues found: STOP immediately, do NOT proceed.

### Step 4: Lint & Format

```
analyze_files → dart_fix → dart_format
```

Ensure zero errors, zero warnings.

### Step 5: Review

Perform AI code review:
- Code quality check
- Flutter best practices
- Security review
- Performance review

If critical issues found: STOP, request user confirmation to proceed.

### Step 6: Auto Commit

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
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Tests:     ✅ XX% coverage
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
