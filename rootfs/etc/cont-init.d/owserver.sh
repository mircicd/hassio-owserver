#!/usr/bin/with-contenv bashio


declare server
server=$(bashio::config 'server')

if bashio::config.has_value 'server' ;then
    bashio::log.info "Configuring server ${server}"
    sed -i "s/%%server%%/${server}/g" /etc/owfs.conf
else
    bashio::log.info "Configuring fake device"
    sed -i "s/%%server%%/FAKE = DS18B20,DS2405/g" /etc/owfs.conf
fi
