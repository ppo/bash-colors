#!/usr/bin/env bash

. bash-colors.sh

declare -A COLORS=([K]=30 [R]=31 [G]=32 [Y]=33 [B]=34 [M]=35 [C]=36 [W]=37 [k]=40 [r]=41 [g]=42 [y]=43 [b]=44 [m]=45 [c]=46 [w]=47 [s]=1 [u]=4 [f]=5 [n]=7 [S]=22 [0]=0)
c1() { [ $# == 0 ] && printf "\\033[0m" || { for i in $(seq 1 ${#1}); do printf "\\033[${COLORS[${1:i-1:1}]}m"; done; }; }


TMP_FILE="${BASH_SOURCE[0]}.tmp"
declare -A LABELS=(
  [K]="fg Black" [R]="fg Red" [G]="fg Green" [Y]="fg Yellow" [B]="fg Blue" [M]="fg Magenta" [C]="fg Cyan" [W]="fg White"
  [k]="bg Black" [r]="bg Red" [g]="bg Green" [y]="bg Yellow" [b]="bg Blue" [m]="bg Magenta" [c]="bg Cyan" [w]="bg White"
  [s]="Bold" [u]="Underline" [f]="Blink" [n]="Negative" [su]="Bold & underline"
  [N]="Normal" [0]="Reset"
)

test() {
  for f in n s u f "su"; do
    echo -e "\n${LABELS[$f]^^}:"
    for fg in K R G Y B M C W; do
      printf "  [${fg}${f/D/}] $($1 ${fg}${f})$(printf "%-10s" "${LABELS[$fg]}")$($1)"
      printf "  [${fg}${f/D/}N] $($1 ${fg}${f}N) negative $($1)"
      for bg in k r g y b m c w; do
        printf "  [${fg}${bg}${f/D/}] $($1 ${fg}${bg}${f}) $(printf "%-7s" "${LABELS[$bg]}") $($1)"
      done
      echo
    done
  done
  echo
}


output="\n\n$(c Kw)  Function   Real     User     System  $(c)"
for fct in c c1; do
  { time -p test $fct; } 2> $TMP_FILE
  output="$output\n$(cat $TMP_FILE | awk '{printf $0 " "}' | awk "{printf \"│ %-8s │ %6s │ %6s │ %6s │\", \"$fct\", \$2, \$4, \$6}")"
done
echo -e "$output\n└──────────┴────────┴────────┴────────┘\n"

rm $TMP_FILE
