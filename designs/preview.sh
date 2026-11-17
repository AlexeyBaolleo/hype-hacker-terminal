#!/usr/bin/env bash
# Просмотр прототипов заставок.
#   ./preview.sh 6        — финальный гибрид
#   ./preview.sh all      — все по очереди
#   ./preview.sh py       — анимация Python-раннера
set -u

DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

case ${1:-} in
  1|signal)    file=01-signal.sh ;;
  2|netrunner) file=02-netrunner.sh ;;
  3|fsociety)  file=03-fsociety.sh ;;
  4|ghost)     file=04-ghost.sh ;;
  5|python)    file=05-python.sh ;;
  6|composite|final) file=06-composite.sh ;;
  all)
    for n in 01-signal 02-netrunner 03-fsociety 04-ghost 05-python 06-composite; do
      printf '\n>>> %s\n' "$n"
      PREVIEW=1 bash "$DIR/$n.sh"
      if [[ $n != 06-composite ]]; then
        read -rsp 'Enter — следующий дизайн…' _
        printf '\n'
      fi
    done
    exit 0
    ;;
  *)
    printf 'usage: preview.sh {1|2|3|4|5|py|6|all}\n' >&2
    exit 2
    ;;
esac

PREVIEW=1 bash "$DIR/$file"
