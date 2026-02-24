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
