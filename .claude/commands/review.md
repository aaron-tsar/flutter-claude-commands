You are performing an AI code review for this Flutter project.

## Review Scope

$ARGUMENTS

If not specified, review all staged/uncommitted changes.

## Protocol

### 1. Get Changes to Review

```bash
git diff --name-only
git diff --staged --name-only
```

### 2. Review Checklist

For each changed file, check:

**Code Quality:**
- [ ] Follows CLAUDE.md style guidelines
- [ ] Functions < 20 lines
- [ ] No code duplication (DRY)
- [ ] Clear naming conventions
- [ ] Proper error handling

**Flutter Specific:**
- [ ] Widgets are immutable
- [ ] No expensive ops in build()
- [ ] Uses const constructors
- [ ] Proper state management
- [ ] No memory leaks (dispose controllers)

**Security:**
- [ ] No hardcoded secrets
- [ ] Input validation present
- [ ] Secure data storage

**Testing:**
- [ ] Tests cover new code
- [ ] Edge cases handled

**Performance:**
- [ ] Efficient algorithms
- [ ] No unnecessary rebuilds
- [ ] Lazy loading where appropriate

### 3. Generate Review Comments

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CODE REVIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Files reviewed: X
Issues found: X
  Critical: X
  Suggestions: X
  Nitpicks: X
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 4. Issue Details

```
[CRITICAL] lib/services/api.dart:45
  Issue: API key hardcoded
  Fix: Use environment variable

[SUGGESTION] lib/widgets/user_card.dart:23
  Issue: Widget could be const
  Fix: Add const constructor

[NITPICK] lib/utils/helpers.dart:12
  Issue: Function name unclear
  Fix: Rename `doIt()` to `processUserData()`
```

### 5. Verdict

```
✅ APPROVED - Good to commit
⚠️ APPROVED WITH COMMENTS - Address suggestions
❌ CHANGES REQUESTED - Fix critical issues first
```
