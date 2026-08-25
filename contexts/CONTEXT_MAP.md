# Context map

Read the smallest useful bundle for the task. This is the same routing principle as the full Platform workflow, compressed for a two-hour build night.

| Task type | Read first | Read when needed |
| --- | --- | --- |
| Any build-night outcome | `../AGENTS.md`, `../BUILD_NIGHT.md`, `CURRENT.md`, `GOAL.md` | `VERIFICATION.md` and directly relevant source |
| New outcome / first run | `../AGENTS.md`, `../BUILD_NIGHT.md`, `CURRENT.md`, `GOAL.md` | Product, architecture, or API contracts that define acceptance |
| Resume after compaction / new agent | `CURRENT.md`, `GOAL.md` | `VERIFICATION.md`, then inspect Git state before continuing |
| UI / accessibility | `GOAL.md`, affected UI source, `VERIFICATION.md` | Design source, snapshots, platform guidance |
| API / integration | `GOAL.md`, interface contract, affected source | Retry, quota, security, compatibility sources |
| Data / persistence | `GOAL.md`, schema/model owner, affected source | Migration, recovery, privacy rules |
| Git / PR / delivery | `CURRENT.md`, `GOAL.md`, `VERIFICATION.md` | Branch protection, CI, deployment configuration |
| Demo preparation | `GOAL.md`, `CURRENT.md` | Run instructions, sample data, screenshots |

## Retrieval rules

1. Inspect the current branch and working tree before editing.
2. Read only the source that owns the current slice.
3. Follow references outward only when the current slice requires them.
4. Verify mutable facts from Git, tests, CI, or the real environment instead of trusting stale notes.
5. Do not spend the sprint building a complete mental model of the repository.

## Precedence

1. The user's current request controls the outcome and scope.
2. Safety, legal, platform, and repository rules control restricted actions.
3. `AGENTS.md` and `BUILD_NIGHT.md` control build-night execution.
4. `GOAL.md` controls the active outcome, workboard, acceptance criteria, and deferred scope.
5. `CURRENT.md` records what is true now and the exact next action.
6. Current code, tests, Git state, CI, and real-environment observations control factual claims.
7. `VERIFICATION.md` controls evidence labels and verification priority.

## Context compaction and agent handoff

After a context reset, model switch, or new agent session:

1. read `CURRENT.md`;
2. read `GOAL.md`;
3. inspect `git status --short --branch` and the current diff;
4. run `bash scripts/build-night-status.sh`;
5. resume the first unmet workboard or acceptance item that still fits the current phase.

Do not replay completed work from memory. Repository state is the source of truth.

## Ownership

Keep this map short. Add a recurring task type only when it has a stable authoritative source worth routing to.