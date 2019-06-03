#!/usr/bin/env bash

M=(
  $HOME/DevOps/etc/GoogleCloudSDK/completion.bash.inc
  $HOME/DevOps/etc/GoogleCloudSDK/path.bash.inc
  $HOME/.fzf.bash
  /usr/local/opt/asdf/asdf.sh
)

for S in ${M[@]}; do
    if [[ -f $S ]]; then
        . $S;
    fi
done

for S in $HOME/.shell/*; do
    . $S;
done

