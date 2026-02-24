#!/usr/bin/env bash
set -euo pipefail

# Flutter Commands Installer for Claude Code
# Downloads files from GitHub repo

REPO_URL="https://raw.githubusercontent.com/aaron-tsar/flutter-claude-commands/main"
PROJECT_DIR="${1:-.}"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Flutter Commands for Claude Code"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Create directories
mkdir -p "$PROJECT_DIR/.claude/commands"
echo "[OK] Created .claude/commands/"

# Download files
echo ""
echo "Downloading files..."

curl -fsSL "$REPO_URL/CLAUDE.md" -o "$PROJECT_DIR/CLAUDE.md"
echo "[OK] CLAUDE.md"

curl -fsSL "$REPO_URL/.claude/commands/feature.md" -o "$PROJECT_DIR/.claude/commands/feature.md"
echo "[OK] .claude/commands/feature.md"

curl -fsSL "$REPO_URL/.claude/commands/extract.md" -o "$PROJECT_DIR/.claude/commands/extract.md"
echo "[OK] .claude/commands/extract.md"

curl -fsSL "$REPO_URL/.claude/commands/build.md" -o "$PROJECT_DIR/.claude/commands/build.md"
echo "[OK] .claude/commands/build.md"

# Configure Dart MCP (optional)
echo ""
if command -v claude &> /dev/null; then
  if command -v dart &> /dev/null; then
    DART_VERSION=$(dart --version 2>&1 | grep -oE '[0-9]+\.[0-9]+' | head -1)
    MAJOR=$(echo "$DART_VERSION" | cut -d. -f1)
    MINOR=$(echo "$DART_VERSION" | cut -d. -f2)
    
    if [[ "$MAJOR" -gt 3 ]] || [[ "$MAJOR" -eq 3 && "$MINOR" -ge 9 ]]; then
      claude mcp add --transport stdio dart -- dart mcp-server 2>/dev/null || true
      echo "[OK] Dart MCP server configured"
    else
      echo "[!] Dart $DART_VERSION detected. MCP requires 3.9+. Run: flutter upgrade"
    fi
  else
    echo "[!] Dart not found. Install Flutter SDK for MCP support."
  fi
else
  echo "[!] Claude CLI not found. Configure MCP manually:"
  echo "    claude mcp add --transport stdio dart -- dart mcp-server"
fi

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Installation complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Files installed:"
echo "  CLAUDE.md              (Flutter rules)"
echo "  .claude/commands/"
echo "    feature.md           /feature <prompt>"
echo "    extract.md           /extract"
echo "    build.md             /build @plan.md"
echo ""
echo "Usage:"
echo "  1. /feature create auth with email"
echo "  2. /extract"
echo "  3. /clear"
echo "  4. /build @plan.md"
echo ""
