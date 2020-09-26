#!/usr/bin/bash
 # shellcheck source=./resources/defineColors.sh
source ./resources/defineColors.sh
awk -F, '{$RED_BACKGROUND; print $0; $RESET_ALL}' viewWithoutColor.out
