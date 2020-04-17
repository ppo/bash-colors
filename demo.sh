#!/usr/bin/env bash

. bash-colors.sh

declare -A LABELS=(
  [K]="fg Black" [R]="fg Red" [G]="fg Green" [Y]="fg Yellow" [B]="fg Blue" [M]="fg Magenta" [C]="fg Cyan" [W]="fg White"
  [k]="bg Black" [r]="bg Red" [g]="bg Green" [y]="bg Yellow" [b]="bg Blue" [m]="bg Magenta" [c]="bg Cyan" [w]="bg White"
  [s]="Bold" [u]="Underline" [f]="Blink" [n]="Negative" [su]="Bold & underline"
  [N]="Normal" [0]="Reset"
)

for f in n s u f "su"; do
  echo -e "\n${LABELS[$f]^^}:"
  for fg in K R G Y B M C W; do
    printf "  [${fg}${f/D/}] $(c ${fg}${f})$(printf "%-10s" "${LABELS[$fg]}")$(c)"
    printf "  [${fg}${f/D/}N] $(c ${fg}${f}N) negative $(c)"
    for bg in k r g y b m c w; do
      printf "  [${fg}${bg}${f/D/}] $(c ${fg}${bg}${f}) $(printf "%-7s" "${LABELS[$bg]}") $(c)"
    done
    echo
  done
done
echo
