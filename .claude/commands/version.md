You are bumping the version for this Flutter project.

## Version Type

$ARGUMENTS

Options: `major`, `minor`, `patch`
If not specified, analyze commits to determine.

## Protocol

### 1. Get Current Version

```bash
grep 'version:' pubspec.yaml
```

Parse: `X.Y.Z+build`

### 2. Determine New Version

Based on Semantic Versioning:
- `major`: Breaking changes (X+1.0.0)
- `minor`: New features (X.Y+1.0)
- `patch`: Bug fixes (X.Y.Z+1)

Build number always increments: `+build+1`

### 3. Update pubspec.yaml

```yaml
version: X.Y.Z+build
```

### 4. Update Native Versions

**Android (android/app/build.gradle):**
```groovy
versionCode build
versionName "X.Y.Z"
```

**iOS (ios/Runner.xcodeproj):**
Update via:
```bash
cd ios && agvtool new-marketing-version X.Y.Z
cd ios && agvtool new-version -all build
```

### 5. Commit Version Bump

```bash
git add pubspec.yaml android/ ios/
git commit -m "chore(release): bump version to X.Y.Z"
```

### 6. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
VERSION BUMPED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Previous: X.Y.Z+build
New: X.Y.Z+build
Type: major/minor/patch
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 7. Next Step

> Version bumped. Run `/changelog` then `/deploy:prod`?
