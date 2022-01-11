# Bash Colors

### KISS

```bash
# Colors. Uppercase = bold.
if ((`tput colors` >= 8)); then
  readonly reset="\e[0m"
  readonly black="\e[0;30m";   readonly BLACK="\e[1;30m"
  readonly red="\e[0;31m";     readonly RED="\e[1;31m"
  readonly green="\e[0;32m";   readonly GREEN="\e[1;32m"
  readonly yellow="\e[0;33m";  readonly YELLOW="\e[1;33m"
  readonly blue="\e[0;34m";    readonly BLUE="\e[1;34m"
  readonly magenta="\e[0;35m"; readonly MAGENTA="\e[1;35m"
  readonly cyan="\e[0;36m";    readonly CYAN="\e[1;36m"
  readonly white="\e[0;37m";   readonly WHITE="\e[1;37m"
fi
```

---

### Usage

`$(c <flags>)` inside an `echo -e` or `printf`  
Or `$(c)` to reset

`cecho <flags> <text>` is a shortcut for `echo -e "$(c <flags>)<text>$(c)"`


### Flags

```
 ┌───────┬────────────────┬─────────────────┐   ┌───────┬─────────────────┬───────┐
 │ Fg/Bg │ Color          │ Octal           │   │ Code  │ Style           │ Octal │
 ├───────┼────────────────┼─────────────────┤   ├───────┼─────────────────┼───────┤
 │  K/k  │ Black          │ \e[ + 3/4  + 0m │   │  s/S  │ Bold (strong)   │ \e[1m │
 │  R/r  │ Red            │ \e[ + 3/4  + 1m │   │  d/D  │ Dim             │ \e[2m │
 │  G/g  │ Green          │ \e[ + 3/4  + 2m │   │  i/I  │ Italic          │ \e[3m │
 │  Y/y  │ Yellow         │ \e[ + 3/4  + 3m │   │  u/U  │ Underline       │ \e[4m │
 │  B/b  │ Blue           │ \e[ + 3/4  + 4m │   │  f/F  │ Blink (flash)   │ \e[5m │
 │  M/m  │ Magenta        │ \e[ + 3/4  + 5m │   │  n/N  │ Negative        │ \e[7m │
 │  C/c  │ Cyan           │ \e[ + 3/4  + 6m │   │  h/H  │ Hidden          │ \e[8m │
 │  W/w  │ White          │ \e[ + 3/4  + 7m │   │  t/T  │ Strikethrough   │ \e[9m │
 ├───────┴────────────────┴─────────────────┤   ├───────┼─────────────────┼───────┤
 │  High intensity        │ \e[ + 9/10 + *m │   │   0   │ Reset           │ \e[0m │
 └────────────────────────┴─────────────────┘   └───────┴─────────────────┴───────┘
                                                 Uppercase = Reset a style: \e[2*m
```

The single parameter of the function is composed of one or several 1-character flags.  
By convention in this order: reset, formats, foreground, background.  
Or in regex language: `0?S?[sdiufn-]*[KRGYBMCW]?[krgybmcw]?`


### Remarks

- Reset must come before the others… or it will undo immediately the formatting! So `$(c 0s)` and not `$(c s0)`.
- @TODO: `h` for high intensity is not yet implemented.
- Quite slow 😞


### Examples

- `printf "$(c sW)Bold white$(c) and normal"`
- `echo -e "Normal text… $(c sRy)BOLD red text on yellow background… $(c w)now on white background… $(c 0u) reset and underline… $(c) and back to normal."`
- `cecho Wb "White text on blue background"`


## References:

- [Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
- [Very complete explanations on StackOverflow](https://stackoverflow.com/a/28938235/101831)
- [Coloring functions](https://gist.github.com/inexorabletash/9122583)


## License

Licensed under the [MIT License](LICENSE).
