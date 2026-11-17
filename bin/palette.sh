# Палитра hype-hacker-terminal.
#
# Цвета задаются прямо в терминале, чтобы чужая тема (например, kitty на
# другой машине) не перекрашивала заставку и чистый экран после clear.
#   kitty:        OSC 30001/30101 — push/pop палитры, OSC 21 — установка цветов.
#   остальные:    OSC 10/11 — legacy foreground/background, OSC 110/111 — сброс.
# Неизвестные OSC-последовательности эмуляторы игнорируют, поэтому файл
# безопасно подключать в любом терминале.

_hht_set_colors() {
  printf '\033]21;foreground=#ffffff;background=#000000\007'
  printf '\033]10;rgb:ffff/ffff/ffff\007\033]11;rgb:0000/0000/0000\007'
}

_hht_push_colors() {
  printf '\033]30001\033\\'
  _hht_set_colors
}

_hht_pop_colors() {
  printf '\033]30101\033\\'
  printf '\033]110\007\033]111\007'
}
