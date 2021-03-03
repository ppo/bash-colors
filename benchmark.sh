#!/usr/bin/env bash

declare -A COLORS=([K]=30 [R]=31 [G]=32 [Y]=33 [B]=34 [M]=35 [C]=36 [W]=37 [k]=40 [r]=41 [g]=42 [y]=43 [b]=44 [m]=45 [c]=46 [w]=47 [s]=1 [u]=4 [f]=5 [n]=7 [S]=22 [0]=0)
c1() { [ $# == 0 ] && printf "\e[0m" || { for i in $(seq 1 ${#1}); do printf "\e[${COLORS[${1:i-1:1}]}m"; done; }; }
c2() { [ $# == 0 ] && printf "\e[0m" || echo "$1" | sed 's/\(.\)/‹\1›/g;s/\([KRGYBMCW]\)/3\1/g;s/\([krgybmcw]\)/4\1/g;s/S/22/;y/sufnKRGYBMCWkrgybmcw›/14570123456701234567m/;s/‹/\\e[/g'; }
c3() { [ $# == 0 ] && printf "\e[0m" || echo "$1" | sed 's/\(.\)/\1;/g;s/\([KRGYBMCW]\)/3\1/g;s/\([krgybmcw]\)/4\1/g;s/S/22/;y/sufnKRGYBMCWkrgybmcw/14570123456701234567/;s/^\(.*\);$/\\e[\1m/g'; }


TMP_FILE="${BASH_SOURCE[0]}.tmp"
declare -A LABELS=(
  [K]="fg Black" [R]="fg Red" [G]="fg Green" [Y]="fg Yellow" [B]="fg Blue" [M]="fg Magenta" [C]="fg Cyan" [W]="fg White"
  [k]="bg Black" [r]="bg Red" [g]="bg Green" [y]="bg Yellow" [b]="bg Blue" [m]="bg Magenta" [c]="bg Cyan" [w]="bg White"
  [s]="Bold" [d]="Dim" [i]="Italic" [u]="Underline" [f]="Blink" [n]="Negative" [h]="Hidden" [t]="Strikethrough"
  [sd]="Bold & Dim" [si]="Bold & Italic" [iu]="Italic & Underline"
  [0]="Reset"
)

test() {
  for f in s d i u f h t "sd" "si" "iu"; do
    echo -e "\n${LABELS[$f]^^}:"
    for fg in K R G Y B M C W; do
      printf "  [${fg}${f}] $( ${1} ${fg}${f} )$( printf "%-10s" "${LABELS[$fg]}" )$( $1 )"
      printf "  [${fg}${f}n] $( ${1} ${fg}${f}n ) ${LABELS[n]} $( $1 )"
      for bg in k r g y b m c w; do
        printf "  [${fg}${bg}${f}] $( ${1} ${fg}${bg}${f} ) $( printf "%-7s" "${LABELS[$bg]}" ) $( $1 )"
      done
      echo
    done
  done
}

run_test() {
  local num=10 i
  printf "${1} × ${num}:"
  for i in $( seq $num ); do
    printf " ${i}"
    test "$1" >/dev/null
  done
  echo
}

time_test() {
  time -p run_test "$1"
}

test_all() {
  local output="\n\n\e[30;47m  Function   Real     User     System  \e[0m"
  local functions="c1 c2 c3 c4"
  local fct
  echo "Benchmarking: ${functions}"
  for fct in $functions; do
    time_test $fct 2> $TMP_FILE
    output="${output}\n$( cat "$TMP_FILE" | awk '{printf $0 " "}' | awk "{printf \"│ %-8s │ %6s │ %6s │ %6s │\", \"$fct\", \$2, \$4, \$6}" )"
  done
  echo -e "${output}\n└──────────┴────────┴────────┴────────┘\n"
  rm $TMP_FILE
}


[ -n "$1" ] && time_test $1 || test_all
