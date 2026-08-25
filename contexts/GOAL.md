# Goal: <one concrete demoable outcome>

Status: **active**

## Outcome

Describe the user-visible result and terminal condition. Define the whole build-night outcome, not merely the next patch.

## Demo path

Describe the shortest reliable path that proves the outcome.

1. `<start the app/service>`
2. `<navigate or invoke>`
3. `<perform the new behavior>`
4. `<observe the expected result>`

## Scope

- In scope: `<repositories, components, services, and user flows required for the demo>`
- Out of scope: `<adjacent work intentionally deferred>`
- Protected/base source: `<repository, branch, exact starting SHA>`
- Slice cap: maximum three coherent vertical slices

## Non-negotiable invariants

- Preserve correctness, privacy, accessibility, and unrelated user work.
- Preserve existing contracts unless the goal explicitly changes them.
- Add task-specific invariants here.

## Workboard

Keep exactly one item marked **IN PROGRESS** during engineering. Update this after every material verification result, completed slice, freeze transition, compaction, or handoff.

Do not leave completed work labelled **IN PROGRESS**. Do not mark unverified behavior as accepted.

- [ ] **IN PROGRESS** Observe current behavior and identify the smallest vertical slice.
- [ ] Specify the primary demo path, important edge cases, and explicit deferred scope.
- [ ] Implement slice 1.
- [ ] Focused verify slice 1 and build the affected target.
- [ ] Implement slice 2 only if it clearly fits before feature freeze.
- [ ] Implement slice 3 only if it clearly fits before feature freeze.
- [ ] Self-review the full changed diff and fix accepted demo-blocking findings.
- [ ] At minute 90, freeze features and stabilize the retained demo path.
- [ ] Run the highest-value applicable verification that fits the remaining budget.
- [ ] At minute 105, freeze normal source changes and prepare the exact demo.
- [ ] Complete any authorised Git/PR/delivery action that fits; hand off the rest.
- [ ] At minute 115, stop engineering and write the exact handoff.

## Acceptance criteria

### Source

- [ ] `<observable source behavior required for the outcome>`

### Demo

- [ ] The primary demo path completes successfully.

### Verification

- [ ] `<focused regression or direct smoke>`
- [ ] Affected target builds/compiles where applicable.
- [ ] Any broader check actually run is recorded with its result.

### Review

- [ ] The actual diff was self-reviewed for obvious correctness, security/privacy, stale state, error paths, and demo-breaking edge cases relevant to the change.

### Delivery

- [ ] `<commit/PR/check/deployment/handoff criterion, or explicitly not required>`

### Human / real-environment acceptance

- [ ] `<manual acceptance, or explicitly leave open if not observed>`

## Evidence log

Record exact base/head SHAs, commands, results, CI checks, observations, and limitations. Planned evidence is not evidence.

```text
Implemented: not reached
Focused verified: not reached
Locally verified: not reached
Protected: not reached/not required
Distributed: not reached/not required
Accepted: not reached/not required
```

## Deferred work

Record useful work deliberately removed from the sprint so another agent can pick it up later.

- None yet.

## Blocking questions

None.

Only record a question when no safe reversible assumption can keep work inside the goal. An unfinished test or external check is not automatically a blocking question.

## Handoff

At any pause, compaction, model switch, or final stop, record:

```text
Outcome achieved so far:
Current phase:
Branch/revision:
Dirty/uncommitted paths:
Current/last completed slice:
Implemented:
Verification run and exact result:
Demo path status:
Open acceptance:
Deferred/incomplete:
Known defects or assumptions:
Next exact unmet criterion:
```

The next agent should be able to continue from this file plus `CURRENT.md`, Git state, and the timer without needing the previous chat.