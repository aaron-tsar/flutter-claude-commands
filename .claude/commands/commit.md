You are committing changes for this Flutter project.

## Commit Message

$ARGUMENTS

If not specified, analyze changes and generate appropriate message.

## Protocol

### 1. Check Status

```bash
git status
git diff --stat
```

### 2. Validate Before Commit

Run `analyze_files` or `dart analyze` — do NOT commit if there are errors.

### 3. Format Code

Run `dart_format` or `dart format .` before committing.

### 4. Generate Commit Message

Follow Conventional Commits:

```
<type>(<scope>): <description>

[optional body]
```

Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `style`, `perf`

### 5. Commit

```bash
git add -A
git commit -m "<message>"
```

### 6. Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COMMIT COMPLETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Message: <commit message>
Files: X changed
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 7. Ask About Push

> Commit done. Push to remote? (y/n)
