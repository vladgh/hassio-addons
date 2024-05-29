#!/usr/bin/with-contenv bashio

if [[ -d "/data/corosync" ]]; then
    bashio::log.info "QNet configuration already persistent..."
else
    bashio::log.info "Copy configuration to persistent location..."
    mkdir -p /data/corosync
    cp -r /etc/corosync/* /data/corosync/
fi

if [[ "$(readlink /etc/corosync)" == '/data/corosync' ]]; then
    bashio::log.info "QNet configuration already persistent..."
else
    bashio::log.info "Create link for persistent configuration..."
    mv /etc/corosync "/etc/corosync.$(date "+%Y_%m_%d-%H_%M_%S").bak"
    ln -sf /data/corosync /etc/corosync
fi

bashio::log.info "Starting QNet Daemon..."
exec /usr/bin/corosync-qnetd -d -f