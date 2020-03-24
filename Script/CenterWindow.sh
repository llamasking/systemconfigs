#!/bin/bash
c(){ printf $(( ( $1 + ( $2 / 2 ) ) - ( $3 / 2 ) )); }

id=$(bspc query -N -n focused.window.floating) || exit 1

s=( $(wattr wh $id) ) d=( $(bspc query -T -m focused | jq -r '.rectangle[]') )
x="$(c ${d[0]} ${d[2]} ${s[0]})" y="$(c ${d[1]} ${d[3]} ${s[1]})"

wtp "$x" "$y" "${s[0]}" "${s[1]}" "$id"
