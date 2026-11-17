#!/usr/bin/env bash
# DESIGN 05 / PYTHON RUNNER
# Анимация перед запуском твоего Python-кода + приколы (каждый раз разные).
set -u

DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
E=$'\033'; RST="${E}[0m"; BOLD="${E}[38;2;255;255;255m"; DIM="${E}[38;2;140;140;140m"
step=${STEP:-0.06}

line() { printf '%s\n' "$*"; sleep "$step"; }

gags=(
  "asking the code nicely ................ yes"
  "bribing garbage collector ............. done"
  "consulting /dev/random ................ approved"
  "checking if it works .................. it does"
  "warming up the CPU .................... 51C"
  "deploying to production ............... just kidding"
  "reading documentation ................. skipped"
  "negotiating with the kernel ........... fair terms"
  "counting lines of code ................ 42"
  "summoning stack overflow .............. answered"
  "calibrating rubber duck ............... quacks"
  "asking AI nicely ...................... refused"
)

declare -A used=()
picked=()
while (( ${#picked[@]} < 4 )); do
  idx=$((RANDOM % ${#gags[@]}))
  [[ -n ${used[$idx]:-} ]] && continue
  used[$idx]=1
  picked+=("${gags[$idx]}")
done

printf '%s  ▓▓ P A Y L O A D ▓▓%s\n' "$BOLD" "$RST"
line ""
for g in "${picked[@]}"; do
  printf '%s  > %s%s\n' "$DIM" "$g" "$RST"
  sleep "$step"
done
line ""
printf '%s  > attaching interpreter ................. python3.14%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  > mapping memory ........................ 0x7f3a ready%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  > injecting payload ..................... 99%%%s\n' "$DIM" "$RST"; sleep 0.22
printf '\r%s  > waiting for inspiration .............. ok%s\n' "$DIM" "$RST"; sleep 0.12
printf '%s  > injecting payload ..................... %s100%% OK%s\n' "$DIM" "$BOLD" "$RST"
line ""

if [[ ${PREVIEW:-0} == 1 ]]; then
  printf '%s── preview 05 / python runner ──%s\n\n' "$DIM" "$RST"
else
  printf '%s[2J%s[H' "$E" "$E"
fi

exec python3 "$DIR/py-demo.py"
