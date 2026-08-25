# Build Night Workflow

A time-boxed coding-agent workflow for shipping the best demonstrable result inside a two-hour build night.

This repository is a lightweight adaptation of `PlatformTransit/workflow`, optimized for speed rather than long-running autonomous engineering.

## Objective

Finish one useful, demoable outcome within 120 minutes while preserving:

- repository grounding;
- explicit scope;
- focused verification;
- evidence-backed claims;
- an accurate final handoff.

The workflow deliberately avoids exhaustive repository analysis, long review loops, unnecessary worktrees, and repeated full-suite verification.

## Two-minute setup

1. Copy this workflow into the project repository or use it as a reference.
2. Fill in `contexts/GOAL.md` with one concrete demoable outcome.
3. Fill in `contexts/CURRENT.md` with only the repository facts needed for this build.
4. Replace placeholder commands in `contexts/VERIFICATION.md`.
5. Run `bash scripts/build-night-status.sh start`.
6. Give Codex one outcome and tell it to follow `AGENTS.md`.

## Time budget

| Elapsed | Phase | Rule |
|---|---|---|
| 0-10 min | Grounding | Understand only the relevant parts of the repo |
| 10-20 min | Planning | Define the smallest working vertical slice |
| 20-90 min | Implementation | Build up to three coherent slices |
| 90 min | Feature freeze | No new features |
| 90-105 min | Stabilization | Fix bugs and verify |
| 105 min | Code freeze | No source changes except critical build-breaking fixes |
| 105-115 min | Demo prep | README, screenshots, sample data, demo path |
| 115 min | Engineering stop | Stop implementation and verification |
| 115-120 min | Handoff | Record exact result, evidence, and open work |

## Core principle

A smaller working result beats a larger unfinished result.

## Files

```text
AGENTS.md
BUILD_NIGHT.md
contexts/
  GOAL.md
  CURRENT.md
  VERIFICATION.md
scripts/
  build-night-status.sh
```

## Starting the timer

```bash
bash scripts/build-night-status.sh start
```

Check status at any time:

```bash
bash scripts/build-night-status.sh
```

Reset the timer:

```bash
bash scripts/build-night-status.sh reset
```
