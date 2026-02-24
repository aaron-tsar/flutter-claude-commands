You are implementing a Flutter feature from a plan file.

## Plan File

Read: $ARGUMENTS

If not provided or not found, look for `plan.md` in project root. If missing:
> No plan found. Run `/feature <description>` then `/extract` first.

## Rules Reference

Follow all Flutter & Dart rules defined in `CLAUDE.md` at project root.

## MCP Tools

Use Dart MCP tools when available:

| Tool | When |
|------|------|
| `analyze_files` | After changes |
| `dart_fix` | Auto-fix issues |
| `dart_format` | Before completing |
| `pub` | Add dependencies |
| `pub_dev_search` | Find packages |
| `run_tests` | Verify correctness |

Fallback: `dart analyze`, `dart fix --apply`, `dart format .`, `flutter pub add`, `flutter test`

## Implementation Protocol

For **each phase** in the plan:

### 1. Announce

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Phase N: <name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 2. Add Dependencies

Use `pub` MCP tool or `flutter pub add <package>`

### 3. Implement Tasks

Follow the plan. Apply rules from `CLAUDE.md`.

### 4. Code Generation (if needed)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Validate

1. `analyze_files` → fix ALL issues
2. `dart_fix` → apply auto-fixes  
3. `dart_format` → format code
4. `run_tests` → if applicable

### 6. Report

```
Phase N: <name> — COMPLETE
Files: created X, modified Y
```

## After All Phases

### Final Validation

1. Full `analyze_files`
2. Full `run_tests`
3. `dart_format .`

### Update plan.md

Mark completed tasks: `- [ ]` → `- [x]`

### Final Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUILD COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Feature: <name>
Phases: N/N
Files created: X
Files modified: Y
Tests: passing
Analysis: clean
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
