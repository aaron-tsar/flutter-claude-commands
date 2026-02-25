You are creating a fix branch for this Flutter project.

## Branch Name

$ARGUMENTS

## Protocol

### 1. Check Current State

```bash
git status
git branch --show-current
```

Ensure working directory is clean. If not, ask user to commit or stash.

### 2. Update Develop Branch

```bash
git checkout develop
git pull origin develop
```

### 3. Create Fix Branch

```bash
git checkout -b fix/$ARGUMENTS
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BRANCH CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Branch: fix/$ARGUMENTS
From: develop
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. Next Step

> Branch ready. Run `/fast <issue>` to fix the bug?
