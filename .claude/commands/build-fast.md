You are implementing a feature with auto-test and auto-commit.

## Plan File

Read: $ARGUMENTS

If not provided, look for `plan.md`. If missing:
> No plan found. Run `/feature <description>` then `/extract` first.

## Rules Reference

Follow all Flutter & Dart rules in `CLAUDE.md`.

## Protocol

This is BUILD + TEST + COMMIT in one flow.

### Phase Loop

For each phase in the plan:

1. **Implement** — Follow rules, use MCP tools
2. **Validate** — `analyze_files` → `dart_fix` → `dart_format`
3. **Test** — `run_tests` or `flutter test`
4. **Continue** — Only proceed if tests pass

### After All Phases

#### 1. Final Validation

```
analyze_files → dart_format → run_tests (full)
```

#### 2. Update plan.md

Mark all tasks: `- [ ]` → `- [x]`

#### 3. Auto Commit

Generate commit message from plan:

```bash
git add -A
git commit -m "feat(<feature>): implement <feature name>

- Phase 1: <summary>
- Phase 2: <summary>
..."
```

#### 4. Final Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD FAST COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Feature: <name>
Phases: N/N
Files: X created, Y modified
Tests: all passed
Commit: <hash> <message>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Push to remote? (y/n)
```

## If Tests Fail

Stop immediately. Report:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD STOPPED — TESTS FAILED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Phase: N
Failed tests: <list>
Error: <message>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Fix and retry with `/build:fast @plan.md`
```

Do NOT commit if tests fail.
