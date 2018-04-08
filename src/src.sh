#@IgnoreInspection BashAddShebang
ua_show () {
    local ua_binary=${1}
    export ua_binary
    local cmd="$(echo $(ua_cmd_display) | envsubst '$ua_binary')"

    ${cmd}
}
ua_add () { 
    local ua_binary=${1}
    local ua_version=${2}
    export ua_binary
    export ua_version
    export ua_priority="$(( $( $( echo $(ua_cmd_list) | envsubst '$ua_binary') | wc -l ) + 1 ))"
    cmd_download=$(echo $(ua_cmd_download) | envsubst '$ua_binary,$ua_version')
    cmd_mkdir=$(echo $(ua_cmd_mkdir) | envsubst '$ua_binary,$ua_version')
    cmd_untar=$(echo $(ua_cmd_untar) | envsubst '$ua_binary,$ua_version')
    cmd_install=$(echo $(ua_cmd_install) | envsubst '$ua_binary,$ua_version,$ua_priority')

    ${cmd_download} \
    && ${cmd_mkdir} \
    && ${cmd_untar} \
    && ${cmd_install}
}
ua_set () {
    local ua_binary=${1}
    local ua_version=${2}
    export ua_binary
    export ua_version

    cmd="$(echo $(ua_cmd_set) | envsubst '$ua_binary,$ua_version')"

    ${cmd}
}
ua_get_action () {
    local action='ua_'
    case ${1} in 
        'add' | 'set' | 'show') action=${action}${1} ;;
        *) echo "'"${1}"'" is not a valid action>&2 && exit 1 ;;
    esac
    echo ${action}
}