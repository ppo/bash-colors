#¡/bin/bash

# ┌───────┬─────────────────┬──────────┐   ┌───────┬─────────────────┬──────────┐
# │ Code  │ Style           │ Octal    │   │ Code  │ Style           │ Octal    │
# ├───────┼─────────────────┼──────────┤   ├───────┼─────────────────┼──────────┤
# │   -   │ Foreground      │ \033[3.. │   │   B   │ Bold            │ \033[1m  │
# │   _   │ Background      │ \033[4.. │   │   U   │ Underline       │ \033[4m  │
# ├───────┼─────────────────┼──────────┤   │   F   │ Flash/blink     │ \033[5m  │
# │   k   │ Black           │ ......0m │   │   N   │ Negative        │ \033[7m  │
# │   r   │ Red             │ ......1m │   ├───────┼─────────────────┼──────────┤
# │   g   │ Green           │ ......2m │   │   L   │ Normal (unbold) │ \033[22m │
# │   y   │ Yellow          │ ......3m │   │   0   │ Reset           │ \033[0m  │
# │   b   │ Blue            │ ......4m │   └───────┴─────────────────┴──────────┘
# │   m   │ Magenta         │ ......5m │
# │   c   │ Cyan            │ ......6m │
# │   w   │ White           │ ......7m │
# └───────┴─────────────────┴──────────┘
#
# References:
#  - [WAOW! Complete explanations](https://stackoverflow.com/a/28938235/101831)
#  - [coloring functions](https://gist.github.com/inexorabletash/9122583)

c() { echo "$1" | sed -E "s/(^|[^-_])([krgybmcw])/\1-\2/;s/(^$|0)/!0¡/;s/([BUFNL])/!\1¡/g;s/([-_])([krgybmcw])/!\1\2¡/g;y/BUFN-_krgybmcw/14573401234567/;s/L/22/;s/!/\\\033[/g;s/¡/m/g"; }
