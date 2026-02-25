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

# CLAUDE.md (Flutter rules + workflow)
curl -fsSL "$REPO_URL/CLAUDE.md" -o "$PROJECT_DIR/CLAUDE.md"
echo "[OK] CLAUDE.md"

# Planning & Building
curl -fsSL "$REPO_URL/.claude/commands/feature.md" -o "$PROJECT_DIR/.claude/commands/feature.md"
curl -fsSL "$REPO_URL/.claude/commands/extract.md" -o "$PROJECT_DIR/.claude/commands/extract.md"
curl -fsSL "$REPO_URL/.claude/commands/execute.md" -o "$PROJECT_DIR/.claude/commands/execute.md"
curl -fsSL "$REPO_URL/.claude/commands/build.md" -o "$PROJECT_DIR/.claude/commands/build.md"
curl -fsSL "$REPO_URL/.claude/commands/build-fast.md" -o "$PROJECT_DIR/.claude/commands/build-fast.md"
echo "[OK] Planning & Building (5 files)"

# Testing
curl -fsSL "$REPO_URL/.claude/commands/test.md" -o "$PROJECT_DIR/.claude/commands/test.md"
curl -fsSL "$REPO_URL/.claude/commands/test-unit.md" -o "$PROJECT_DIR/.claude/commands/test-unit.md"
curl -fsSL "$REPO_URL/.claude/commands/test-widget.md" -o "$PROJECT_DIR/.claude/commands/test-widget.md"
curl -fsSL "$REPO_URL/.claude/commands/test-integration.md" -o "$PROJECT_DIR/.claude/commands/test-integration.md"
curl -fsSL "$REPO_URL/.claude/commands/test-coverage.md" -o "$PROJECT_DIR/.claude/commands/test-coverage.md"
curl -fsSL "$REPO_URL/.claude/commands/test-write.md" -o "$PROJECT_DIR/.claude/commands/test-write.md"
curl -fsSL "$REPO_URL/.claude/commands/test-write-unit.md" -o "$PROJECT_DIR/.claude/commands/test-write-unit.md"
curl -fsSL "$REPO_URL/.claude/commands/test-write-widget.md" -o "$PROJECT_DIR/.claude/commands/test-write-widget.md"
echo "[OK] Testing (8 files)"

# Security
curl -fsSL "$REPO_URL/.claude/commands/security.md" -o "$PROJECT_DIR/.claude/commands/security.md"
curl -fsSL "$REPO_URL/.claude/commands/security-deps.md" -o "$PROJECT_DIR/.claude/commands/security-deps.md"
curl -fsSL "$REPO_URL/.claude/commands/security-secrets.md" -o "$PROJECT_DIR/.claude/commands/security-secrets.md"
curl -fsSL "$REPO_URL/.claude/commands/security-sast.md" -o "$PROJECT_DIR/.claude/commands/security-sast.md"
curl -fsSL "$REPO_URL/.claude/commands/security-report.md" -o "$PROJECT_DIR/.claude/commands/security-report.md"
echo "[OK] Security (5 files)"

# Git Flow
curl -fsSL "$REPO_URL/.claude/commands/branch-feature.md" -o "$PROJECT_DIR/.claude/commands/branch-feature.md"
curl -fsSL "$REPO_URL/.claude/commands/branch-fix.md" -o "$PROJECT_DIR/.claude/commands/branch-fix.md"
curl -fsSL "$REPO_URL/.claude/commands/branch-hotfix.md" -o "$PROJECT_DIR/.claude/commands/branch-hotfix.md"
curl -fsSL "$REPO_URL/.claude/commands/commit.md" -o "$PROJECT_DIR/.claude/commands/commit.md"
curl -fsSL "$REPO_URL/.claude/commands/pr.md" -o "$PROJECT_DIR/.claude/commands/pr.md"
curl -fsSL "$REPO_URL/.claude/commands/pr-staging.md" -o "$PROJECT_DIR/.claude/commands/pr-staging.md"
curl -fsSL "$REPO_URL/.claude/commands/pr-prod.md" -o "$PROJECT_DIR/.claude/commands/pr-prod.md"
curl -fsSL "$REPO_URL/.claude/commands/changelog.md" -o "$PROJECT_DIR/.claude/commands/changelog.md"
curl -fsSL "$REPO_URL/.claude/commands/version.md" -o "$PROJECT_DIR/.claude/commands/version.md"
echo "[OK] Git Flow (9 files)"

# Deploy
curl -fsSL "$REPO_URL/.claude/commands/deploy-dev.md" -o "$PROJECT_DIR/.claude/commands/deploy-dev.md"
curl -fsSL "$REPO_URL/.claude/commands/deploy-staging.md" -o "$PROJECT_DIR/.claude/commands/deploy-staging.md"
curl -fsSL "$REPO_URL/.claude/commands/deploy-prod.md" -o "$PROJECT_DIR/.claude/commands/deploy-prod.md"
curl -fsSL "$REPO_URL/.claude/commands/rollback.md" -o "$PROJECT_DIR/.claude/commands/rollback.md"
echo "[OK] Deploy (4 files)"

# Quality
curl -fsSL "$REPO_URL/.claude/commands/lint.md" -o "$PROJECT_DIR/.claude/commands/lint.md"
curl -fsSL "$REPO_URL/.claude/commands/review.md" -o "$PROJECT_DIR/.claude/commands/review.md"
curl -fsSL "$REPO_URL/.claude/commands/health.md" -o "$PROJECT_DIR/.claude/commands/health.md"
echo "[OK] Quality (3 files)"

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
echo "Installation complete! (34 commands)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Commands installed:"
echo "  Planning:  /feature, /extract, /execute, /build, /build:fast"
echo "  Testing:   /test, /test:unit, /test:widget, /test:integration, /test:coverage"
echo "             /test:write, /test:write:unit, /test:write:widget"
echo "  Security:  /security, /security:deps, /security:secrets, /security:sast, /security:report"
echo "  Git:       /branch:feature, /branch:fix, /branch:hotfix, /commit, /pr, /pr:staging, /pr:prod, /changelog, /version"
echo "  Deploy:    /deploy:dev, /deploy:staging, /deploy:prod, /rollback"
echo "  Quality:   /lint, /review, /health"
echo ""
echo "Workflow:"
echo "  Standard: /branch:feature → /feature → /extract → /build → /commit → /pr"
echo "  Fast:     /branch:feature → /feature → /extract → /build:fast → /pr"
echo "  Hotfix:   /branch:hotfix → /build:fast → /pr:prod → /deploy:prod"
echo ""
