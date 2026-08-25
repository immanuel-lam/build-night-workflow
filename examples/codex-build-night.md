# Codex Build Night example

This example uses the same goal/current-state/evidence model as the full Platform workflow, but stops once the requested build-night outcome has proportionate evidence.

## Outcome

> Add shareable read-only links to Queueboard. Links expire after one hour and never expose editor access.

## Repository grounding

The agent records only the load-bearing facts:

- `server/routes/share.ts` owns share-link creation and resolution.
- `web/src/ShareView.tsx` owns the read-only page.
- `npm test -- share` runs the focused API tests.
- `npm run build` builds the affected application.
- Share tokens must never appear in logs.

The agent does not spend the first hour building a complete architecture model. Once the permission contract and two owners are clear, it creates `GOAL_SHARE_READ_ONLY_LINKS.md`, registers it, and begins the smallest coherent vertical slice.

## Workboard

```markdown
- [ ] **IN PROGRESS** Observe the current route, token, and permission contracts.
- [ ] Implement expiry and read-only enforcement.
- [ ] Connect the read-only browser view.
- [ ] Run focused tests and the affected build.
- [ ] Self-review the task diff for token disclosure and permission bypass.
- [ ] Hand off any optional polish or broader release work.
```

Independent review, full-suite testing, PR monitoring, deployment, and real-environment acceptance are added only if the task or risk requires them. They are not mandatory ceremony for the demo.

## Evidence

```text
Implemented: source exists on branch feature/read-only-share.
Focused verified: npm test -- share passes and npm run build succeeds.
Locally release-verified: not claimed; the full suite was not run.
Protected: not reached; opening/merging a PR was not part of this build step.
Distributed: not reached.
Accepted: maintainer acceptance remains open.
```

## Handoff

> The read-only share flow is implemented and focused-verified on `feature/read-only-share`. The demo path works locally. Full-suite, protected delivery, distribution, and maintainer acceptance were not required for this build step and remain open. The next action, if desired, is to open the PR and run the repository's protected checks.

The workflow stops here because the requested build outcome is reached. It does not keep working merely because additional safe engineering work exists.
