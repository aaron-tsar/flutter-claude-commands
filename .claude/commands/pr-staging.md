You are creating a pull request from develop to staging.

## PR Description

$ARGUMENTS

If not specified, generate release summary from commits.

## Protocol

### 1. Check Develop Status

```bash
git checkout develop
git pull origin develop
git log staging..develop --oneline
```

### 2. Create PR

```bash
gh pr create --base staging --head develop --title "Release to Staging" --body "<body>"
```

PR body should include:
- Release summary
- Features included
- Bug fixes included
- Breaking changes (if any)
- Deployment checklist

### 3. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STAGING PR CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PR: #XXX
Flow: develop → staging
URL: <pr_url>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 4. Next Step

> PR created. After merge, run `/deploy:staging` to deploy.
