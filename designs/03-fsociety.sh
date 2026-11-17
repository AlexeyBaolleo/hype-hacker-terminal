#!/usr/bin/env bash
# DESIGN 03 / FSOCIETY
# Тон: Mr. Robot + whoami. Медленно и зловеще: здесь важна пауза.
set -u

E=$'\033'; RST="${E}[0m"; BOLD="${E}[1m"; DIM="${E}[2m"
step=${STEP:-0.09}

line() { printf '%s\n' "$*"; sleep "$step"; }
typed() {
  local s=$1 i
  for ((i = 0; i < ${#s}; i++)); do
    printf '%s' "${s:i:1}"
    sleep "${TYPE:-0.075}"
  done
  printf '\n'
}
finish() {
  if [[ ${PREVIEW:-0} == 1 ]]; then
    printf '%s── preview 03 / fsociety ──%s\n' "$DIM" "$RST"
  else
    printf '%s[2J%s[H' "$E" "$E"
  fi
}

printf '%s  f  s  o  c  i  e  t  y%s\n' "$BOLD" "$RST"
printf '%s  ─────────────────────────────────────────────%s\n' "$DIM" "$RST"
line ""
printf '%s  establishing secure channel .............. ok%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  identity .................................. nobody%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  clearance ................................. root%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  traces .................................... erased%s\n' "$DIM" "$RST"; sleep "$step"
line ""
printf '%s  ' "$DIM"; typed "we are legion."
line ""
printf '%s  ' "$BOLD"; typed "ACCESS GRANTED"
line ""
finish
