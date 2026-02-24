#!/usr/bin/env bash
set -euo pipefail

# Flutter Commands Installer for Claude Code
# Creates /feature, /extract, /build commands for Flutter development workflow

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="${1:-$SCRIPT_DIR}"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Flutter Commands — Claude Code Installer"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Install directory: $PROJECT_DIR"
echo ""

# Check Dart version
if command -v dart &>/dev/null; then
  version=$(dart --version 2>&1 | grep -oE '[0-9]+\.[0-9]+' | head -1)
  major=$(echo "$version" | cut -d. -f1)
  minor=$(echo "$version" | cut -d. -f2)
  echo "[OK] Dart SDK: $version"
  if (( major < 3 || (major == 3 && minor < 9) )); then
    echo "[WARN] Dart MCP requires 3.9+. Run 'flutter upgrade'."
  fi
else
  echo "[WARN] Dart not found"
fi

# Check Claude CLI
CLAUDE_AVAILABLE=false
if command -v claude &>/dev/null; then
  echo "[OK] Claude CLI found"
  CLAUDE_AVAILABLE=true
else
  echo "[WARN] Claude CLI not found"
fi
echo ""

# Create directories
mkdir -p "$PROJECT_DIR/.claude/commands"
echo "[OK] Directories created"

# ─── CLAUDE.md ─────────────────────────────────────────

cat > "$PROJECT_DIR/CLAUDE.md" << 'EOF'
# Flutter Project

This is a Flutter project using Claude Code with custom slash commands.

## Commands

| Command | Description |
|---------|-------------|
| `/feature <prompt>` | Plan a feature interactively |
| `/extract` | Save plan to `plan.md` |
| `/build @plan.md` | Implement from plan |

## Workflow

1. `/feature create auth with email/password` — Design the feature
2. `/extract` — Save to `plan.md`
3. `/clear` — Release session
4. `/build @plan.md` — Implement

## Dart MCP Server

If available, use MCP tools: `analyze_files`, `dart_fix`, `dart_format`, `pub`, `pub_dev_search`, `run_tests`

Setup (requires Dart 3.9+):
```bash
claude mcp add --transport stdio dart -- dart mcp-server
```
EOF
echo "[OK] CLAUDE.md"

# ─── /feature command ──────────────────────────────────

cat > "$PROJECT_DIR/.claude/commands/feature.md" << 'EOF'
You are entering **Feature Planning Mode** for a Flutter project.

## Feature Request

> $ARGUMENTS

## Your Role

You are a senior Flutter developer. Plan this feature thoroughly before any implementation. Do NOT write code files yet.

## Planning Process

### Step 1: Clarify Requirements

Ask the user about:
- Target platforms (mobile, web, desktop)?
- State management preference (built-in ValueNotifier/ChangeNotifier, or specific package)?
- Data source (REST API, local storage, Firebase)?
- Any existing code/models to integrate with?

Use Dart MCP tools if available:
- `analyze_files` to understand current project structure
- `pub_dev_search` to identify suitable packages

### Step 2: Design Architecture

Propose architecture following Flutter best practices:

**Project Structure** (feature-based):
```
lib/features/<feature_name>/
  data/           # Models, repositories, API clients
  domain/         # Business logic, use cases
  presentation/   # Widgets, screens, view models
```

**State Management** (prefer built-in):
- `ValueNotifier` + `ValueListenableBuilder` for simple local state
- `ChangeNotifier` + `ListenableBuilder` for complex/shared state
- MVVM pattern for robust architecture

**Navigation**: `go_router` for declarative routing

**Serialization**: `json_serializable` + `json_annotation`

### Step 3: Create Structured Plan

Present the plan in this format:

```markdown
## Feature: <name>

### Overview
<what and why>

### Architecture Decisions
- <decision>: <rationale>

### Implementation Phases

#### Phase 1: <name>
- [ ] Task 1.1
- [ ] Task 1.2
Files: `lib/...` (new/modify)

#### Phase 2: <name>
- [ ] Task 2.1
Files: `lib/...` (new/modify)

### Dependencies
| Package | Purpose |
|---------|---------|
| `name` | reason |

### File Summary
| File | Action | Description |
|------|--------|-------------|
| `path` | New/Modify | ... |

### Testing Strategy
- Unit: <what>
- Widget: <what>
- Integration: <what>
```

### Step 4: Iterate

Refine the plan based on user feedback until approved.

### Step 5: Next Steps

