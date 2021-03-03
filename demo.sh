#!/usr/bin/env bash

source bash-colors.sh

declare -A LABELS=(
  [K]="fg Black" [R]="fg Red" [G]="fg Green" [Y]="fg Yellow" [B]="fg Blue" [M]="fg Magenta" [C]="fg Cyan" [W]="fg White"
  [k]="bg Black" [r]="bg Red" [g]="bg Green" [y]="bg Yellow" [b]="bg Blue" [m]="bg Magenta" [c]="bg Cyan" [w]="bg White"
  [s]="Bold" [d]="Dim" [i]="Italic" [u]="Underline" [f]="Blink" [n]="Negative" [h]="Hidden" [t]="Strikethrough"
  [sd]="Bold & Dim" [si]="Bold & Italic" [iu]="Italic & Underline"
  [0]="Reset"
)

for f in s d i u f h t "sd" "si" "iu"; do
  echo -e "\n${LABELS[$f]^^}:"
  for fg in K R G Y B M C W; do
    printf "  [${fg}${f}] $(c ${fg}${f})$(printf "%-10s" "${LABELS[$fg]}")$(c)"
    printf "  [${fg}${f}n] $(c ${fg}${f}n) negative $(c)"
    for bg in k r g y b m c w; do
      printf "  [${fg}${bg}${f}] $(c ${fg}${bg}${f}) $(printf "%-7s" "${LABELS[$bg]}") $(c)"
    done
    echo
  done
done
echo
