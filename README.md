# Bash Colors


#### Usage

`$(c <flags>)` inside an `echo -e` or `printf`


#### Flags

The single parameter of the function is composed of one or several 1-character flags.  
By convention in this order: reset, foreground, background, formats.  
Or in regex language: `0?(-?[krgybmcw])?(_[krgybmcw])?[BLUFN]*`

```
 ┌───────┬─────────────────┬──────────┐   ┌───────┬─────────────────┬──────────┐
 │ Code  │ Style           │ Octal    │   │ Code  │ Style           │ Octal    │
 ├───────┼─────────────────┼──────────┤   ├───────┼─────────────────┼──────────┤
 │   -   │ Foreground      │ \033[3.. │   │   B   │ Bold            │ \033[1m  │
 │   _   │ Background      │ \033[4.. │   │   U   │ Underline       │ \033[4m  │
 ├───────┼─────────────────┼──────────┤   │   F   │ Flash/blink     │ \033[5m  │
 │   k   │ Black           │ ......0m │   │   N   │ Negative        │ \033[7m  │
 │   r   │ Red             │ ......1m │   ├───────┼─────────────────┼──────────┤
 │   g   │ Green           │ ......2m │   │   L   │ Normal (unbold) │ \033[22m │
 │   y   │ Yellow          │ ......3m │   │   0   │ Reset           │ \033[0m  │
 │   b   │ Blue            │ ......4m │   └───────┴─────────────────┴──────────┘
 │   m   │ Magenta         │ ......5m │
 │   c   │ Cyan            │ ......6m │
 │   w   │ White           │ ......7m │
 └───────┴─────────────────┴──────────┘
```


#### Remarks

- The foreground/background must be right before the color. `$(c -r)` and `$(c _r)`.
- The foreground flag is optional. `$(c r)` is the same as `$(c -r)`.
- If it's the only argument, the reset flag is optional. `$(c)` is the same as `$(c 0)`.
- Reset must come before the others… or it will undo immediately the formatting! So `$(c 0B)` and not `$(c B0)`.


#### Examples

- `echo -e "$(c 0wB)Bold white$(c) and normal"`
- `echo -e "Normal text… $(c r_yB)BOLD red text on yellow background… $(c _w)now on white background… $(c 0U) reset and underline… $(c) and back to normal."`


### TODO

- Way too slow! 😞 How to improve performance? Improve regex? Compile regex?


### License

Licensed under the [MIT License](LICENSE).
