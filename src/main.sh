#!/usr/bin/env bash

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/bash-dep/bash-get-options/src/src.sh"
source "${self_dir}/env.sh"
source "${self_dir}/msg.sh"
source "${self_dir}/commands.sh"
source "${self_dir}/src.sh"

declare -A options_dict=(
    [a]=action
    [b]=binary
    [l]=alias
    [v]=version
)
declare -A options_defaults=(
    [action]="show"
    [binary]="${UA_BINARY}"
)
options=$(bgo_get_options ${#} ${@} options_dict options_defaults)
options=$(t=${options#*=} && echo ${t:1:-1})
declare -A options="${options}"
for key in ${!options_dict[@]}
do
    export ${options_dict[$key]}="${options[${options_dict[${key}]}]}"
done

cmd="$(ua_get_action ${action}) ${binary} ${version}" \
&& ${cmd}
