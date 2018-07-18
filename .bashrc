#!/usr/bin/env bash

for each in ~/.shell/*; do
    source $each;
done

source /usr/local/opt/asdf/asdf.sh

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
