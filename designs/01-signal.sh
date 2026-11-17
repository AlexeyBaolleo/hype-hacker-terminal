#!/usr/bin/env bash
# DESIGN 01 / SIGNAL
# Тон: техничный, спокойный, «всё под контролем».
# Много тестов: экран должен убегать вниз.
set -u

E=$'\033'; RST="${E}[0m"; BOLD="${E}[1m"; DIM="${E}[2m"
step=${STEP:-0.014}

line() { printf '%s\n' "$*"; sleep "$step"; }
pass() {
  printf '%s  > %-44s %s[%s]%s\n' "$DIM" "$1" "$BOLD" "${2:-PASS}" "$RST"
  sleep "$step"
}
finish() {
  if [[ ${PREVIEW:-0} == 1 ]]; then
    printf '%s── preview 01 / signal ──%s\n' "$DIM" "$RST"
  else
    printf '%s[2J%s[H' "$E" "$E"
  fi
}

printf '%s────────────────────────────────────────────────────────────%s\n' "$DIM" "$RST"
printf '%s  S I G N A L%s   %ssecure shell / build 2.4.1%s\n' "$BOLD" "$RST" "$DIM" "$RST"
printf '%s────────────────────────────────────────────────────────────%s\n' "$DIM" "$RST"
sleep 0.05
line ""

printf '%s  // MR. ROBOT / FSOCIETY%s\n' "$DIM" "$RST"; sleep "$step"
pass "mounting /dev/fsociety" "OK"
pass "E Corp gateway probe" "BYPASSED"
pass "decrypting five/nine archive" "OK"
pass "fsociety key exchange" "SIGNED"
pass "impersonating Elliot" "OK"
pass "Steel Mountain firewall" "DOWN"
pass "whitecross subnet scan" "CLEAN"
pass "reading Elliot's notes" "FOUND"
pass "patching Evil Corp ledger" "DONE"
pass "erasing Mr. Robot traces" "CLEAN"
line ""

printf '%s  // CYBERPUNK 2077 / NETRUNNER%s\n' "$DIM" "$RST"; sleep "$step"
pass "relic protocol check" "STABLE"
pass "netrunner deck: paraline" "ONLINE"
pass "icebreaker synaptiq load" "OK"
pass "uploading quickhack" "SHORT CIRCUIT"
pass "Mikoshi construct ping" "ALIVE"
pass "braindance buffer flush" "CLEAN"
pass "Arasaka tower schematic" "ACQUIRED"
pass "MaxTac scanner" "AVOIDED"
pass "ripperdoc uplink" "OK"
pass "Saburo data shard" "DECRYPTED"
pass "V's neural link sync" "OK"
line ""

printf '%s  // WATCH DOGS / ctOS%s\n' "$DIM" "$RST"; sleep "$step"
pass "ctOS handshake" "ACCEPTED"
pass "profiling recursively" "DONE"
pass "hacking public cameras" "42 FEEDS"
pass "traffic light override" "READY"
pass "DedSec node discovery" "7 NODES"
pass "Aiden signature spoof" "OK"
pass "Bloomberg terminal" "BREACHED"
pass "ctOS 2.0 root key" "GUESSED"
pass "bodycam stream" "HIJACKED"
line ""

printf '%s  // WHOAMI / MATRIX / HOLLYWOOD%s\n' "$DIM" "$RST"; sleep "$step"
pass "whoami" "NOBODY"
pass "following the white rabbit" "OK"
pass "agent detection" "NONE"
pass "red pill ingested" "OK"
pass "swapping the floppy" "OK"
pass "nuclear launch codes" "JUST KIDDING"
pass "hacking the mainframe" "CLASSIC"
pass "sudo make me a sandwich" "GRANTED"
pass "compiling luck" "OK"
pass "bribing the garbage collector" "DONE"
pass "checking Hollywood script" "PLAUSIBLE"
pass "disabling self-destruct" "OK"
line ""

printf '%s  // CORE SYSTEMS%s\n' "$DIM" "$RST"; sleep "$step"
pass "loading kernel modules" "PASS"
pass "mounting encrypted volume" "OK"
pass "spoofing mac address" "OK"
pass "bypassing perimeter firewall" "OK"
pass "scanning open ports" "CLEAN"
pass "rotating proxy chain" "7 HOPS"
pass "shadowing process table" "HIDDEN"
pass "allocating shellcode" "0x7F3A"
pass "hooking libc calls" "OK"
pass "masking PID 4444" "OK"
pass "sniffing eth0" "QUIET"
pass "spoofing DNS cache" "OK"
pass "climbing trust chain" "ROOT"
pass "reading /etc/shadow" "GRANTED"
pass "erasing shell history" "CLEAN"
pass "engaging ghost protocol" "ONLINE"
line ""

for ((i = 1; i <= 40; i++)); do
  fill=$(printf '%*s' "$i" ''); fill=${fill// /█}
  empty=$(printf '%*s' "$((40 - i))" ''); empty=${empty// /░}
  printf '\r%s  [%s%s] %3d%%%s' "$DIM" "$fill" "$empty" "$((i * 100 / 40))" "$RST"
  sleep 0.007
done
printf '\n'
line ""
printf '%s  SESSION READY%s\n' "$BOLD" "$RST"
line ""
finish
