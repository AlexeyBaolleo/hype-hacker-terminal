# Hacker terminal

Чёрно-белый fullscreen-терминал: быстрая заставка при открытии, чистый
промпт `$` и отдельная анимация при запуске своего Python-кода.

## Состав

```
alacritty.toml     → ~/.config/alacritty/alacritty.toml  (симлинк)
bash/hacker.sh     → подключается из ~/.bashrc
bin/hacker-boot    → заставка (гибрид: 01 + 04 + 03)
bin/run            → Python-раннер с анимацией
designs/           → прототипы, из которых собирался финальный вид
```

## Установка

Из корня репозитория (`~/dotfiles`):

```bash
mkdir -p ~/.config/alacritty
ln -sfn "$PWD/terminal/alacritty.toml" ~/.config/alacritty/alacritty.toml
cp -a ~/.bashrc ~/.bashrc.bak.$(date +%s)
printf '\n# hacker terminal\n. "$HOME/dotfiles/terminal/bash/hacker.sh"\n' >> ~/.bashrc
```

Открой новый терминал. Старые окна alacritty нужно перезапустить.

## Как это работает

- При открытии терминала: шапка из `01`, hex-дамп с инверсным выделением
  из `04`, 58 тестов с отсылками к Mr. Robot, Cyberpunk 2077, Watch Dogs,
  whoami и Матрице, `we are legion.` из `03`, затем **любая клавиша**
  и только после неё `clear`.
- В `$HOME` промпт — просто `$ ` (для root `# `), в других директориях —
  приглушённый путь и `$ `.
- Подсказки команд отключены (`shopt -u progcomp`); дополнение путей
  через Tab остаётся.
- `run script.py [args...]` — анимация, `clear`, затем настоящий `python3`.
  Команды `python`, `pip`, `uv`, `poetry` не переопределяются.

## Откат

Удали строку `. "$HOME/dotfiles/terminal/bash/hacker.sh"` из `~/.bashrc`
(или восстанови `~/.bashrc.bak.*`) и симлинк
`~/.config/alacritty/alacritty.toml`.
