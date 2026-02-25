You are running linter and formatter for this Flutter project.

## Target Path

$ARGUMENTS

If not specified, lint and format entire project.

## Protocol

### 1. Run Dart Analyzer

Use `analyze_files` MCP tool or:
```bash
dart analyze lib/ test/
```

### 2. Apply Auto-fixes

Use `dart_fix` MCP tool or:
```bash
dart fix --apply
```

### 3. Format Code

Use `dart_format` MCP tool or:
```bash
dart format .
```

### 4. Check for Remaining Issues

```bash
dart analyze --fatal-infos
```

### 5. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
LINT & FORMAT RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Analyzer:
  Errors: X
  Warnings: X
  Infos: X

Auto-fixed: X issues
Formatted: X files
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Status: ✅ PASS / ❌ FAIL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 6. If Errors Remain

List remaining issues with file:line and suggest fixes.

### 7. Next Step

If pass:
> Lint complete. Run `/commit` to commit changes?
