
hostname
date
uptime -p
nproc
cut -d ' ' -f 1-3 /proc/loadavg
free -h
df -h /

# --- Users: who is logged in right now ---
echo
echo "--- Users ---"
who
# Maintained as part of Project 1
