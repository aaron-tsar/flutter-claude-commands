You are deploying to production (Play Store + App Store).

## Release Notes

$ARGUMENTS

If not specified, generate from changelog.

## Protocol

### 1. Pre-deploy Checklist

CRITICAL - Verify ALL before production:
- [ ] Staging tested and approved
- [ ] Integration tests passed
- [ ] Security audit completed
- [ ] Version bumped (`/version`)
- [ ] Changelog updated (`/changelog`)
- [ ] PR to main merged
- [ ] Git tag created

### 2. Build Production Release

**Android:**
```bash
flutter build appbundle --release --flavor prod
```

**iOS:**
```bash
flutter build ipa --release --flavor prod --export-options-plist=ios/exportOptions-prod.plist
```

### 3. Deploy to Stores

**Play Store (via fastlane or manual):**
```bash
fastlane android deploy
# or upload build/app/outputs/bundle/prodRelease/app-prod-release.aab manually
```

**App Store (via fastlane or Transporter):**
```bash
fastlane ios deploy
# or use Transporter app with build/ios/ipa/*.ipa
```

### 4. Create Git Tag

```bash
git tag -a vX.Y.Z -m "Release vX.Y.Z"
git push origin vX.Y.Z
```

### 5. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 PRODUCTION RELEASE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Version: X.Y.Z
Tag: vX.Y.Z
Android: Play Store (pending review)
iOS: App Store (pending review)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6. Post-deploy

- Monitor crash reports (Firebase Crashlytics)
- Watch app store reviews
- Prepare rollback plan if needed

> Production release submitted. Run `/health` after store approval.
