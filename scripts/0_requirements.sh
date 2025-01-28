#!/bin/bash
#
# Settings
# --------------
SCRIPTS_DIR=$(dirname "$0")

source $SCRIPTS_DIR/utils.sh
# -----------------------------------------------------------------------------


run_wait_check_status sudo python3 "$SCRIPTS_DIR/0_2_init_mnt_output.py"
run_wait_check_status python3 "$SCRIPTS_DIR/0_1_check_build_dir_size.py"


