# Build Night Verification

Verification is proportional to the remaining time and the risk of the changed behavior.

## Commands

Replace these placeholders before the sprint begins.

```text
Focused test: <command>
Affected-target build: <command>
Optional broader test: <command>
Lint/static check: <command>
Demo/run command: <command>
```

## During implementation

Prefer the cheapest checks that directly protect the current slice:

- narrow regression for the changed behavior;
- build/compile the affected target;
- targeted lint/typecheck when relevant;
- direct smoke of the demo path.

Do not repeatedly run expensive full-suite checks after every slice.

## After feature freeze

At minute 90, stop adding features and spend the remaining engineering budget on the highest-value checks that fit.

Priority order:

1. Core demo path works.
2. Focused regression passes.
3. Affected target builds/compiles.
4. Static/type checks for touched code.
5. Broader tests if they fit comfortably before code freeze.

If a full-suite check is known to take a large fraction of the remaining time, skip it and document that it was not run.

## Failure handling

When a check fails:

- diagnose the first meaningful failure;
- fix only failures caused by or blocking the build-night outcome;
- do not chase unrelated pre-existing failures;
- do not rerun flaky tests repeatedly until green without understanding the failure;
- if a fix threatens the deadline, reduce scope and preserve the working slice.

## Evidence labels

Use these labels exactly and only when supported:

1. **Implemented** — source exists in the working tree or named revision.
2. **Focused verified** — the core changed behavior has a narrow passing check and the affected target builds where applicable.
3. **Locally verified** — selected broader local checks pass.
4. **Protected** — required remote/protected-branch checks pass for the exact revision.
5. **Distributed** — an identified artifact reaches its intended environment.
6. **Accepted** — a human or real environment confirms the relevant behavior.

A lower level does not imply a higher one.

## Handoff evidence format

```text
Implemented: <what exists and where>
Focused verified: <commands and results or not reached>
Locally verified: <commands and results or not reached>
Protected: <status or not required/not reached>
Distributed: <status or not required/not reached>
Accepted: <status or not required/not reached>
```
