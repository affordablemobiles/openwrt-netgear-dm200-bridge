#!/bin/sh

logger -p daemon.notice -t "dsl-notify" "Incoming notification... $DSL_NOTIFICATION_TYPE $DSL_INTERFACE_STATUS $DSL_XTU_STATUS"
