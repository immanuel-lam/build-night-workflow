# Context map

Read the smallest useful bundle for the task. Follow links when the first bundle shows that another source controls the work.

| Task type | Read first | Read when needed |
| --- | --- | --- |
| Any substantial outcome | `../AGENTIC_WORKFLOW.md`, `CURRENT.md`, `GOALS.md`, the active root goal | The relevant dated context narrative |
| New substantial outcome | `../AGENTIC_WORKFLOW.md`, `CURRENT.md`, `GOAL_TEMPLATE.md` | Product or architecture sources that define acceptance |
| Small current-state change | `CURRENT.md` | `GOALS.md` when the task grows beyond one session |
| User interface or accessibility | The project design source, affected code, `VERIFICATION.md` | Platform guidance, snapshots, or device instructions |
| API or integration | The interface contract, affected code, `VERIFICATION.md` | Security, retry, quota, or compatibility sources |
| Data, persistence, or migration | The schema source, affected code, `VERIFICATION.md` | Backup, recovery, privacy, and rollout sources |
| Deployment or release | `CURRENT.md`, `VERIFICATION.md`, the release workflow | Environment, rollback, observability, and approval sources |
| Git, pull request, or merge | `CURRENT.md`, the repository Git policy | Branch protection and required-check configuration |
| Historical decision | `INDEX.md` | The linked dated narrative and the named revision |

## Retrieval rules

1. Inspect the working tree and current branch before an edit.
2. Use repository search to find the source that defines the behaviour.
3. Read linked sources only when the current task needs them.
4. Verify mutable external facts instead of trusting an old context note.
5. Stop loading context once the owning code, relevant invariant, and safe change boundary are clear.

## Precedence

1. The user's current request controls the outcome and scope.
2. Safety, legal, and platform rules control restricted actions.
3. The nearest repository instruction file controls local work.
4. The active goal controls the persistent workboard and acceptance criteria.
5. Current code, tests, and external state control factual claims.
6. Dated narratives explain history; they do not override current evidence.

## Context compaction

After a context reset, read `CURRENT.md`, `GOALS.md`, and the active root goal. Inspect Git state before continuing.

## Ownership

Update this map when the project adds a new authoritative document or recurring task type. Do not add every useful file.
