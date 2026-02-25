You are running all security checks for this Flutter project.

## Scan Target

$ARGUMENTS

If not specified, scan entire project.

## Protocol

Run ALL security checks in sequence:

### 1. Dependency Scan (`/security:deps`)

Check for vulnerable packages in `pubspec.lock`.

### 2. Secrets Detection (`/security:secrets`)

Scan for hardcoded secrets, API keys, tokens.

### 3. Static Analysis (`/security:sast`)

Run security-focused static analysis.

### 4. Consolidated Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECURITY SCAN RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dependencies:  ✅ PASS / ❌ X vulnerabilities
Secrets:       ✅ PASS / ❌ X issues found
SAST:          ✅ PASS / ❌ X warnings
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Overall: ✅ SECURE / ❌ ACTION REQUIRED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. If Issues Found

List all issues with severity and remediation steps.

### 6. Next Step

If all pass:
> Security checks passed. Run `/commit` to commit changes?

If issues found:
> X security issues found. Fix them before committing.
