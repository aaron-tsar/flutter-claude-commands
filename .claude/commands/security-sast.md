You are running Static Application Security Testing (SAST) for this Flutter project.

## Scan Target

$ARGUMENTS

If not specified, scan entire lib/ directory.

## Protocol

### 1. Analyze Security Patterns

Check for common Flutter/Dart security issues:

**Insecure Storage:**
- SharedPreferences for sensitive data
- Unencrypted local storage
- Sensitive data in logs

**Network Security:**
- HTTP instead of HTTPS
- Disabled certificate validation
- Hardcoded URLs

**Cryptography:**
- Weak hashing algorithms (MD5, SHA1)
- Hardcoded encryption keys
- Insecure random generation

**Input Validation:**
- SQL injection patterns
- Missing input sanitization
- Unvalidated deep links

**Debug/Development:**
- Debug flags in production
- print() statements with sensitive data
- Assert statements with side effects

### 2. Check Platform Security

**Android (android/):**
- `android:debuggable="true"`
- `android:allowBackup="true"`
- Missing ProGuard rules
- Exported components without permissions

**iOS (ios/):**
- Missing App Transport Security
- Insecure keychain usage
- Missing entitlements

### 3. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SAST SCAN RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Files analyzed: XX
Issues found: XX
  Critical: X
  High: X
  Medium: X
  Low: X
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 4. Issue Details

```
[HIGH] Insecure Storage
File: lib/services/auth_service.dart:45
Code: SharedPreferences.setString('token', userToken)
Risk: Access token stored in plaintext
Fix: Use flutter_secure_storage instead
```

### 5. Recommendations

Provide specific code fixes for each issue found.
