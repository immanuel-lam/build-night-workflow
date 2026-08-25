# Build Night Agent Instructions

Read `BUILD_NIGHT.md`, `contexts/GOAL.md`, `contexts/CURRENT.md`, and `contexts/VERIFICATION.md` before substantial work.

This repository uses a hard 120-minute execution budget.

Follow these rules:

- optimize for one demonstrable outcome, not maximum completeness;
- keep exactly one primary goal active;
- implement no more than three coherent slices;
- check the build-night timer before beginning another slice;
- stop new feature work at minute 90;
- stop normal source changes at minute 105;
- stop engineering work at minute 115;
- reserve the final five minutes for an exact handoff;
- prefer focused tests and affected-target builds during implementation;
- do not run exhaustive repository-wide checks unless they clearly fit inside the remaining budget;
- do not launch independent review loops unless explicitly requested or fully concurrent with the critical path;
- use one feature branch by default;
- do not create extra worktrees unless needed to protect existing work;
- preserve unrelated user changes;
- never claim verification, distribution, or acceptance that did not occur.

When the full requested feature will not fit, reduce scope immediately and preserve the smallest useful working vertical slice.
