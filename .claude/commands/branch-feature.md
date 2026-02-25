You are creating a feature branch for this Flutter project.

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

### 3. Create Feature Branch

```bash
git checkout -b feature/$ARGUMENTS
```

### 4. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BRANCH CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Branch: feature/$ARGUMENTS
From: develop
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 5. Next Step

> Branch ready. Run `/feature <description>` to start planning?
