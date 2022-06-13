#!/usr/bin/env bash

outputFile="${1:-config.yaml}"

readarray -t filelist < <(printf '%s\n' "$(find kubernetes/*  -type f)" | sort)

declare -i length i
length=${#filelist[@]}
i=0
for file in "${filelist[@]}"; do
  ((i++))
  cat "${file}"
  if [[ "$i" -lt "$length" ]]; then
    echo "---"
  fi;
done >"${outputFile}"

echo "Produced ${outputFile}"
