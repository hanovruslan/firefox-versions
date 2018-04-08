#!/usr/bin/env bash

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/bash-dep/dep/bash-get-options/src/src.sh"
source "${self_dir}/env.sh"
source "${self_dir}/commands.sh"
source "${self_dir}/src.sh"

declare -A options_dict=(
    [a]=action
    [b]=binary
    [v]=version
)
declare -A options_defaults=(
    [action]="show"
    [binary]="${UA_BINARY}"
)

bgo_main ${@}

cmd="$(ua_get_action ${action}) ${binary} ${version}" \
&& ${cmd}
