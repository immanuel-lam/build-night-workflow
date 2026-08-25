# Build Night Execution Contract

## Mission

Produce the best demonstrable working result before the 120-minute deadline.

The objective is not maximum completeness. The objective is a coherent outcome that can be shown, explained, and handed off truthfully.

## Hard limits

- Exactly one primary outcome.
- Maximum three implementation slices.
- Do not expand scope after minute 60.
- No new features after minute 90.
- No normal source changes after minute 105.
- After minute 105, only a critical build-breaking fix may change source.
- Stop all engineering work at minute 115.
- Always preserve the final five minutes for handoff.

## Start

1. Read `AGENTS.md`, this file, `contexts/GOAL.md`, `contexts/CURRENT.md`, and `contexts/VERIFICATION.md`.
2. Run `git status --short --branch` and preserve unrelated work.
3. Run `bash scripts/build-night-status.sh start` if the timer has not started.
4. Confirm the goal has one demoable outcome and a short acceptance list.
5. Inspect only the source required to implement the first vertical slice.

## Investigation budget

Do not exhaustively inspect the repository.

Read only:

1. repository instructions;
2. the active goal and current-state notes;
3. directly relevant source files;
4. dependencies or contracts required to understand those files.

Search outward only when required to complete the goal.

If investigation of one problem exceeds 10 minutes without a clear implementation direction, simplify the approach, choose an existing pattern, or remove that part from scope.

## Execution loop

Use this loop until feature freeze:

1. **Ground** — establish the relevant current behavior from source or a reproducible observation.
2. **Choose slice** — select the smallest user-visible or demo-visible vertical slice.
3. **Implement** — make one coherent change.
4. **Focused verify** — run the narrowest meaningful regression and build/compile the affected target where applicable.
5. **Self-review** — inspect the changed diff and obvious edge cases.
6. **Check timer** — run `bash scripts/build-night-status.sh` before starting another slice.
7. **Continue or freeze** — only start another slice if it clearly fits inside the remaining implementation budget.

## Slice policy

A slice should be independently understandable and move the demo forward.

Do not start a slice if:

- it is optional and feature freeze is less than 20 minutes away;
- its estimated completion would cross feature freeze;
- it requires broad architectural work unrelated to the core demo;
- it depends on unresolved external access, secrets, production coordination, or hardware acceptance.

When uncertain, preserve the current working slice and move to verification.

## Feature freeze — minute 90

At minute 90:

- do not start new features;
- finish only the current coherent change if it is near completion;
- fix defects that block the demo;
- run focused verification;
- remove or disable incomplete optional behavior rather than carrying broken partial work;
- update `contexts/CURRENT.md` with the actual state.

## Code freeze — minute 105

At minute 105:

- stop normal source changes;
- permit only a critical build-breaking or demo-blocking correction;
- prepare the exact demo path;
- update README/demo instructions if needed;
- capture screenshots, sample data, or commands required for presentation;
- record verification results.

Do not reopen scope because extra time appears to remain.

## Engineering stop — minute 115

At minute 115, stop editing, testing, refactoring, and reviewing.

Use the remaining time only for the final handoff.

The handoff must state:

- exact outcome achieved;
- branch or revision when known;
- what was implemented;
- what verification actually ran and its result;
- the demo path;
- omitted or incomplete functionality;
- any known defects or unverified assumptions;
- the single best next action.

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

See `contexts/VERIFICATION.md` for evidence labels.

## Review policy

Self-review the changed diff.

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
2. remove optional behavior;
3. keep broken partial work out of the demo path;
4. record omitted functionality explicitly;
5. verify the retained slice;
6. finish demo preparation and handoff.

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

> Does this increase the probability of a working demo before minute 115?

If not, defer it and record it in the handoff.
