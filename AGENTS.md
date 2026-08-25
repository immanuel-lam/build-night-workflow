# Build Night Agent Instructions

This repository uses the same durable operating model as the full Platform workflow, compressed into a hard two-hour sprint.

## Five key files

Use these in order:

1. `AGENTS.md` — entry point and permanent agent rules.
2. `contexts/CONTEXT_MAP.md` — route the task to only the context that matters.
3. `contexts/CURRENT.md` — what is true now, including branch, phase, evidence, and next action.
4. `contexts/GOAL.md` — one concrete outcome, workboard, acceptance criteria, evidence, and deferred work.
5. `contexts/VERIFICATION.md` — commands and what each evidence level actually proves.

`BUILD_NIGHT.md` adds the sprint timing contract over this same model.

## Start or resume

Before substantial work:

1. Read `BUILD_NIGHT.md`.
2. Read `contexts/CONTEXT_MAP.md`.
3. Read `contexts/CURRENT.md` and `contexts/GOAL.md`.
4. Use the context map to load only task-specific sources.
5. Inspect `git status --short --branch` and the current diff.
6. Run `bash scripts/build-night-status.sh start` if the timer has not started; otherwise run `bash scripts/build-night-status.sh`.
7. Resume the first unmet goal item that still fits the current phase.

After compaction, model switch, or agent handoff, repeat this grounding from repository evidence. Do not replay completed work from memory.

## Execution rules

- Keep exactly one primary outcome active.
- Maintain exactly one workboard item marked **IN PROGRESS**.
- Implement no more than three coherent vertical slices.
- Update `CURRENT.md` and `GOAL.md` after each coherent slice, material verification result, freeze transition, or handoff.
- Check the build-night timer before starting another slice.
- Do not expand scope after minute 60.
- Stop new feature work at minute 90.
- Stop normal source changes at minute 105.
- Stop engineering work at minute 115.
- Reserve the final five minutes for the exact handoff.
- Prefer focused tests and affected-target builds during implementation.
- Do not run exhaustive repository-wide checks unless they clearly fit inside the remaining budget.
- Self-review the actual diff. Avoid repeated independent review loops unless explicitly requested or fully concurrent with the critical path.
- Use one feature branch by default; use a worktree only to protect existing work or concurrent writers.
- Preserve unrelated user changes and never use destructive Git operations merely to obtain a clean tree.
- Never claim verification, protection, distribution, or acceptance that did not occur.

When the full requested feature will not fit, reduce scope immediately and preserve the smallest useful working vertical slice.

## Continuity rule

The next agent must be able to continue from the repository alone.

Before any pause or handoff, make sure:

- `CURRENT.md` says what is true now and names one next action;
- `GOAL.md` reflects completed, active, deferred, and unmet work accurately;
- verification evidence records exact commands/results rather than confidence statements;
- no completed work remains labelled **IN PROGRESS**;
- no unverified work is described as accepted.