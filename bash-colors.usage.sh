#¡/bin/bash

. bash-colors.sh

echo
echo -e "`c wB`Usage:`c` `c y`\$(`c c`c `c m`<flags>`c y`)`c` inside an `c b`echo `c m`-e`c` or `c b`printf`c`"
echo
echo -e " `c wB`Flags:`c`"
echo -e "   The single parameter of the function is composed of one or several 1-character flags."
echo -e "   By convention in this order: reset, foreground, background, formats."
echo -e "   Or in regex language: `c mB`0`c cL`?`c y`(`c mB`-`c cL`?`c g`[`c mB`krgybmcw`c gL`]`c y`)`c c`?`c y`(`c mB`_`c gL`[`c mB`krgybmcw`c gL`]`c y`)`c c`?`c g`[`c mB`BLUFN`c gL`]`c c`*`c`"
echo
echo -e "   `c k_w`  Code    Style             Octal     `c`   `c k_w`  Code    Style             Octal     `c`"
echo -e "   │   `c mB`-`c`   │ `c wB`Foreground`c`      │ \\\033[3.. │   │   `c mB`B`c`   │ `c wB`Bold`c`            │ \\\033[1m  │"
echo -e "   │   `c mB`_`c`   │ `c wB`Background`c`      │ \\\033[4.. │   │   `c mB`U`c`   │ `c wB`Underline`c`       │ \\\033[4m  │"
echo -e "   ├───────┼─────────────────┼──────────┤   │   `c mB`F`c`   │ `c wB`Flash/blink`c`     │ \\\033[5m  │"
echo -e "   │   `c mB`k`c`   │ `c wB`Black`c`           │ ......0m │   │   `c mB`N`c`   │ `c wB`Negative`c`        │ \\\033[7m  │"
echo -e "   │   `c mB`r`c`   │ `c wB`Red`c`             │ ......1m │   ├───────┼─────────────────┼──────────┤"
echo -e "   │   `c mB`g`c`   │ `c wB`Green`c`           │ ......2m │   │   `c mB`L`c`   │ `c wB`Normal (unbold)`c` │ \\\033[22m │"
echo -e "   │   `c mB`y`c`   │ `c wB`Yellow`c`          │ ......3m │   │   `c mB`0`c`   │ `c wB`Reset`c`           │ \\\033[0m  │"
echo -e "   │   `c mB`b`c`   │ `c wB`Blue`c`            │ ......4m │   └───────┴─────────────────┴──────────┘"
echo -e "   │   `c mB`m`c`   │ `c wB`Magenta`c`         │ ......5m │"
echo -e "   │   `c mB`c`c`   │ `c wB`Cyan`c`            │ ......6m │"
echo -e "   │   `c mB`w`c`   │ `c wB`White`c`           │ ......7m │"
echo -e "   └───────┴─────────────────┴──────────┘"
echo
echo -e " `c wB`Remarks:`c`"
echo -e "   - The foreground/background must be right before the color. `c y`\$(`c c`c `c m`-r`c y`)`c` and `c y`\$(`c c`c `c m`_r`c y`)`c`."
echo -e "   - The foreground flag is optional. `c y`\$(`c c`c `c m`r`c y`)`c` is the same as `c y`\$(`c c`c `c m`-r`c y`)`c`."
echo -e "   - If it's the only argument, the reset flag is optional. `c y`\$(`c c`c`c y`)`c` is the same as `c y`\$(`c c`c `c m`0`c y`)`c`."
echo -e "   - Reset must come before the others… or it will undo immediately the formatting! So `c y`\$(`c c`c `c m`0B`c y`)`c` and not `c y`\$(`c c`c `c m`B0`c y`)`c`."
echo
echo -e " `c wB`Examples:`c`"
echo -e "   `c b`echo `c m`-e `c g`\"`c y`\$(`c c`c `c m`0wB`c y`)`c g`Bold white`c y`\$(`c c`c`c y`)`c g` and normal\"`c`"
echo -e "     => `c wB`Bold white`c` and normal"
echo -e "   `c b`echo `c m`-e `c g`\"Normal text… `c y`\$(`c c`c `c m`r_yB`c y`)`c g`BOLD red text on yellow background… `c y`\$(`c c`c `c m`_w`c y`)`c g`now on white background… `c y`\$(`c c`c `c m`0U`c y`)`c g` reset and underline… `c y`\$(`c c`c`c y`)`c g` and back to normal.\"`c`"
echo -e "     => Normal text… `c r_yB`BOLD red text on yellow background… `c _w`now on white background… `c 0U` reset and underline… `c` and back to normal."
echo
