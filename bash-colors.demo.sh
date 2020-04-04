#¡/bin/bash

. bash-colors.sh

declare -A LABELS=(
  [k]="Black" [r]="Red" [g]="Green" [y]="Yellow" [b]="Blue" [m]="Magenta" [c]="Cyan" [w]="White"
  [-]="Foreground" [_]="Background"
  [B]="Bold" [U]="Underline" [F]="Flash/blink" [N]="Negative" [BU]="Bold & underline"
  [L]="Normal" [0]="Reset"
)

for f in L B U "BU" F; do
  echo -e "\n${LABELS[$f]^^}:"
  for fc in k r g y b m c w; do
    printf "  [${fc}${f/D/}] $(c ${fc}${f})fg $(printf "%-7s" "${LABELS[$fc]}")$(c)"
    printf "  [${fc}${f/D/}N] $(c ${fc}${f}N) negative $(c)"
    for bc in k r g y b m c w; do
      # Here we use `-${fc}` and `$(c 0)` to test if it works also if used.
      printf "  [${fc}_${bc}${f/D/}] $(c -${fc}_${bc}${f}) bg $(printf "%-7s" "${LABELS[$bc]}") $(c 0)"
    done
    echo
  done
done
echo
