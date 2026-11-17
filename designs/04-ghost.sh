#!/usr/bin/env bash
# DESIGN 04 / GHOST
# Тон: Watch Dogs + whoami. Диалог с машиной, hex-шум и короткий удар «whoami → root».
set -u

E=$'\033'; RST="${E}[0m"; BOLD="${E}[1m"; DIM="${E}[2m"
step=${STEP:-0.05}

line() { printf '%s\n' "$*"; sleep "$step"; }
finish() {
  if [[ ${PREVIEW:-0} == 1 ]]; then
    printf '%s── preview 04 / ghost ──%s\n' "$DIM" "$RST"
  else
    printf '%s[2J%s[H' "$E" "$E"
  fi
}

printf '%s  7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00   0x7f3a%s\n' "$DIM" "$RST"
line ""
printf '%s  > init --session ghost ............... ok%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  > netmask ............................ 255.255.255.0%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  > attach /proc/4444 ................. %sattached%s\n' "$DIM" "$BOLD" "$RST"; sleep "$step"
printf '%s  > trace route ....................... null%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  > log wipe .......................... %scomplete%s\n' "$DIM" "$BOLD" "$RST"; sleep "$step"
line ""
printf '%s  $ whoami%s\n' "$BOLD" "$RST"; sleep 0.14
printf '%s  root%s\n' "$BOLD" "$RST"; sleep 0.14
printf '%s  $ %s' "$BOLD" "$RST"; sleep 0.18; printf '\n'
line ""
finish
