#!/usr/bin/env bash
set -euo pipefail

# Flutter Commands Installer for Claude Code
# Downloads files from GitHub repo

REPO_URL="https://raw.githubusercontent.com/aaron-tsar/flutter-claude-commands/master"
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

curl -fsSL "$REPO_URL/.claude/commands/build-fast.md" -o "$PROJECT_DIR/.claude/commands/build-fast.md"
echo "[OK] .claude/commands/build-fast.md"

curl -fsSL "$REPO_URL/.claude/commands/test.md" -o "$PROJECT_DIR/.claude/commands/test.md"
echo "[OK] .claude/commands/test.md"

curl -fsSL "$REPO_URL/.claude/commands/commit.md" -o "$PROJECT_DIR/.claude/commands/commit.md"
echo "[OK] .claude/commands/commit.md"

curl -fsSL "$REPO_URL/.claude/commands/fast.md" -o "$PROJECT_DIR/.claude/commands/fast.md"
echo "[OK] .claude/commands/fast.md"

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
echo "  CLAUDE.md                (Flutter rules)"
echo "  .claude/commands/"
echo "    feature.md             /feature <prompt>"
echo "    extract.md             /extract"
echo "    build.md               /build @plan.md"
echo "    build-fast.md          /build:fast @plan.md"
echo "    test.md                /test [path]"
echo "    commit.md              /commit [message]"
echo "    fast.md                /fast <issue>"
echo ""
echo "Standard: /feature → /extract → /clear → /build → /test → /commit"
echo "Fast:     /build:fast (auto test+commit) or /fast (quick fix)"
echo ""
