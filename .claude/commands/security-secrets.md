You are scanning for hardcoded secrets in this Flutter project.

## Scan Target

$ARGUMENTS

If not specified, scan entire codebase.

## Protocol

### 1. Scan for Patterns

Search for common secret patterns:

```
API keys:       api[_-]?key|apikey
Tokens:         token|bearer|jwt|access[_-]?token
Passwords:      password|passwd|pwd|secret
Firebase:       firebase|firebaseio\.com
Google:         google[_-]?api|gcp|google[_-]?cloud
AWS:            aws[_-]?access|aws[_-]?secret|AKIA
Private keys:   -----BEGIN.*PRIVATE KEY-----
URLs with auth: https?://[^:]+:[^@]+@
```

### 2. Check Sensitive Files

- `.env` files committed
- `google-services.json` with real keys
- `GoogleService-Info.plist` with real keys
- Any `*.pem`, `*.key`, `*.p12` files
- `credentials.json`, `service-account.json`

### 3. Check .gitignore

Ensure sensitive files are ignored:
```
.env*
*.pem
*.key
google-services.json
GoogleService-Info.plist
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECRETS SCAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Files scanned: XX
Secrets found: XX
Severity: LOW/MEDIUM/HIGH/CRITICAL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. If Secrets Found

```
❌ SECRETS DETECTED:

File: lib/config/api.dart:15
Type: API Key
Value: sk_live_xxxx...xxxx (masked)
Risk: HIGH - Production key exposed

Remediation:
1. Remove from code
2. Rotate the key immediately
3. Use environment variables
```

### 6. Recommendations

- Use `--dart-define` for build-time config
- Use `flutter_dotenv` for runtime config
- Never commit real keys to git
