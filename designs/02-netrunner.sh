#!/usr/bin/env bash
# DESIGN 02 / NETRUNNER
# Тон: Cyberpunk 2077 + Watch Dogs. Крупный логотип, глитч, жёсткий финал.
set -u

E=$'\033'; RST="${E}[0m"; BOLD="${E}[1m"; DIM="${E}[2m"
step=${STEP:-0.045}

line() { printf '%s\n' "$*"; sleep "$step"; }
glitch() {
  local target=$1 f i out
  for ((f = 0; f < 4; f++)); do
    out=""
    for ((i = 0; i < ${#target}; i++)); do
      if (( RANDOM % 6 == 0 )); then out+='▒'; else out+="${target:i:1}"; fi
    done
    printf '\r%s%s%s' "$BOLD" "$out" "$RST"
    sleep 0.035
  done
  printf '\r%s%s%s\n' "$BOLD" "$target" "$RST"
}
finish() {
  if [[ ${PREVIEW:-0} == 1 ]]; then
    printf '%s── preview 02 / netrunner ──%s\n' "$DIM" "$RST"
  else
    printf '%s[2J%s[H' "$E" "$E"
  fi
}

mapfile -t logo <<'EOF'
███╗   ██╗███████╗██████╗ ██████╗ ██████╗ ███████╗███╗   ██╗███████╗██████╗
████╗  ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝██╔══██╗
██╔██╗ ██║█████╗  ██████╔╝██████╔╝██████╔╝█████╗  ██╔██╗ ██║█████╗  ██████╔╝
██║╚██╗██║██╔══╝  ██╔══██╗██╔══██╗██╔══██╗██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗
██║ ╚████║███████╗██║  ██║██║  ██║██║  ██║███████╗██║ ╚████║███████╗██║  ██║
╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
EOF

for l in "${logo[@]}"; do
  printf '%s%s%s\n' "$BOLD" "$l" "$RST"
  sleep 0.018
done
line ""
printf '%s  NETRUNNER OS  //  build 2077.9  //  link: SECURE%s\n' "$DIM" "$RST"
line ""
printf '%s  [NET]  scan subnet .............. 12 hosts alive%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  [ICE]  black ice detected ........ avoided%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  [NET]  injecting payload ......... delivered%s\n' "$DIM" "$RST"; sleep "$step"
printf '%s  [SYS]  daemon ghosted ............ online%s\n' "$DIM" "$RST"; sleep "$step"
line ""
glitch "BREACH COMPLETE // NO TRACE LEFT"
line ""
finish
