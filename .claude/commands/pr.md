You are creating a pull request to develop branch.

## PR Title/Description

$ARGUMENTS

If not specified, generate from commits.

## Protocol

### 1. Check Current Branch

```bash
git branch --show-current
git log develop..HEAD --oneline
```

### 2. Push Branch

```bash
git push -u origin HEAD
```

### 3. Create PR

```bash
gh pr create --base develop --title "<title>" --body "<body>"
```

PR body should include:
- Summary of changes
- Related issue (if any)
- Testing done
- Checklist:
  - [ ] Tests pass (80%+ coverage)
  - [ ] Security scan passed
  - [ ] Code reviewed
  - [ ] Documentation updated

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PULL REQUEST CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PR: #XXX
Title: <title>
Base: develop
URL: <pr_url>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
