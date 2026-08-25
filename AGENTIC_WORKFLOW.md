# Agentic workflow

> Template note: this is the one file every coding agent in this repository reads in full. `CLAUDE.md` and `AGENTS.md` are deliberately thin pointers to it. Complete the project description and select one authority model below. Replace bracketed placeholders and delete template notes once populated.

`<Project name>` is `<one sentence describing what the project is and its main components/repositories>`. `<Note any sibling repositories and what they own.>`

This file is the permanent outcome contract for every coding agent in this repository. It is adapted directly from the Platform workflow for short build sessions: preserve the same grounding, goals, context routing, evidence discipline, and handoff quality, but avoid unnecessary long-running investigation, review loops, remote monitoring, and exhaustive verification.

## Authority model

> Template note: Select exactly one model and delete the other.

### Autonomous safe delivery

Use this model when the maintainer authorises the safe engineering loop in advance. The agent may investigate, edit, test, self-review, commit, push, and perform explicitly authorised delivery actions while they remain directly necessary to the requested outcome.

Do not interpret this as authority to keep inventing additional work. Stop when the requested outcome is implemented and proportionately verified, or when a product decision, destructive action, secret, production risk, external coordination, or real-environment acceptance is required.

### Human-controlled delivery

Use this model when the maintainer wants direct control over external actions. The agent can investigate, edit, test, and review within the requested scope. The human explicitly controls commits, pushes, pull requests, merges, deployment, publication, releases, messages, issues, and real-environment acceptance claims.

## Execution contract

For every substantial task:

- establish or restore one durable goal before editing;
- select one durable goal, or create one from `contexts/GOAL_TEMPLATE.md`;
- maintain a living checklist with exactly one item in progress;
- read only enough context to identify the owning code, important invariants, and a safe implementation boundary;
- begin implementation once the outcome and smallest safe change are clear;
- verify in proportion to the changed risk rather than automatically escalating to every possible gate;
- update the goal and current state before compaction or transfer; and
- hand off with the highest evidence level actually reached.

Do not spend a short task exhaustively specifying every edge case before touching code. Capture obvious correctness, security/privacy, lifecycle, and user-visible edge cases; discover additional ones through the implementation and focused verification loop.

## Gotchas that are easy to get wrong

> Template note: list five to fifteen repository-specific facts an agent would otherwise learn the hard way.

- `<example: use the pinned toolchain version>`
- `<example: state names X, Y, Z must remain distinct>`
- Preserve untracked user/raw assets. Stage explicit paths; never use `git add -A`.

Durable product, legal, privacy, and architecture rules belong in `contexts/PRODUCT_RULES.md` when needed.

## Repository boundaries

- `<state which directory/repo an agent may write to, and which sibling repositories are out of bounds>`
- Use the project's normal feature-branch and protected-PR path when applicable.
- Use a separate worktree only when it materially protects unrelated work, isolates concurrent writers, or is justified by a genuinely risky change.
- Do not create a worktree merely because a feature touches several files.

## Start or resume

1. Read this file, `contexts/CURRENT.md`, `contexts/GOALS.md`, and the active goal. Use `contexts/CONTEXT_MAP.md` to load only task-specific contracts.
2. Inspect `git status --short --branch` and the current diff. Check upstream/PR/CI state only when it is relevant to the requested work.
3. Read interrupted edits and the surrounding owner code before continuing them.
4. If no active goal owns the request, copy `contexts/GOAL_TEMPLATE.md` to a root `GOAL_*.md`, register it in `contexts/GOALS.md`, and make the outcome concrete enough to finish.
5. Maintain exactly one item marked **IN PROGRESS**.
6. Record a blocking question only when a safe reversible assumption cannot keep progress in scope.

After compaction or agent handoff, restore state from repository evidence rather than chat memory. Before transfer, update the durable goal through the last completed item and identify the next single item.

## Continuous engineering loop

Work in reviewable slices:

1. **Observe** — establish the current behaviour from the minimum useful source, test, payload, log, screenshot, or runtime evidence.
2. **Plan** — identify owners, key invariants, important failure paths, and the smallest safe change. Keep this step short once the implementation path is clear.
3. **Implement** — make one coherent change.
4. **Focused verify** — run the narrow regression and build/compile the touched target where applicable.
5. **Self-review** — read the actual diff plus relevant surrounding code. Check correctness, security/privacy, stale state, error paths, and user-visible regressions relevant to the change.
6. **Fix and repeat** — diagnose meaningful failures, add a regression where useful, and rerun affected checks.
7. **Persist** — update the active goal/current state and commit the significant step when authorised.

Do not automatically perform additional architecture analysis, broad refactors, whole-repository test passes, multiple independent reviews, or release work unless the requested outcome or risk actually requires them.

## Goal and evidence discipline