When the plan is finalized, tell the user:

> **Plan ready!** Run `/extract` to save it to `plan.md`, then `/clear` to start fresh, then `/build @plan.md` to implement.

**Important**: Do NOT create any files during planning. The plan exists only in this conversation until `/extract`.
EOF
echo "[OK] feature.md"

# ─── /extract command ──────────────────────────────────

cat > "$PROJECT_DIR/.claude/commands/extract.md" << 'EOF'
You are extracting the feature plan from this conversation.

## Task

Search the conversation history for the structured plan created during `/feature`. Extract it into `plan.md` at the project root.

## If No Plan Found

Tell the user:
> No plan found. Run `/feature <description>` first.

## Plan File Format

Create `plan.md` with this structure:

```markdown
# Plan: <Feature Name>

> Generated from planning session. Implement with `/build @plan.md`

## Overview

<feature description and purpose>

## Architecture Decisions

- <decision>: <rationale>

## Implementation Phases

### Phase 1: <name>

- [ ] Task 1.1: <description>
- [ ] Task 1.2: <description>

**Files:**
| File | Action | Description |
|------|--------|-------------|
| `path/to/file.dart` | New | ... |

### Phase 2: <name>

- [ ] Task 2.1: <description>

**Files:**
| File | Action | Description |
|------|--------|-------------|
| `path/to/file.dart` | Modify | ... |

## Dependencies

| Package | Purpose |
|---------|---------|
| `package_name` | reason |

## Testing Strategy

### Unit Tests
- <what to test>

### Widget Tests
- <what to test>

### Integration Tests
- <what to test>

## Notes

<additional context or constraints>
```

## After Extraction

Tell the user:

> **Plan saved to `plan.md`**
>
> Next steps:
> 1. Review and edit `plan.md` if needed
> 2. Run `/clear` to release this session
> 3. Run `/build @plan.md` to implement
EOF
echo "[OK] extract.md"

# ─── /build command ────────────────────────────────────

cat > "$PROJECT_DIR/.claude/commands/build.md" << 'EOF'
You are implementing a Flutter feature from a plan file.

## Plan File

Read: $ARGUMENTS

If not provided or not found, look for `plan.md` in project root. If missing:
> No plan found. Run `/feature <description>` then `/extract` first.

---

## Flutter & Dart Rules

> Based on official Flutter AI rules: https://github.com/flutter/flutter/blob/main/docs/rules/rules.md

### Code Quality

- **Naming**: `PascalCase` classes, `camelCase` members/variables, `snake_case` files. Avoid abbreviations.
- **Line length**: 80 characters max
- **Conciseness**: Code should be as short as possible while remaining clear
- **Simplicity**: Straightforward code over clever/obscure code
- **Error handling**: Anticipate and handle errors. Never fail silently.
- **Functions**: Short, single purpose (< 20 lines)

### Dart Best Practices

