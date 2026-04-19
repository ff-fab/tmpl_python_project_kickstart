# Agent Instructions

## Issue Tracking

Project uses **bd (beads)** for issue tracking. Run `bd prime` for workflow context, or
install hooks (`bd hooks install`) for auto-injection.

**Quick reference:**

- `bd ready` - Find unblocked work
- `bd create "Title" --type task --priority 2` - Create issue
- `bd close <id>` - Complete work
- `bd dolt push` - Push Dolt DB to remote (if configured)

Full workflow: `bd prime`

## Tooling Policy

**Use `task <name>`** for all operations (run `task --list`). Fall back to `uv run` only
when no task exists. Never invoke `python` directly.

For `gh` subcommands without a task wrapper, direct invocation is fine.

```bash
gh pr create
gh pr view --json number,title,headRefName,baseRefName,state,url
gh pr comment <number> --body "..."
gh pr review <number> --comment --body "..."
gh issue list --limit 50
```

### Gate Tasks

Deferred work, tech debt, and TODOs get a **gate task** in beads as dependency of the
relevant work item.

<!-- BEGIN BEADS INTEGRATION v:1 profile:minimal hash:ca08a54f -->

<!-- END BEADS INTEGRATION -->
