#!/usr/bin/env bash
set -euo pipefail

STATE_DIR=".build-night"
START_FILE="$STATE_DIR/start_epoch"
TOTAL_MINUTES=120
FEATURE_FREEZE=90
CODE_FREEZE=105
ENGINEERING_STOP=115

mkdir -p "$STATE_DIR"

cmd="${1:-status}"

case "$cmd" in
  start)
    date +%s > "$START_FILE"
    echo "Build Night timer started."
    ;;
  reset)
    rm -f "$START_FILE"
    echo "Build Night timer reset."
    exit 0
    ;;
  status)
    ;;
  *)
    echo "Usage: $0 [start|status|reset]"
    exit 1
    ;;
esac

if [[ ! -f "$START_FILE" ]]; then
  echo "Timer not started. Run: bash scripts/build-night-status.sh start"
  exit 0
fi

start_epoch="$(cat "$START_FILE")"
now_epoch="$(date +%s)"
elapsed_seconds=$(( now_epoch - start_epoch ))
if (( elapsed_seconds < 0 )); then
  elapsed_seconds=0
fi
elapsed_minutes=$(( elapsed_seconds / 60 ))
remaining=$(( TOTAL_MINUTES - elapsed_minutes ))
if (( remaining < 0 )); then remaining=0; fi

phase="IMPLEMENTATION"
recommendation="Continue the current slice. Start another only if it clearly fits before feature freeze."

if (( elapsed_minutes < 10 )); then
  phase="GROUNDING"
  recommendation="Ground the repo and define one demoable outcome. Avoid broad investigation."
elif (( elapsed_minutes < 20 )); then
  phase="PLANNING"
  recommendation="Choose the smallest working vertical slice and begin implementation."
elif (( elapsed_minutes < FEATURE_FREEZE )); then
  phase="IMPLEMENTATION"
  to_freeze=$(( FEATURE_FREEZE - elapsed_minutes ))
  if (( to_freeze <= 20 )); then
    recommendation="Complete the current slice. Do not begin optional work that could cross feature freeze."
  fi
elif (( elapsed_minutes < CODE_FREEZE )); then
  phase="FEATURE FREEZE"
  recommendation="DO NOT START NEW FEATURES. Stabilize the current result and run focused verification."
elif (( elapsed_minutes < ENGINEERING_STOP )); then
  phase="CODE FREEZE / DEMO PREP"
  recommendation="No normal source changes. Prepare the demo, record evidence, and fix only critical demo-breaking issues."
elif (( elapsed_minutes < TOTAL_MINUTES )); then
  phase="HANDOFF"
  recommendation="STOP ENGINEERING. Write the exact outcome, evidence, demo path, open work, and next action."
else
  phase="TIME EXPIRED"
  recommendation="Do not continue scope. Preserve the current state and provide the final handoff."
fi

printf '\nBUILD NIGHT\n'
printf 'Elapsed:   %d min\n' "$elapsed_minutes"
printf 'Remaining: %d min\n\n' "$remaining"
printf 'Phase: %s\n\n' "$phase"

if (( elapsed_minutes < FEATURE_FREEZE )); then
  printf 'Feature freeze: %d min\n' "$(( FEATURE_FREEZE - elapsed_minutes ))"
else
  printf 'Feature freeze: reached\n'
fi

if (( elapsed_minutes < CODE_FREEZE )); then
  printf 'Code freeze:    %d min\n' "$(( CODE_FREEZE - elapsed_minutes ))"
else
  printf 'Code freeze:    reached\n'
fi

if (( elapsed_minutes < ENGINEERING_STOP )); then
  printf 'Engineering stop: %d min\n' "$(( ENGINEERING_STOP - elapsed_minutes ))"
else
  printf 'Engineering stop: reached\n'
fi

printf '\nRecommendation:\n%s\n' "$recommendation"