- Follow [Effective Dart](https://dart.dev/effective-dart)
- **Null safety**: Write soundly null-safe code. Avoid `!` unless guaranteed non-null.
- **Async/Await**: Use `Future`, `async`, `await` with robust error handling. Use `Stream` for sequences.
- **Pattern matching**: Use where it simplifies code
- **Records**: Use to return multiple values without defining a class
- **Switch**: Prefer exhaustive `switch` expressions (no `break` needed)
- **Exceptions**: Use `try-catch` with appropriate exception types. Create custom exceptions.
- **Arrow functions**: Use for simple one-line functions

### Flutter Best Practices

- **Immutability**: Widgets (especially `StatelessWidget`) should be immutable
- **Composition**: Prefer composing smaller widgets over extending. Avoid deep nesting.
- **Private widgets**: Use small private `Widget` classes, not helper methods returning widgets
- **Build methods**: Break down large `build()` into smaller private widget classes
- **Lazy lists**: Use `ListView.builder` or `SliverList` for long lists
- **Isolates**: Use `compute()` for expensive calculations (JSON parsing, etc.)
- **Const constructors**: Use `const` in constructors and `build()` methods to reduce rebuilds
- **No expensive ops in build()**: Never do network calls or heavy computation in `build()`

### Project Structure

Feature-based organization:
```
lib/
  main.dart
  app.dart
  core/                     # Shared utilities, extensions, constants
  features/
    <feature_name>/
      presentation/         # Widgets, screens, view models
      domain/               # Business logic, use cases
      data/                 # Models, repositories, API clients
  routing/                  # GoRouter configuration
  theme/                    # ThemeData, color schemes
test/
  unit/
  widget/
  integration/
```

### State Management

Prefer Flutter's built-in solutions. No third-party unless explicitly requested.

- **ValueNotifier + ValueListenableBuilder**: Simple local state (single value)
- **ChangeNotifier + ListenableBuilder**: Complex or shared state
- **Stream + StreamBuilder**: Sequence of async events
- **Future + FutureBuilder**: Single async operation
- **MVVM**: When robust architecture needed, with manual constructor DI

### Navigation

Use `go_router` for declarative navigation, deep linking, web support:
```dart
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details/:id',
          builder: (context, state) => DetailScreen(id: state.pathParameters['id']!),
        ),
      ],
    ),
  ],
);
```

Use built-in `Navigator` only for short-lived screens (dialogs, temporary views).

### Data & Serialization

Use `json_serializable` + `json_annotation`:
```dart
@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String firstName;
  final String lastName;
  User({required this.firstName, required this.lastName});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

Run after modifying: `dart run build_runner build --delete-conflicting-outputs`

### Theming

- Use `ColorScheme.fromSeed()` for harmonious palettes
- Define both `theme` and `darkTheme` in `MaterialApp`
- Use `Theme.of(context).textTheme` and `Theme.of(context).colorScheme`
- Custom tokens via `ThemeExtension<T>`

### Logging

Use `dart:developer` instead of `print`:
```dart
import 'dart:developer' as developer;
developer.log('Message', name: 'myapp.module', error: e, stackTrace: s);
```

### Lint Rules

```yaml
include: package:flutter_lints/flutter.yaml
linter:
  rules: {}
```

### Testing

- **Unit**: `package:test` for domain, data, state
- **Widget**: `package:flutter_test` for UI
- **Integration**: `package:integration_test` for e2e
- **Assertions**: Prefer `package:checks` over matchers
- **Pattern**: Arrange-Act-Assert (Given-When-Then)
- **Mocks**: Prefer fakes/stubs. Use `mockito`/`mocktail` only if necessary.

### Documentation

- `///` doc comments for all public APIs
- Start with single-sentence summary
- Explain *why*, not *what*
- Use backticks for code references

### Accessibility

- Color contrast: 4.5:1 minimum
- Test with dynamic text scaling
- Use `Semantics` widget for labels
- Test with TalkBack/VoiceOver

---

## Dart MCP Tools

Use when available (prefer over CLI):

| Tool | When |
|------|------|
| `analyze_files` | After changes |
| `dart_fix` | Auto-fix issues |
| `dart_format` | Before completing |
| `pub` | Add dependencies |
| `pub_dev_search` | Find packages |
| `run_tests` | Verify correctness |

Fallback: `dart analyze`, `dart fix --apply`, `dart format .`, `flutter pub add`, `flutter test`

---

## Implementation Protocol

For **each phase**:

### 1. Announce
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Phase N: <name>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

### 2. Dependencies
Use `pub` or `flutter pub add <package>`

### 3. Implement
Follow all Flutter & Dart rules above strictly.

### 4. Code Generation
```shell
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
Issues: none
```

## After All Phases

### Final Validation
1. Full `analyze_files`
2. Full `run_tests`
3. `dart_format .`

### Update plan.md
`- [ ]` → `- [x]` for completed tasks. Add completion summary.

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
EOF
echo "[OK] build.md"

# ─── Configure Dart MCP ────────────────────────────────

echo ""
if [ "$CLAUDE_AVAILABLE" = true ]; then
  if claude mcp add --transport stdio dart -- dart mcp-server 2>/dev/null; then
    echo "[OK] Dart MCP configured"
  else
    echo "[WARN] MCP config failed. Run: claude mcp add --transport stdio dart -- dart mcp-server"
  fi
else
  echo "[SKIP] MCP config (no Claude CLI)"
  echo "       Run: claude mcp add --transport stdio dart -- dart mcp-server"
fi

# ─── Done ──────────────────────────────────────────────

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Done!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Files:"
echo "  CLAUDE.md"
echo "  .claude/commands/feature.md"
echo "  .claude/commands/extract.md"
echo "  .claude/commands/build.md"
echo ""
echo "Workflow:"
echo "  /feature <desc>  → Plan"
echo "  /extract         → Save plan.md"
echo "  /clear           → Release session"
echo "  /build @plan.md  → Implement"
