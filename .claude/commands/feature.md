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
