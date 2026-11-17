# Hack-профиль bash: подключается одной строкой из ~/.bashrc.
# Только интерактивный терминал с настоящим TTY.
if [[ $- != *i* || ! -t 1 ]]; then
  return 0
fi

# Корень проекта вычисляется от расположения этого файла — репозиторий
# можно клонировать и переименовывать без правки скриптов.
_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
_bin="$_root/bin"
case ":$PATH:" in
  *":$_bin:"*) ;;
  *) PATH="$_bin:$PATH" ;;
esac
export PATH

# Заставка. В конце жмётся любая клавиша, потом clear.
if [[ -x "$_bin/hacker-boot" ]]; then
  bash "$_bin/hacker-boot"
fi

# Промпт: в домашней директории просто "$ " (или "# " для root),
# в остальных — приглушённый путь и тот же знак.
__hacker_prompt() {
  if [[ $PWD == "$HOME" ]]; then
    PS1='\$ '
  else
    PS1='\[\e[2m\]\w \[\e[0m\]\$ '
  fi
}
PROMPT_COMMAND=__hacker_prompt

# Никаких подсказок команд.
shopt -u progcomp 2>/dev/null
unset -f bash_completion 2>/dev/null

# Чистый монохром.
alias ls='ls --color=never'
alias grep='grep --color=never'

# История удобна, но не болтлива.
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

unset _bin _root
