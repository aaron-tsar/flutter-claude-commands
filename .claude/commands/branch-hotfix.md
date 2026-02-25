You are creating a hotfix branch for this Flutter project.

## Branch Name

$ARGUMENTS

## Protocol

### 1. Check Current State

```bash
git status
git branch --show-current
```

Ensure working directory is clean. If not, ask user to commit or stash.

### 2. Update Main Branch

```bash
git checkout main
git pull origin main
```

### 3. Create Hotfix Branch

```bash
git checkout -b hotfix/$ARGUMENTS
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HOTFIX BRANCH CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Branch: hotfix/$ARGUMENTS
From: main (production)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. Next Step

> Hotfix branch ready. Run `/fast <issue>` to fix the critical bug?

**IMPORTANT**: After hotfix is merged to main, remember to sync back to develop:
```bash
git checkout develop && git merge main
```
