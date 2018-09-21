#!/bin/sh

[ "$DSL_NOTIFICATION_TYPE" = "DSL_INTERFACE_STATUS" ] && \
[ "$DSL_INTERFACE_STATUS" = "DOWN" ] || exit 0

logger -p daemon.notice -t "dsl-notify" "xDSL isn't active, bringing down the bridge..."

. /usr/share/libubox/jshn.sh
. /lib/functions.sh

include /lib/network
scan_interfaces

for ifc in wan_adsl wan_vdsl; do
	json_load "$(ifstatus $ifc)"

	json_get_var up up

	if [ "$up" = 1 ]; then
		if [ "$ifc" = "wan_adsl" ]; then
			logger -p daemon.notice -t "dsl-notify" "Tearing down ADSL bridge..."
		fi
		if [ "$ifc" = "wan_vdsl" ]; then
			logger -p daemon.notice -t "dsl-notify" "Tearing down VDSL bridge..."
                fi		

		ifdown "$ifc"
	fi
done
