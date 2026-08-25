# Build Night Workflow

A two-hour adaptation of `PlatformTransit/workflow` that keeps the same durable five-file operating model while aggressively time-boxing implementation, review, and verification.

The goal is not to invent a separate workflow. It is to run the Platform workflow in sprint mode.

## Five key files

```text
AGENTS.md
  ↓
contexts/CONTEXT_MAP.md
  ↓
contexts/CURRENT.md
  ↓
contexts/GOAL.md
  ↓
contexts/VERIFICATION.md
```

They serve the same roles as the full workflow:

- `AGENTS.md` — entry point and permanent agent rules.
- `CONTEXT_MAP.md` — read only what matters for the current task.
- `CURRENT.md` — evidence-backed current repository truth and exact next action.
- `GOAL.md` — one outcome, one workboard, acceptance criteria, evidence, deferred work, and handoff.
- `VERIFICATION.md` — commands, verification priority, and what the evidence actually proves.

`BUILD_NIGHT.md` overlays a hard 120-minute execution contract. The timer changes how much work fits; it does not replace grounding, goal discipline, context routing, evidence, or handoff continuity.

## Why this is similar to the full Platform workflow

The agent should be able to stop, compact, switch models, or hand work to another agent and continue from repository state instead of chat memory.

The loop is:

```text
GROUND FROM REPO STATE
        ↓
READ ONLY RELEVANT CONTEXT
        ↓
RESTORE ONE ACTIVE OUTCOME
        ↓
IMPLEMENT ONE COHERENT SLICE
        ↓
FOCUSED VERIFY + SELF-REVIEW
        ↓
PERSIST CURRENT STATE + EVIDENCE
        ↓
CHECK TIMER
   ┌────┴────┐
continue    freeze
   │          ↓
   └────→ stabilize → demo → handoff
```

## Two-minute setup

1. Copy these files into the project repository or start from this template.
2. Fill in `contexts/CURRENT.md` from actual repository evidence.
3. Fill in `contexts/GOAL.md` with one concrete demoable outcome.
4. Update `contexts/CONTEXT_MAP.md` only if the project has stable authoritative sources worth routing to.
5. Replace placeholder commands in `contexts/VERIFICATION.md`.
6. Run `bash scripts/build-night-status.sh start`.
7. Give Codex one outcome and tell it to follow `AGENTS.md`.

## Time budget

| Elapsed | Phase | Rule |
|---|---|---|
| 0-10 min | Grounding | Restore repo truth, goal, owners, and demo path |
| 10-20 min | Planning | Define the smallest working vertical slice and key edge cases |
| 20-60 min | Implementation | Build the highest-value vertical slices |
| 60 min | Scope lock | No scope expansion |
| 60-90 min | Implementation | Finish only slices that clearly fit |
| 90 min | Feature freeze | No new features |
| 90-105 min | Stabilization | Fix demo blockers, self-review, verify |
| 105 min | Code freeze | No normal source changes |
| 105-115 min | Demo prep | Prepare exact demo path and evidence |
| 115 min | Engineering stop | Stop implementation, testing, and review |
| 115-120 min | Handoff | Persist exact result, evidence, open work, next action |

## Resume behavior

After compaction, model switch, or a new agent session:

1. read `contexts/CURRENT.md`;
2. read `contexts/GOAL.md`;
3. inspect Git status and the current diff;
4. run `bash scripts/build-night-status.sh`;
5. continue the first unmet criterion that still fits the current phase.

The next agent should not need the previous chat.

## Evidence discipline

The workflow preserves the Platform evidence separation:

1. **Implemented**
2. **Focused verified**
3. **Locally verified**
4. **Protected**
5. **Distributed**
6. **Accepted**

A lower level never implies a higher one.

## Core build-night rule

A smaller working result with accurate evidence and handoff is better than a larger unfinished result.

## Files

```text
AGENTS.md
BUILD_NIGHT.md
contexts/
  CONTEXT_MAP.md
  CURRENT.md
  GOAL.md
  VERIFICATION.md
scripts/
  build-night-status.sh
```

## Timer

Start:

```bash
bash scripts/build-night-status.sh start
```

Status:

```bash
bash scripts/build-night-status.sh
```

Reset:

```bash
bash scripts/build-night-status.sh reset
```
