#!/bin/sh

. "scripts/vars.sh"

alias watch-ka="watch kubectl -n api get all"
alias watch-kk="watch kubectl -n kafka get all"
alias watch-ko="watch kubectl -n observability get all"
alias watch-di="watch docker images --filter \"reference=*:$TAG\""
