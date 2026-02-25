You are generating a changelog for this Flutter project.

## Version Range

$ARGUMENTS

If not specified, generate from last tag to HEAD.

## Protocol

### 1. Get Commits Since Last Release

```bash
git log $(git describe --tags --abbrev=0)..HEAD --oneline
```

### 2. Parse Conventional Commits

Group by type:
- `feat:` → Features
- `fix:` → Bug Fixes
- `perf:` → Performance
- `refactor:` → Refactoring
- `docs:` → Documentation
- `test:` → Tests
- `chore:` → Maintenance

### 3. Generate Changelog Entry

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Features
- feat(auth): add biometric login (#123)
- feat(profile): add avatar upload

### Bug Fixes
- fix(cart): resolve quantity update issue (#456)
- fix(payment): handle timeout errors

### Performance
- perf(images): implement lazy loading

### Breaking Changes
- BREAKING: remove deprecated API endpoints
```

### 4. Update CHANGELOG.md

Prepend new entry to existing CHANGELOG.md (create if not exists).

### 5. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CHANGELOG GENERATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Version: X.Y.Z
Commits: XX
Features: X
Fixes: X
Breaking: X
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6. Next Step

> Changelog updated. Run `/version` to bump version?
