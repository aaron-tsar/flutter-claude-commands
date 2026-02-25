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

## Commands (34 total)

### Planning & Building

| Command | Description |
|---------|-------------|
| `/feature <prompt>` | Plan a feature interactively |
| `/extract` | Save plan to `plan.md` |
| `/execute @plan.md` | Implement from plan (code only) |
| `/build @plan.md` | Execute → Test → Security → Lint → Review |
| `/build:fast @plan.md` | Build + Commit (full auto) |

### Testing (80% coverage required)

| Command | Description |
|---------|-------------|
| `/test` | Run all tests |
| `/test:unit [path]` | Run unit tests only |
| `/test:widget [path]` | Run widget tests only |
| `/test:integration` | Run integration tests |
| `/test:coverage` | Run tests with coverage report |
| `/test:write [path]` | Generate tests for file/feature |
| `/test:write:unit [path]` | Generate unit tests |
| `/test:write:widget [path]` | Generate widget tests |

### Security (Advanced)

| Command | Description |
|---------|-------------|
| `/security` | Run all security checks |
| `/security:deps` | Scan dependencies for vulnerabilities |
| `/security:secrets` | Detect hardcoded secrets/keys |
| `/security:sast` | Static Application Security Testing |
| `/security:report` | Generate security audit report |

### Git (Git Flow)

| Command | Description |
|---------|-------------|
| `/branch:feature <name>` | Create feature branch from develop |
| `/branch:fix <name>` | Create fix branch from develop |
| `/branch:hotfix <name>` | Create hotfix branch from main |
| `/commit [message]` | Commit with conventional format |
| `/pr` | Create pull request to develop |
| `/pr:staging` | Create PR: develop → staging |
| `/pr:prod` | Create PR: staging → main |
| `/changelog` | Generate changelog from commits |
| `/version <major/minor/patch>` | Bump version (semantic) |

### Deploy

| Command | Description |
|---------|-------------|
| `/deploy:dev` | Deploy to Firebase App Distribution |
| `/deploy:staging` | Deploy to Firebase/TestFlight |
| `/deploy:prod` | Deploy to Play Store/App Store |
| `/rollback` | Rollback to previous version |

### Quality

| Command | Description |
|---------|-------------|
| `/lint` | Run linter + formatter |
| `/review` | AI code review before commit |
| `/health` | Check app health post-deploy |

## Git Flow Branching

```
main (production) ←── staging ←── develop ←── feature/*
     ↑                                    ←── fix/*
     └──────────────────────────────────────── hotfix/*
```

## Workflow

### Standard Flow (Feature Development)

```
/branch:feature user-auth     → Create branch from develop
/feature create auth          → Plan the feature
/extract                      → Save to plan.md
/execute @plan.md             → Implement code
/test:write                   → Generate unit + widget tests
/build @plan.md               → Run Test + Security + Review
/commit "feat(auth): login"   → Commit
/pr                           → PR to develop
```

### Fast Flow (Auto Commit)

```
/branch:feature user-auth     → Create branch
/feature create auth          → Plan
/extract                      → Save plan
/execute @plan.md             → Implement code
/test:write                   → Generate tests
/build:fast @plan.md          → Test + Security + Review + Commit
/pr                           → PR to develop
```

### Release Flow

```
/pr:staging                   → PR develop → staging
/deploy:staging               → Deploy to staging
/test:integration             → E2E tests
/health                       → Health check
/pr:prod                      → PR staging → main
/version minor                → Bump version
/changelog                    → Generate changelog
/deploy:prod                  → Deploy to stores
```

### Hotfix Flow

```
/branch:hotfix critical-bug   → Create from main
/build:fast fix the bug       → Fix + Test + Security + Commit
/pr:prod                      → PR to main
/version patch                → Bump patch version
/deploy:prod                  → Deploy immediately
```

### Quick Fix

```
/build:fast fix login button  → Fix + Test + Security + Review + Commit (auto)
```

## Files Installed

```
project/
├── CLAUDE.md                        # Flutter rules + workflow
└── .claude/
    └── commands/
        ├── feature.md               # /feature
        ├── extract.md               # /extract
        ├── execute.md               # /execute
        ├── build.md                 # /build
        ├── build-fast.md            # /build:fast
        ├── test.md                  # /test
        ├── test-unit.md             # /test:unit
        ├── test-widget.md           # /test:widget
        ├── test-integration.md      # /test:integration
        ├── test-coverage.md         # /test:coverage
        ├── test-write.md            # /test:write
        ├── test-write-unit.md       # /test:write:unit
        ├── test-write-widget.md     # /test:write:widget
        ├── security.md              # /security
        ├── security-deps.md         # /security:deps
        ├── security-secrets.md      # /security:secrets
        ├── security-sast.md         # /security:sast
        ├── security-report.md       # /security:report
        ├── branch-feature.md        # /branch:feature
        ├── branch-fix.md            # /branch:fix
        ├── branch-hotfix.md         # /branch:hotfix
        ├── commit.md                # /commit
        ├── pr.md                    # /pr
        ├── pr-staging.md            # /pr:staging
        ├── pr-prod.md               # /pr:prod
        ├── changelog.md             # /changelog
        ├── version.md               # /version
        ├── deploy-dev.md            # /deploy:dev
        ├── deploy-staging.md        # /deploy:staging
        ├── deploy-prod.md           # /deploy:prod
        ├── rollback.md              # /rollback
        ├── lint.md                  # /lint
        ├── review.md                # /review
        └── health.md                # /health
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
