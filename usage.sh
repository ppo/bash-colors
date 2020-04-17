#!/usr/bin/env bash

. bash-colors.sh

echo
echo -e "`c Ws`Usage:`c` `c Y`\$(`c C`c `c M`<flags>`c Y`)`c` inside an `c B`echo `c M`-e`c` or `c B`printf`c`"
echo -e "    Or `c Y`\$(`c C`c`c Y`)`c` to reset"
echo
echo -e "`c Ws`Flags:`c`"
echo -e "  The single parameter of the function is composed of one or several 1-character flags."
echo -e "  By convention in this order: reset, foreground, background, formats."
echo -e "  Or in regex language: `c Ms`0`c SC`?`c Ms`S`c SC`?`c G`[`c Ms`KRGYBMCW`c GS`]`c C`?`c G`[`c Ms`krgybmcw`c GS`]`c C`?`c G`[`c Ms`sufn`c GS`]`c C`*`c`"
echo
echo -e "  `c Kw`  Fg/Bg   Style     Octal             `c`   `c Kw`  Code   Style             Octal     `c`"
echo -e "  │  `c Ms`K`c`/`c Ms`k`c`  │ `c Ws`Black`c`   │ \\\033[ + 3/4 + 0m │   │   `c Ms`s`c`  │ `c Ws`Bold (strong)`c`   │ \\\033[1m  │"
echo -e "  │  `c Ms`R`c`/`c Ms`r`c`  │ `c Ws`Red`c`     │ \\\033[ + 3/4 + 1m │   │   `c Ms`u`c`  │ `c Ws`Underline`c`       │ \\\033[4m  │"
echo -e "  │  `c Ms`G`c`/`c Ms`g`c`  │ `c Ws`Green`c`   │ \\\033[ + 3/4 + 2m │   │   `c Ms`f`c`  │ `c Ws`Blink (flash)`c`   │ \\\033[5m  │"
echo -e "  │  `c Ms`Y`c`/`c Ms`y`c`  │ `c Ws`Yellow`c`  │ \\\033[ + 3/4 + 3m │   │   `c Ms`n`c`  │ `c Ws`Negative`c`        │ \\\033[7m  │"
echo -e "  │  `c Ms`B`c`/`c Ms`b`c`  │ `c Ws`Blue`c`    │ \\\033[ + 3/4 + 4m │   ├──────┼─────────────────┼──────────┤"
echo -e "  │  `c Ms`M`c`/`c Ms`m`c`  │ `c Ws`Magenta`c` │ \\\033[ + 3/4 + 5m │   │   `c Ms`S`c`  │ `c Ws`Normal (unbold)`c` │ \\\033[22m │"
echo -e "  │  `c Ms`C`c`/`c Ms`c`c`  │ `c Ws`Cyan`c`    │ \\\033[ + 3/4 + 6m │   │   `c Ms`0`c`  │ `c Ws`Reset`c`           │ \\\033[0m  │"
echo -e "  │  `c Ms`W`c`/`c Ms`w`c`  │ `c Ws`White`c`   │ \\\033[ + 3/4 + 7m │   └──────┴─────────────────┴──────────┘"
echo -e "  └───────┴─────────┴──────────────────┘"
echo
echo -e "`c Ws`Remark:`c`"
echo -e "  - Reset must come before the others… or it will undo immediately the formatting! So `c Y`\$(`c C`c `c M`0s`c Y`)`c` and not `c Y`\$(`c C`c `c M`s0`c Y`)`c`."
echo
echo -e "`c Ws`Examples:`c`"
echo -e "  `c B`printf `c G`\"`c Y`\$(`c C`c `c M`0Ws`c Y`)`c G`Bold white`c Y`\$(`c C`c`c Y`)`c G` and normal\"`c`"
echo -e "    => `c Ws`Bold white`c` and normal"
echo -e "  `c B`echo `c M`-e `c G`\"Normal text… `c Y`\$(`c C`c `c M`Rys`c Y`)`c G`BOLD red text on yellow background… `c Y`\$(`c C`c `c M`w`c Y`)`c G`now on white background… `c Y`\$(`c C`c `c M`0u`c Y`)`c G` reset and underline… `c Y`\$(`c C`c`c Y`)`c G` and back to normal.\"`c`"
echo -e "    => Normal text… `c Rys`BOLD red text on yellow background… `c w`now on white background… `c 0u` reset and underline… `c` and back to normal."
echo
