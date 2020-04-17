# Bash Colors


#### Usage

`$(c <flags>)` inside an `echo -e` or `printf`  
Or `$(c)` to reset


#### Flags

```
 ┌───────┬─────────┬──────────────────┐   ┌──────┬─────────────────┬──────────┐
 │ Fg/Bg │ Style   │ Octal            │   │ Code │ Style           │ Octal    │
 ├───────┼─────────┼──────────────────┤   ├──────┼─────────────────┼──────────┤
 │  K/k  │ Black   │ \033[ + 3/4 + 0m │   │   s  │ Bold (strong)   │ \033[1m  │
 │  R/r  │ Red     │ \033[ + 3/4 + 1m │   │   u  │ Underline       │ \033[4m  │
 │  G/g  │ Green   │ \033[ + 3/4 + 2m │   │   f  │ Blink (flash)   │ \033[5m  │
 │  Y/y  │ Yellow  │ \033[ + 3/4 + 3m │   │   n  │ Negative        │ \033[7m  │
 │  B/b  │ Blue    │ \033[ + 3/4 + 4m │   ├──────┼─────────────────┼──────────┤
 │  M/m  │ Magenta │ \033[ + 3/4 + 5m │   │   S  │ Normal (unbold) │ \033[22m │
 │  C/c  │ Cyan    │ \033[ + 3/4 + 6m │   │   0  │ Reset           │ \033[0m  │
 │  W/w  │ White   │ \033[ + 3/4 + 7m │   └──────┴─────────────────┴──────────┘
 └───────┴─────────┴──────────────────┘
```

The single parameter of the function is composed of one or several 1-character flags.  
By convention in this order: reset, foreground, background, formats.  
Or in regex language: `0?S?[KRGYBMCW]?[krgybmcw]?[sufn]*`


#### Remarks

- Reset must come before the others… or it will undo immediately the formatting! So `$(c 0s)` and not `$(c s0)`.
- Quite slow 😞


#### Examples

- `printf "$(c Ws)Bold white$(c) and normal"`
- `echo -e "Normal text… $(c Rys)BOLD red text on yellow background… $(c w)now on white background… $(c 0u) reset and underline… $(c) and back to normal."`


### License

Licensed under the [MIT License](LICENSE).
