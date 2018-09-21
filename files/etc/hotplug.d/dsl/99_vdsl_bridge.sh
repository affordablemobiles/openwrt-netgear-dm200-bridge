#!/bin/sh

[ "$DSL_NOTIFICATION_TYPE" = "DSL_INTERFACE_STATUS" ] && \
[ "$DSL_XTU_STATUS" = "VDSL" ] && \
[ "$DSL_INTERFACE_STATUS" = "UP" ] || exit 0

logger -p daemon.notice -t "dsl-notify" "Starting VDSL Bridge..."

sleep 1; ifup "wan_vdsl"
