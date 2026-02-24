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
