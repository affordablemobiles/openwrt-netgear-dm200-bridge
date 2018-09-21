#!/bin/sh

[ "$DSL_NOTIFICATION_TYPE" = "DSL_INTERFACE_STATUS" ] && \
[ "$DSL_XTU_STATUS" = "ADSL" ] && \
[ "$DSL_INTERFACE_STATUS" = "UP" ] || exit 0

logger -p daemon.notice -t "dsl-notify" "Starting ADSL Bridge..."

sleep 1; ifup "wan_adsl"
