# Verification

Replace these example commands and risk rows with the commands that prove your project's invariants.

## Example command ladder

Run the narrowest relevant check first, then expand only when the change risk or requested deliverable justifies it.

```bash
project-command test --focus changed-area
project-command test --all
project-command lint
project-command package --release
project-command smoke --environment preview
```

Record the command, exit status, important output, environment, and exact revision in the active goal.

## Evidence levels

Use these labels exactly.

1. **Implemented** — source exists on a named revision or working tree.
2. **Focused verified** — the changed invariant has a narrow regression, and the touched target builds.
3. **Locally release-verified** — applicable full tests, static checks, packaging, and smokes pass.
4. **Protected** — required review and protected-branch checks passed for the exact revision.
5. **Distributed** — an identified artifact from the protected revision reached its intended environment.
6. **Accepted** — a human or the real environment confirmed the relevant behaviour.

Do not collapse these levels into one completion claim. A short build task does not need to reach every level. Stop at the highest level required by the requested outcome and record what remains open.

## Example risk matrix

| Change type | Minimum local evidence | Expand when |
| --- | --- | --- |
| Documentation or comments | Link/format or direct inspection | Text changes a contract or policy |
| Contained implementation | Focused regression and touched-target build | Shared behaviour or broad ownership changes |
| User interface | Focused test/build and direct smoke | Accessibility/device behaviour is part of the outcome |
| API or integration | Contract/failure-path check | External compatibility, retry, quota, or security risk changed |
| Data or migration | Migration/data-integrity check | Rollback/recovery or production data is involved |
| Release or deployment | Release build/package/smoke | The requested outcome includes protected delivery or distribution |

## Review

- Self-review the task diff against the intended base.
- Check changed assumptions, relevant failure paths, security/privacy boundaries, and user-visible claims.
- Add independent review when required by policy, requested by the user, or justified by risk.
- Re-run affected checks after a review change.
- Do not require repeated review loops for ordinary contained work unless a material issue is found.

## Real-environment truth

A simulator does not prove physical-device behaviour. A local server does not prove production behaviour. A built artifact does not prove distribution.

Keep these checks open until the correct person, device, service, or environment records the result.

## Delivery record

When push, pull request, merge, deployment, or release is actually in scope, record:

- the repository and branch;
- the exact revision;
- the protected-check result;
- the artifact or environment identifier when applicable;
- the observed smoke result; and
- every acceptance item that remains open.

Do not perform delivery work merely to raise the evidence label when the requested build-night outcome is already satisfied.
