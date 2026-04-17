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

## Landing the Plane (Session Completion)

**End every session** by completing ALL steps. Work NOT complete until `git push`
succeeds.

**MANDATORY WORKFLOW:**

1. **File issues for remaining work** - Create issues for anything needing follow-up
2. **Run quality gates** (if code changed) - Tests, linters, builds
3. **Close beads tasks and commit**:
   ```bash
   bd close <id>                # Close finished work
   task beads:sync              # Export DB to .beads/issues.jsonl
   git add .beads/ && git commit -m "chore: sync beads state"
   ```
4. **PUSH TO REMOTE** — MANDATORY:
   ```bash
   git pull --rebase
   git push
   git status  # MUST show "up to date with origin"
   ```
5. **Create PR** (if new branch):
   ```bash
   gh pr create
   ```
6. **Wait for CI** (if PR exists):

   ```bash
   task ci:wait -- <pr-number>   # polls until all checks complete
   ```

   **STOP HERE.** Do NOT merge. Human reviewer decides. Never approve-and-merge, never
   enable auto-merge.

7. **Clean up** - Clear stashes, prune remote branches
8. **Verify** - All changes committed AND pushed
9. **Hand off** - Provide context for next session

**CRITICAL RULES:**

- Work NOT complete until `git push` succeeds
- NEVER stop before pushing — leaves work stranded locally
- NEVER say "ready to push when you are" — YOU must push
- If push fails, resolve and retry
- Beads state MUST be committed before pushing — pre-push hook rejects uncommitted
  `.beads/` changes
- NEVER merge a PR unless user explicitly requests it

### Gate Tasks

Deferred work, tech debt, and TODOs get a **gate task** in beads as dependency of the
relevant work item.

<!-- BEGIN BEADS INTEGRATION v:1 profile:minimal hash:ca08a54f -->

<!-- END BEADS INTEGRATION -->
