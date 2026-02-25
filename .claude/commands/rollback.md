You are rolling back to a previous version.

## Target Version

$ARGUMENTS

If not specified, rollback to previous release.

## Protocol

### 1. Identify Current and Target Versions

```bash
git tag --sort=-v:refname | head -5
git log --oneline -10
```

### 2. Determine Rollback Strategy

**Option A: Revert commits (preferred)**
```bash
git revert HEAD~N..HEAD --no-commit
git commit -m "revert: rollback to vX.Y.Z"
```

**Option B: Reset to tag (destructive)**
```bash
git checkout vX.Y.Z
git checkout -b hotfix/rollback-to-vX.Y.Z
```

### 3. Rebuild and Deploy

```bash
flutter build appbundle --release
flutter build ipa --release
```

Deploy using `/deploy:prod` with expedited review request.

### 4. App Store Rollback

**Play Store:**
- Go to Google Play Console
- Release > Production > Release history
- Select previous version > "Release to Production"

**App Store:**
- App Store doesn't support direct rollback
- Must submit new build with expedited review

### 5. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ ROLLBACK INITIATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
From: vX.Y.Z
To: vX.Y.W
Reason: [user provided or detected]
Status: In progress
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6. Post-rollback

- [ ] Notify team of rollback
- [ ] Document incident
- [ ] Create hotfix branch for proper fix
- [ ] Schedule post-mortem

> Rollback complete. Create incident report?
