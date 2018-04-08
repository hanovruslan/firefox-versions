#@IgnoreInspection BashAddShebang
ua_cmd_display () {
    echo '${UA_ADMIN_BINARY} --display ${ua_binary}' \
    | envsubst '$UA_ADMIN_BINARY'
}
ua_cmd_download () {
    echo 'sudo wget -nc ${UA_BINARY_WGET} -O ${UA_BINARY_TARBALL}' \
    | envsubst '$UA_BINARY_WGET,$UA_BINARY_TARBALL'
}
ua_cmd_untar () {
    echo 'sudo tar jxf --overwrite ${UA_BINARY_TARBALL} -C ${UA_BINARY_SHARE} --strip 1' \
    | envsubst '$UA_BINARY_TARBALL,$UA_BINARY_SHARE'
} 
ua_cmd_list () {
    echo '${UA_ADMIN_BINARY} --list ${ua_binary}' \
    | envsubst '$UA_ADMIN_BINARY'
}
ua_cmd_install () {
    echo 'sudo ${UA_ADMIN_BINARY} --install ${UA_BINARY_PATH} ${ua_binary} ${UA_BINARY_SHARE}/${UA_BINARY_BIN} ${ua_priority}' \
    | envsubst '$UA_ADMIN_BINARY,$UA_BINARY_PATH,$UA_BINARY_SHARE,$UA_BINARY_BIN'
}
ua_cmd_mkdir () {
    echo 'sudo mkdir -p ${UA_BINARY_SHARE}' \
    | envsubst '$UA_BINARY_SHARE'
}
ua_cmd_set () {
    echo 'sudo ${UA_ADMIN_BINARY} --set ${ua_binary} ${UA_BINARY_SHARE}/${UA_BINARY_BIN}' \
    | envsubst '$UA_ADMIN_BINARY,$UA_BINARY_SHARE,$UA_BINARY_BIN'
} 