#!/bin/sh

FAVS=(
  mudkip
  shellder
  abra
  squirtle
  omanyte
  kabuto
  gastly
  dratini
  eevee
  celebi
  torchic
  piplup
)

RANDOM_INDEX=$(( RANDOM % ${#FAVS[@]} ))
pokego -n "${FAVS[$RANDOM_INDEX]}" --nt
