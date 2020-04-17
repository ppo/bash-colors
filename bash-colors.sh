#!/usr/bin/env bash

# ┌───────┬─────────┬──────────────────┐   ┌──────┬─────────────────┬──────────┐
# │ Fg/Bg │ Style   │ Octal            │   │ Code │ Style           │ Octal    │
# ├───────┼─────────┼──────────────────┤   ├──────┼─────────────────┼──────────┤
# │  K/k  │ Black   │ \033[ + 3/4 + 0m │   │   s  │ Bold (strong)   │ \033[1m  │
# │  R/r  │ Red     │ \033[ + 3/4 + 1m │   │   u  │ Underline       │ \033[4m  │
# │  G/g  │ Green   │ \033[ + 3/4 + 2m │   │   f  │ Blink (flash)   │ \033[5m  │
# │  Y/y  │ Yellow  │ \033[ + 3/4 + 3m │   │   n  │ Negative        │ \033[7m  │
# │  B/b  │ Blue    │ \033[ + 3/4 + 4m │   ├──────┼─────────────────┼──────────┤
# │  M/m  │ Magenta │ \033[ + 3/4 + 5m │   │   S  │ Normal (unbold) │ \033[22m │
# │  C/c  │ Cyan    │ \033[ + 3/4 + 6m │   │   0  │ Reset           │ \033[0m  │
# │  W/w  │ White   │ \033[ + 3/4 + 7m │   └──────┴─────────────────┴──────────┘
# └───────┴─────────┴──────────────────┘
#
# References:
#  - [WAOW! Complete explanations](https://stackoverflow.com/a/28938235/101831)
#  - [coloring functions](https://gist.github.com/inexorabletash/9122583)

c() { [ $# -eq 0 ] && echo "\033[0m" || echo "$1" | sed -E "s/(.)/‹\1›/g;s/([KRGYBMCW])/3\1/g;s/([krgybmcw])/4\1/g;s/S/22/;y/sufnKRGYBMCWkrgybmcw›/14570123456701234567m/;s/‹/\\\033[/g"; }
