You are creating a pull request from staging to main (production).

## PR Description

$ARGUMENTS

If not specified, generate release notes from commits.

## Protocol

### 1. Check Staging Status

```bash
git checkout staging
git pull origin staging
git log main..staging --oneline
```

### 2. Verify Pre-release Checklist

Before creating PR, confirm:
- [ ] All tests passed on staging
- [ ] Security scan completed
- [ ] Integration tests passed
- [ ] Health check passed
- [ ] Version bumped

### 3. Create PR

```bash
gh pr create --base main --head staging --title "Production Release vX.Y.Z" --body "<body>"
```

PR body should include:
- Version number
- Release notes
- Features
- Bug fixes
- Breaking changes
- Rollback plan

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRODUCTION PR CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PR: #XXX
Flow: staging → main
Version: vX.Y.Z
URL: <pr_url>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. Next Step

> PR created. After merge, run `/version` then `/deploy:prod`.
