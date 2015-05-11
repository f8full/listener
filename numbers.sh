#!/bin/bash

declare -A seen
tags=()
tags_time=()

delay=20

get_tag() {
   local i
   for ((i=1;;++i)); do
      if [[ -z ${tags[i]} ]] || ((tags_time[i] < SECONDS-delay)); then
         break
      fi
   done
   if [[ ${tags[i]} ]]; then
      unset 'seen[${tags[$i]}]' "tags[i]" "tags_time[i]"
   fi
   get_tag_ret=$i
}

while read; do
   read -r first _ <<< "$REPLY"
   [[ $first ]] || continue
   if [[ -z ${seen["$first"]} ]]; then
      get_tag
      seen["$first"]=$get_tag_ret
      tags[get_tag_ret]=$first
      tags_time[get_tag_ret]=$SECONDS
   fi
   printf '/%d %s\n' "${seen["$first"]}" "$REPLY"
done
