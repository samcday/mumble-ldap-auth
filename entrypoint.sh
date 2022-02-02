#!/bin/bash

export ICE_HOST=${ICE_HOST:-127.0.0.1}
export ICE_PORT=${ICE_PORT:-6502}

export ICE_WATCHDOG=${ICE_WATCHDOG:-30}
export DISCOVER_DN=${LDAP_DISCOVER_DN:-false}
export LDAP_ATTR_USERNAME=${LDAP_ATTR_USERNAME:-uid}
export LDAP_ATTR_ROOM_NUMBER=${LDAP_ATTR_ROOM_NUMBER:-roomNumber}
export LDAP_ATTR_DISPLAY=${LDAP_ATTR_DISPLAY:-displayName}
export LDAP_ATTR_GROUP=${LDAP_ATTR_GROUP:-uniqueMember}
export LDAP_ATTR_MAIL=${LDAP_ATTR_MAIL:-mail}

export LDAP_PROVIDE_INFO=${LDAP_PROVIDE_INFO:-false}
export LDAP_PROVIDE_USERS=${LDAP_PROVIDE_USERS:-false}

envsubst < LDAPauth-template.ini > LDAPauth.ini
exec /opt/LDAPauth.py --app -i LDAPauth.ini
