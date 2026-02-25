You are scanning dependencies for vulnerabilities in this Flutter project.

## Scan Target

$ARGUMENTS

If not specified, scan all dependencies.

## Protocol

### 1. Check Outdated Packages

```bash
flutter pub outdated
```

### 2. Analyze pubspec.lock

Check each dependency against known vulnerability databases:
- pub.dev advisories
- GitHub Security Advisories
- National Vulnerability Database (NVD)

### 3. Verify Package Sources

Ensure all packages are from pub.dev (official source).
Flag any git dependencies or path dependencies.

### 4. Check for Deprecated Packages

Identify discontinued or unmaintained packages.

### 5. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
DEPENDENCY SCAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total packages: XX
Outdated: XX
Vulnerable: XX
Deprecated: XX
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6. If Vulnerabilities Found

```
❌ VULNERABLE PACKAGES:

Package: example_pkg (v1.2.3)
Severity: HIGH
CVE: CVE-XXXX-XXXXX
Fix: Upgrade to v1.2.4
```

### 7. Remediation

Suggest specific version upgrades or alternative packages.
