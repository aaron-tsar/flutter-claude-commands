# Flutter Commands for Claude Code

Custom slash commands for Flutter development workflow in Claude Code.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/flutter-claude-commands/main/install.sh | bash
```

Or with a specific project directory:

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/flutter-claude-commands/main/install.sh | bash -s /path/to/project
```

## Commands

| Command | Description |
|---------|-------------|
| `/feature <prompt>` | Plan a feature interactively (no code yet) |
| `/extract` | Save plan to `plan.md` |
| `/build @plan.md` | Implement from plan |

## Workflow

```
/feature create auth with email/password
    ↓ (interactive planning)
/extract
    ↓ (saves plan.md)
/clear
    ↓ (release session)
/build @plan.md
    ↓ (implements phase by phase)
```

## What Gets Installed

```
your-project/
  CLAUDE.md                      # Entry point
  .claude/
    commands/
      feature.md                 # /feature command
      extract.md                 # /extract command  
      build.md                   # /build command (includes Flutter rules)
```

## Dart MCP Server (Optional)

For enhanced tooling, configure the Dart MCP server (requires Dart 3.9+):

```bash
claude mcp add --transport stdio dart -- dart mcp-server
```

This enables MCP tools: `analyze_files`, `dart_fix`, `dart_format`, `pub`, `pub_dev_search`, `run_tests`

## Flutter Rules

The `/build` command includes official Flutter AI rules from:
https://github.com/flutter/flutter/blob/main/docs/rules/rules.md

## Global Installation

To make commands available for all projects:

```bash
mkdir -p ~/.claude/commands
cp .claude/commands/*.md ~/.claude/commands/
```

## License

MIT
