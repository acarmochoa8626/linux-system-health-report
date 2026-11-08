#!/usr/bin/env bash
set -euo pipefail # strict mode;exit on error , unset vars, or pipe failure
# sysreport.sh - Print a basic system health report
# Usage: ./scripts/sysreport.sh
# Part of Project 1 (DevOps lab)

# --- Header: who, when, how long running ---
echo "===== System Health Report ====="
echo "Host:      $(hostname)"
echo "Date:      $(date)"
echo "Uptime:    $(uptime -p)"
echo "Kernel:    $(uname -r)"
echo


# --- CPU: core count and load averages ---
# Load above the core count means the CPU is overloaded
echo "--- CPU ---"
echo "Cores:     $(nproc)"
echo "Load avg (1, 5, 15 min): $(cut -d ' ' -f 1-3 /proc/loadavg)"
echo

# --- Memory: check the 'available' column ---
echo "--- Memory ---"
free -h
echo

# --- Disk: root filesystem usage ---
echo "--- Disk (root filesystem) ---"
df -h /

# --- Users: who is logged in right now ---
echo
echo "--- Users ---"
who

# --- Processes: top 5 by memory use ---
echo
echo "--- Top 5 Processes by Memory ---"
ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
files=`ls`
