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

## Workflow

1. **Plan**: `/feature create user authentication with email/password`
2. **Extract**: `/extract` — saves to `plan.md`
3. **Clear**: `/clear` — release session
4. **Build**: `/build @plan.md` — implement the feature

## Files Installed

```
project/
├── CLAUDE.md                    # Flutter rules + entry point
└── .claude/
    └── commands/
        ├── feature.md           # /feature command
        ├── extract.md           # /extract command
        └── build.md             # /build command
```

## Dart MCP Server

The installer auto-configures Dart MCP if Dart 3.9+ and Claude CLI are available.

Manual setup:
```bash
claude mcp add --transport stdio dart -- dart mcp-server
```

MCP tools: `analyze_files`, `dart_fix`, `dart_format`, `pub`, `pub_dev_search`, `run_tests`

## Flutter Rules

`CLAUDE.md` contains official Flutter AI rules from:
https://github.com/flutter/flutter/blob/main/docs/rules/rules.md

## License

MIT
