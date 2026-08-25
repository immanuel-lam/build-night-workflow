# Build Night Execution Contract

## Mission

Run the Platform workflow in sprint mode and produce the best demonstrable working result before the 120-minute deadline.

The timing rules below constrain execution. They do not replace context routing, durable current state, one active goal, verification discipline, or handoff continuity.

## Hard limits

- Exactly one primary outcome.
- Maximum three implementation slices.
- Do not expand scope after minute 60.
- No new features after minute 90.
- No normal source changes after minute 105.
- After minute 105, only a critical build-breaking or demo-blocking fix may change source.
- Stop all engineering work at minute 115.
- Always preserve the final five minutes for handoff.

## Start or resume

1. Read `AGENTS.md`.
2. Read `contexts/CONTEXT_MAP.md`.
3. Read `contexts/CURRENT.md` and `contexts/GOAL.md`.
4. Use the context map to load only the task-specific sources required for the active slice.
5. Inspect `git status --short --branch`, the current diff, and any existing relevant branch/revision state.
6. Run `bash scripts/build-night-status.sh start` if the timer has not started; otherwise run `bash scripts/build-night-status.sh`.
7. Resume the first unmet workboard or acceptance item that still fits the current phase.

After compaction, model switch, or another agent taking over, repeat this grounding from repository evidence. Do not reconstruct completed work from chat memory.

## Continuous sprint loop

Until feature freeze, work in coherent slices:

1. **Observe** — establish the current behavior from source, tests, logs, payloads, screenshots, or reproducible runtime evidence.
2. **Route context** — use `CONTEXT_MAP.md` to read only the contracts needed for this slice.
3. **Plan** — identify the smallest safe boundary, important edge cases, owners, fallbacks, and demo path.
4. **Implement** — make one coherent vertical change.
5. **Focused verify** — run the narrow regression and build/compile the affected target where applicable.
6. **Self-review** — inspect the actual diff and the surrounding owner code for obvious correctness, security/privacy, stale-state, error-path, and demo-breaking issues relevant to the change.
7. **Persist** — update `GOAL.md` and `CURRENT.md` with the exact result and evidence.
8. **Check timer** — run `bash scripts/build-night-status.sh` before starting another slice.
9. **Continue or freeze** — start another slice only if it clearly fits the remaining implementation budget.

This is intentionally the same engineering shape as the full workflow, with a stricter stop condition.

## Investigation budget

Do not exhaustively inspect the repository.

Read:

1. repository instructions;
2. current state and active goal;
3. the source that owns the current slice;
4. dependencies or contracts required to understand that source.

Search outward only when required to complete the goal.

If investigation of one problem exceeds 10 minutes without a clear implementation direction, simplify the approach, choose an existing pattern, or remove that part from scope.

## Slice policy

A slice should be independently understandable, reviewable, and move the demo forward.

Do not start a slice if:

- it is optional and feature freeze is less than 20 minutes away;
- its estimated completion would cross feature freeze;
- it requires broad architectural work unrelated to the core demo;
- it depends on unresolved external access, secrets, production coordination, or hardware acceptance.

When uncertain, preserve the current working slice and move to verification.

## Scope lock — minute 60

At minute 60:

- do not add new outcome requirements;
- do not broaden the architecture merely because more possibilities were discovered;
- convert non-essential discoveries into `GOAL.md` deferred work;
- finish only work necessary for the agreed demo path.

## Feature freeze — minute 90

At minute 90:

- do not start new features;
- finish only the current coherent change if it is near completion;
- fix defects that block the demo;
- run focused verification;
- remove or disable incomplete optional behavior rather than carrying broken partial work;
- reconcile the workboard and acceptance criteria in `GOAL.md`;
- update `CURRENT.md` with the actual phase, evidence, and next action.

## Code freeze — minute 105

At minute 105:

- stop normal source changes;
- permit only a critical build-breaking or demo-blocking correction;
- prepare the exact demo path;
- update README/demo instructions if needed;
- capture screenshots, sample data, or commands required for presentation;
- record verification results and limitations.

Do not reopen scope because extra time appears to remain.

## Engineering stop — minute 115

At minute 115, stop editing, testing, refactoring, and reviewing.

Use the remaining time only to persist state and write the final handoff.

The final repository state must let another agent continue without the previous chat.

The handoff must state:

- exact outcome achieved;
- current phase;
- branch/revision and dirty paths;
- what was implemented;
- what verification actually ran and its result;
- the demo path and whether it was observed;
- open acceptance;
- omitted or incomplete functionality;
- known defects or unverified assumptions;
- the single exact next unmet criterion.

## Verification strategy

During implementation:

- prefer focused tests;
- build only affected targets;
- avoid repeatedly running the full test suite;
- do not chase unrelated failures.

After feature freeze:

- run the highest-value verification that fits within the remaining budget;
- full repository checks are optional when expensive;
- never sacrifice a demonstrable working result merely to reach a higher evidence level.

See `contexts/VERIFICATION.md` for commands and evidence labels.

## Review policy

Self-review the actual changed diff.

Do not launch independent or subagent review unless:

- the user explicitly requests it; or
- it can run concurrently without delaying the critical path.

Do not enter repeated review/fix/re-review loops unless a finding directly blocks the core demo or exposes a serious correctness/security issue.

## Branching and worktrees

Use one feature branch by default.

Use a dedicated worktree only when necessary to protect existing user work or concurrent writers.

Do not create additional branches or worktrees solely because the long-form workflow would normally recommend them.

Preserve unrelated changes. Never use destructive reset/checkout operations to force a clean tree.

## Failure policy

If the complete feature cannot fit:

1. preserve the smallest working vertical slice;
2. move optional behavior into deferred work;
3. keep broken partial work out of the demo path;
4. record omitted functionality explicitly;
5. verify the retained slice;
6. persist accurate `CURRENT.md` and `GOAL.md` state;
7. finish demo preparation and handoff.

A smaller working result beats a larger unfinished result.

## Evidence discipline

Use these labels only when true:

1. **Implemented** — source exists in the working tree or named revision.
2. **Focused verified** — the core changed behavior has a narrow passing check and the affected target builds where applicable.
3. **Locally verified** — the selected broader local checks completed successfully.
4. **Protected** — required remote/protected-branch checks passed for the exact revision.
5. **Distributed** — the identified artifact reached its intended environment.
6. **Accepted** — a human or real environment confirmed the relevant behavior.

Do not collapse these labels into one another.

## Decision rule

Before every new action, ask:

> Does this increase the probability of a working, evidence-backed demo before minute 115 while keeping the repository resumable?

If not, defer it and record it in the goal/handoff.