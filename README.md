<!-- markdownlint-disable MD033 -->

# Workflow for Codex Build Night

This repository is a short-session adaptation of [`PlatformTransit/workflow`](https://github.com/PlatformTransit/workflow).

It keeps the same core mechanism: goals, current state, context routing, evidence, and handoff live in the repository instead of one chat. The difference is stopping behaviour. This edition tells the agent to start implementation once the safe boundary is clear, verify proportionately, and stop when the requested outcome is reached rather than continuing through every possible review, full-suite, delivery, and acceptance phase.

There are no clock phases or minute-based locks. The event can be two hours; the workflow should not spend an arbitrary portion of that time planning just because a timer says it is still in a planning phase.

## Two-minute setup

1. Use this repository as a template or copy the workflow files into the project.
2. Open [`AGENTIC_WORKFLOW.md`](AGENTIC_WORKFLOW.md) and describe the project, repositories, branches, and permanent gotchas.
3. Select one authority model in `AGENTIC_WORKFLOW.md`.
4. Replace the example commands/risk rows in [`contexts/VERIFICATION.md`](contexts/VERIFICATION.md).
5. Replace or extend task bundles in [`contexts/CONTEXT_MAP.md`](contexts/CONTEXT_MAP.md) only where the project has stable authoritative sources.
6. Rewrite [`contexts/CURRENT.md`](contexts/CURRENT.md) from repository evidence.
7. Give the agent one concrete outcome. For substantial work, create a root goal from [`contexts/GOAL_TEMPLATE.md`](contexts/GOAL_TEMPLATE.md) and register it in [`contexts/GOALS.md`](contexts/GOALS.md).

## How the files work

```text
CLAUDE.md                 thin entry point for Claude Code
AGENTS.md                 thin entry point for Codex and other agents
AGENTIC_WORKFLOW.md       project contract and engineering loop
contexts/
  CONTEXT_MAP.md          task type -> files to read
  CURRENT.md              concise mutable repository truth
  GOALS.md                active and retired outcome registry
  GOAL_TEMPLATE.md        substantial-outcome template
  VERIFICATION.md         commands, risk matrix, and evidence ladder
  INDEX.md                optional searchable finished-work index
examples/
  codex-build-night.md    short event example
```

`AGENTS.md` and `CLAUDE.md` point to one shared contract. They do not duplicate its rules.

## The short-session difference

The full Platform workflow is designed to survive long-running autonomous work and therefore includes stronger defaults around worktrees, independent review, whole-product gates, full verification, protected delivery, remote monitoring, and durable history.

This edition preserves those mechanisms when they are actually required, but changes the defaults:

- inspect only enough context to find the owner, invariants, and safe boundary;
- begin implementation as soon as that boundary is clear;
- use one coherent implementation loop rather than a long specification phase;
- self-review every substantive diff, but add independent review only when requested or justified by risk;
- run focused verification first and expand only when the changed risk or requested deliverable requires it;
- use worktrees for dirty/concurrent/risky cases, not automatically for ordinary feature work;
- monitor CI or perform protected delivery only when delivery is part of the request;
- record adjacent polish and discoveries as deferred work rather than silently widening scope; and
- stop when the requested outcome and minimum proportionate evidence are complete.

## Goals are files

A substantial task gets one root goal file, such as `GOAL_FIX_LOGIN_RETRY.md`. Register it in `contexts/GOALS.md`.

The goal contains:

- one concrete outcome;
- explicit scope and invariants;
- a workboard with exactly one item marked **IN PROGRESS**;
- acceptance criteria separated by evidence type;
- an evidence log;
- deferred work;
- blocking questions; and
- an exact handoff.

When a chat is compacted or another agent takes over, the next agent reads repository state and resumes the first unmet criterion.

## Evidence ladder

Use these labels exactly:

1. **Implemented** — source exists on a named revision or working tree.
2. **Focused verified** — the changed invariant has a narrow regression, and the touched target builds.
3. **Locally release-verified** — applicable full tests, static checks, packaging, and smokes pass.
4. **Protected** — required review and protected-branch checks passed for the exact revision.
5. **Distributed** — an identified artifact from the protected revision reached its intended environment.
6. **Accepted** — a human or the real environment confirmed the relevant behaviour.

A build-night task does not have to climb the whole ladder. Reach the level required by the requested outcome, record the truth, and hand off anything beyond it.

## Core rule

Do the smallest amount of process that gives real confidence in the requested outcome. Do not trade most of a short build session for speculative planning, exhaustive edge-case enumeration, repeated review cycles, or delivery work the user did not ask for.
