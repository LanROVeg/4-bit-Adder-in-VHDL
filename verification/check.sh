#!/usr/bin/env bash
set -euo pipefail
cd "$(mktemp -d)"
ghdl -a --std=08 "/src/Lab7.srcs/sources_1/new/full_add.vhd" "/src/Lab7.srcs/sources_1/new/add4.vhd" "/src/Lab7.srcs/sim_1/new/tb_full.vhd" "/src/Lab7.srcs/sim_1/new/tb_add4.vhd"
ghdl -e --std=08 tb_full
ghdl -r --std=08 tb_full --assert-level=error
ghdl -e --std=08 tb_add4
ghdl -r --std=08 tb_add4 --assert-level=error
echo "PASS: all self-checking testbenches"