- Each acceptance criterion needs evidence appropriate to what it claims.
- Implemented is not verified; protected is not distributed; distributed is not accepted.
- Real-environment-only behaviour remains open until observed.
- Human feedback from the real environment overrides local confidence.
- A goal is complete when the requested durable criteria are satisfied or explicitly handed off, not when every theoretically useful improvement is exhausted.

## Reviews and delegation

Self-review is required for substantive source changes.

Use an independent reviewer or subagent when:

- the user asks for it;
- the change is security-, permission-, persistence-, migration-, or release-sensitive;
- the implementation is uncertain enough that a second lane is likely to catch a material defect; or
- review can run concurrently without delaying the critical path.

Do not require repeated hostile-review / fix / post-fix cycles for ordinary contained work. One proportionate review pass is enough unless it finds a material issue.

## Product-level risk check

Before declaring a user-visible change done, consider only the product surfaces plausibly affected by the change: launch/re-entry, cancellation, stale/network data, persistence, privacy/security, accessibility, performance, and cross-surface consistency.

This is a targeted game-breaker check, not a mandatory audit of the whole product. Expand it only when the change crosses those boundaries.

## Branch and worktree workflow

### Operating principles

1. Protect the working tree and unrelated user work.
2. Route by risk and concurrency, not file count alone.
3. Verify in proportion to impact.
4. Keep commits coherent and auditable.
5. Leave an accurate handoff.

### Mandatory preflight

Before editing or changing branches:

1. Run `git branch --show-current` and `git status --short`.
2. Identify unrelated existing changes and preserve them.
3. Check upstream divergence when it matters to the task.
4. Use the existing checkout for ordinary contained work when it is safe.
5. Create an isolated worktree only when the shared checkout is dirty with unrelated tracked work, multiple writers need isolation, or the change is genuinely risky.

Never use destructive reset/checkout commands or an unqualified stash merely to obtain a clean tree.

### Feature branch and PR workflow

1. Create the feature branch from the intended integration base when a branch is required.
2. Implement in coherent steps.
3. Run proportionate verification and update the active goal.
4. Review the complete task diff against the intended base.
5. If delivery is in scope, push/open a PR with what changed, verification actually run, and known limitations.
6. Monitor remote checks only when the requested task includes getting the PR through those checks. Do not wait indefinitely for remote systems when an accurate handoff is sufficient.
7. Merge or promote only with the required authority.

### Multi-agent coordination

Use separate worktrees for concurrent writing agents. Read-only agents may share a checkout. If isolation is unavailable, use one writer and keep the others read-only.

## Failure and recovery rules

- Keep verification failures visible and diagnose meaningful failures.
- Do not chase unrelated pre-existing failures unless they block the requested outcome.
- Never delete untracked files or raw assets without explicit authority.
- Prefer a small revertable commit over mixed cleanup and feature churn.
- When an optional improvement starts expanding the task, defer it instead of widening the goal.

## Protected delivery

When protected delivery is part of the request:

1. stage explicit paths;
2. push/open the PR with exact evidence and limitations;
3. inspect required check failures and fix causes;
4. never bypass protection; and
5. verify the exact merged revision before making release claims.

Protected delivery is not mandatory for every build-night task. If the user asked only for a working implementation or demo, stop after the agreed local/branch outcome and hand off the remaining delivery state accurately.

## Documentation ownership and continuity

- `contexts/CURRENT.md` contains concise mutable state and exact evidence.
- `contexts/GOALS.md` routes active substantial outcomes to root `GOAL_*.md` files.
- Finished implementation narratives may go into dated files under `contexts/` and `contexts/INDEX.md` when they are useful for future retrieval; do not create ceremony for trivial work.
- Keep unresolved real-environment acceptance unresolved.
- Record exact commands and outcomes without inflating claims.

## Terminal conditions

End the task when any of these is true:

1. the requested outcome is implemented and the minimum proportionate verification for its risk has passed;
2. the requested deliverable (for example a branch, PR, or demoable local state) has been reached and remaining external acceptance is clearly handed off;
3. a material user decision or missing authority is required; or
4. a blocker prevents safe progress and no reasonable reversible fallback remains.

Do not continue just because more safe work could theoretically be done. Do not turn polish, broader cleanup, extra edge-case hunting, additional review rounds, or release work into implicit requirements.

Lead the final handoff with outcome, exact revision/branch, tests actually run, remaining acceptance, limitations, and the single best next action.

## First-hop source map

- `contexts/CONTEXT_MAP.md` — task router and retrieval/compaction protocol
- `contexts/CURRENT.md` — current state and next work
- `contexts/GOALS.md` — active/retired goal registry
- `contexts/GOAL_TEMPLATE.md` — structure for a new durable goal
- `contexts/VERIFICATION.md` — evidence ladder and risk-based checks
- `contexts/INDEX.md` — searchable historical narrative catalogue
- `examples/codex-build-night.md` — short event example

Do not duplicate this contract back into `CLAUDE.md` or `AGENTS.md`.
