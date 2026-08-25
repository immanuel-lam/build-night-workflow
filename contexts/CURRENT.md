# Current state

Keep this file concise. It is the build-night source of truth for what is true now so the next agent does not rediscover the repository.

Evidence date: **YYYY-MM-DD timezone**. Verify mutable facts again before delivery.

## Protected source

### Application

- Repository: `<owner/repo>`
- Working branch: `<branch>`
- Starting/base revision: `<sha>`
- Current revision: `<sha or working tree>`
- Integration/release target: `<branch or not required>`
- Required remote checks: `<checks or not required>`

Add another subsection only when another repository directly affects tonight's outcome.

## Current environment

- Primary target: `<app/service/package>`
- Local development state: `<known state>`
- Preview/test environment: `<known state or not used>`
- Production state: `<known state or out of scope>`
- Relevant artifact/release identifier: `<id or none>`

## Relevant owners

List only files/components directly relevant to the active outcome.

- `<path>` — `<what it owns>`
- `<path>` — `<what it owns>`

## Commands

- Focused test: `<command>`
- Affected-target build: `<command>`
- Static/type check: `<command or not needed>`
- Optional broader verification: `<command>`
- Run/demo: `<command>`

## Build-night clock

- Start time: `<recorded by script or unknown>`
- Phase: `grounding | implementation | feature-freeze | code-freeze | handoff | finished`
- Current slice: `<slice or none>`
- Feature freeze: minute 90
- Code freeze: minute 105
- Engineering stop: minute 115
- Hard end: minute 120

Run `bash scripts/build-night-status.sh` before starting another slice.

## Constraints and gotchas

Record only high-impact facts likely to waste build-night time if forgotten.

- Preserve unrelated user changes.
- Do not expand scope after minute 60.
- Add project-specific invariants here.

## Current evidence

```text
Implemented: not reached
Focused verified: not reached
Locally verified: not reached
Protected: not reached/not required
Distributed: not reached/not required
Accepted: not reached/not required
```

## Open acceptance

- Demo-path acceptance: open until observed.
- Real-environment acceptance: open unless actually observed.
- Product/human approval: open unless explicitly recorded.

## Deferred scope

- None yet.

## Next action

Replace this sentence with exactly one evidence-backed next action that still fits the current build-night phase.

## Handoff rules

Before a context reset, model switch, pause, or final handoff:

1. Record the exact branch/revision and dirty paths.
2. Record the current phase and slice.
3. Record commands and results, not completion claims.
4. Keep unknown, untested, and human-only checks open.
5. Reconcile `GOAL.md` so exactly one unfinished item is **IN PROGRESS**, unless engineering has stopped.
6. Name one exact next action.

After a reset, the next agent reads this file, `GOAL.md`, checks Git state, checks the timer, and continues from the first unmet criterion that still fits the phase.