# Flutter Commands for Claude Code

Custom slash commands for Flutter development workflow in Claude Code.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/aaron-tsar/flutter-claude-commands/master/install.sh | bash
```

Or install to a specific project:

```bash
curl -fsSL https://raw.githubusercontent.com/aaron-tsar/flutter-claude-commands/master/install.sh | bash -s /path/to/project
```

## Commands

| Command | Description |
|---------|-------------|
| `/feature <prompt>` | Plan a feature interactively |
| `/extract` | Save plan to `plan.md` |
| `/build @plan.md` | Implement from plan |
| `/test [path]` | Run tests |
| `/commit [message]` | Commit changes |
| `/fast <issue>` | Quick fix for any issue |
| `/build:fast @plan.md` | Build → Test → Commit (auto) |

## Workflow

### Standard Flow

```
/feature create auth     →  Plan interactively
/extract                 →  Save to plan.md
/clear                   →  Release session
/build @plan.md          →  Implement phases
/test                    →  Run tests
/commit                  →  Commit changes
```

### Fast Flow

```
/build:fast @plan.md     →  Build + Test + Commit (all-in-one)
/fast fix login button   →  Quick fix + validate
```

## Files Installed

```
project/
├── CLAUDE.md                    # Flutter rules + entry point
└── .claude/
    └── commands/
        ├── feature.md           # /feature
        ├── extract.md           # /extract
        ├── build.md             # /build
        ├── build-fast.md        # /build:fast
        ├── test.md              # /test
        ├── commit.md            # /commit
        └── fast.md              # /fast
```

## Dart MCP Server

Auto-configured if Dart 3.9+ and Claude CLI available.

```bash
claude mcp add --transport stdio dart -- dart mcp-server
```

MCP tools: `analyze_files`, `dart_fix`, `dart_format`, `pub`, `pub_dev_search`, `run_tests`

## Flutter Rules

`CLAUDE.md` contains official Flutter AI rules from:
https://github.com/flutter/flutter/blob/main/docs/rules/rules.md

## License

MIT
