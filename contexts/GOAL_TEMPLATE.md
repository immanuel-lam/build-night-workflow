# Goal: <one concrete outcome>

> Template instruction: Copy this file to a root `GOAL_<OUTCOME>.md` when no active goal owns a substantial request. Register it in `contexts/GOALS.md` before editing source, then delete this instruction.

Status: **active**

## Outcome

Describe the user-visible result and terminal condition. Define the requested outcome, not every adjacent improvement that could be made.

## Scope

- In scope: `<repositories, components, services, and user flows>`.
- Out of scope: `<adjacent work that is not required for this outcome>`.
- Protected base: `<repository, branch, and exact starting SHA>`.

## Non-negotiable invariants

- Preserve correctness, privacy, accessibility, and existing user work.
- Add task-specific invariants here.

## Workboard

Keep exactly one item marked **IN PROGRESS**. Update this section after material verification results and before compaction or handoff.

Do not turn optional polish, broad refactors, exhaustive edge-case hunting, repeated review rounds, remote monitoring, or release work into implicit requirements unless the requested outcome or risk requires them.

- [ ] **IN PROGRESS** Observe the current behaviour and identify the owning code.
- [ ] Identify the smallest safe implementation boundary and important edge cases.
- [ ] Implement one coherent source change.
- [ ] Run focused verification and build/compile the touched target where applicable.
- [ ] Self-review the task diff and fix material findings.
- [ ] Run any additional checks required by the change risk or requested deliverable.
- [ ] Complete authorised Git/delivery actions that are actually in scope; hand off the rest.
- [ ] Update `CURRENT.md`, this goal, and any useful durable history.

## Acceptance criteria

### Source

- [ ] `<observable source behaviour>`

### Verification

- [ ] `<focused regression, direct smoke, or other minimum evidence>`
- [ ] `<additional gate only when required by risk or requested delivery>`

### Review

- [ ] The task diff was self-reviewed; independent review is recorded only when required or performed.

### Delivery

- [ ] `<requested branch/PR/deployment/handoff criterion, or explicitly not required>`

### Physical acceptance

- [ ] `<real-environment or human-observed acceptance; leave open if not observed>`

## Evidence log

Record exact base/head SHAs, commands, results, PRs, CI runs, deployment observations, and limitations. Do not turn planned evidence into a claim.

## Deferred work

Record useful adjacent work that was intentionally kept out of the requested outcome.

- None.

## Blocking questions

None.

Only record a question when no safe reversible assumption can continue the goal. An unfinished optional check or external system still running is not automatically a blocker.

## Handoff

State the exact requested outcome reached so far, current branch/revision, uncommitted paths, verification actually run, open acceptance, deferred work, and the single best next action. Do not paste the prior chat.
