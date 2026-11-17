#!/usr/bin/env bash
# hype-hacker-terminal — установка одной командой: ./install.sh
# Работает из любого каталога: все пути вычисляются от расположения скрипта.
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ALACRITTY_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/alacritty"
ALACRITTY_CFG="$ALACRITTY_DIR/alacritty.toml"
BASHRC="$HOME/.bashrc"
STAMP="$(date +%s)"

echo "hype-hacker-terminal"
echo "  repo: $ROOT"

# 1. Права на скрипты — git сохранит бит исполнимости.
chmod +x "$ROOT/bin/hacker-boot" "$ROOT/bin/run" "$ROOT/designs/"*.sh

# 2. Конфиг alacritty. Свой симлинк обновляем молча, чужой файл — бэкапим.
mkdir -p "$ALACRITTY_DIR"
if [[ -L "$ALACRITTY_CFG" ]]; then
  if [[ "$(readlink "$ALACRITTY_CFG")" != "$ROOT/alacritty.toml" ]]; then
    rm "$ALACRITTY_CFG"
    ln -s "$ROOT/alacritty.toml" "$ALACRITTY_CFG"
    echo "  alacritty: симлинк обновлён"
  else
    echo "  alacritty: уже настроен"
  fi
elif [[ -e "$ALACRITTY_CFG" ]]; then
  mv "$ALACRITTY_CFG" "$ALACRITTY_CFG.bak.$STAMP"
  ln -s "$ROOT/alacritty.toml" "$ALACRITTY_CFG"
  echo "  alacritty: старый конфиг → $ALACRITTY_CFG.bak.$STAMP"
else
  ln -s "$ROOT/alacritty.toml" "$ALACRITTY_CFG"
  echo "  alacritty: симлинк создан"
fi

# 3. Подключение bash-профиля. Строка всегда ровно одна, при переустановке
#    старая удаляется и заменяется актуальным путём к репозиторию.
if [[ -f "$BASHRC" ]]; then
  cp -a "$BASHRC" "$BASHRC.bak.$STAMP"
  if grep -Fq 'bash/hacker.sh' "$BASHRC"; then
    sed -i '/bash\/hacker\.sh/d' "$BASHRC"
  fi
fi
printf '\n# hype-hacker-terminal\n. "%s/bash/hacker.sh"\n' "$ROOT" >> "$BASHRC"
echo "  bashrc: $BASHRC (бэкап .bak.$STAMP)"

echo "Готово. Открой новый терминал — старые окна alacritty нужно перезапустить."
