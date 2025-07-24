#!/system/bin/sh

# ==========================================================
# LuwengKernel Feature Checker 
# by KepalaLuweng@LuwengTech.Id
#
# To run in Termux: sh /sdcard/LuwengKernelCheck.sh
# ==========================================================

# Output file location on internal storage
OUTPUT_FILE="/sdcard/LuwengCheckKernelInfo.txt"

# --- Start Writing Report ---
# Remove old report if it exists
rm -f $OUTPUT_FILE

# Function to create section headers
print_header() {
    echo "" >> $OUTPUT_FILE
    echo "--- [ $1 ] ---" >> $OUTPUT_FILE
}

# Main Header
echo "======================================" > $OUTPUT_FILE
echo "    🔥 LuwengKernel Feature Check 🔥" >> $OUTPUT_FILE
echo "======================================" >> $OUTPUT_FILE
echo "Generated on: $(date)" >> $OUTPUT_FILE

# --- Kernel & Build Information ---
print_header "Kernel & Build Info"
echo "Kernel Version: $(uname -r)" >> $OUTPUT_FILE
# Get compiler info from /proc/version
COMPILER_INFO=$(cat /proc/version)
echo "Compiler Info: $COMPILER_INFO" >> $OUTPUT_FILE

# --- Compile-Time Features ---
print_header "Compile-Time Features (Kernel Defaults)"
echo "Build Optimization: Full LTO (Link Time Optimization)" >> $OUTPUT_FILE
echo "Timer Frequency: 300Hz" >> $OUTPUT_FILE
echo "Note: These features are set at compile-time and cannot be checked directly at runtime." >> $OUTPUT_FILE

# --- CPU Settings ---
print_header "CPU Scheduling"
if [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]; then
    echo "Active Governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)" >> $OUTPUT_FILE
    echo "Available Governors: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)" >> $OUTPUT_FILE
else
    echo "CPU Governor info not found." >> $OUTPUT_FILE
fi

# --- Network Settings ---
print_header "Networking (TCP)"
if [ -f /proc/sys/net/ipv4/tcp_congestion_control ]; then
    echo "Active TCP Algorithm: $(cat /proc/sys/net/ipv4/tcp_congestion_control)" >> $OUTPUT_FILE
    echo "Available TCP Algorithms: $(cat /proc/sys/net/ipv4/tcp_available_congestion_control)" >> $OUTPUT_FILE
else
    echo "TCP Congestion info not found." >> $OUTPUT_FILE
fi

# --- I/O Settings ---
print_header "I/O Scheduling"
# Find the main block device (usually sda, sdb, sde, etc.)
for dev in sda sdb sdc sdd sde; do
    if [ -d /sys/block/$dev ]; then
        MAIN_DEV=$dev
        break
    fi
done

if [ -n "$MAIN_DEV" ]; then
    echo "Scheduler for '$MAIN_DEV': $(cat /sys/block/$MAIN_DEV/queue/scheduler)" >> $OUTPUT_FILE
else
    echo "Main block device not found." >> $OUTPUT_FILE
fi

# --- Memory Settings (ZRAM) ---
print_header "Memory (ZRAM)"
if [ -e /dev/block/zram0 ]; then
    SIZE_BYTES=$(cat /sys/block/zram0/disksize)
    SIZE_MB=$((SIZE_BYTES / 1024 / 1024))
    ALGO=$(cat /sys/block/zram0/comp_algorithm)
    echo "Status: Active" >> $OUTPUT_FILE
    echo "Size: $SIZE_MB MB" >> $OUTPUT_FILE
    echo "Compression Algorithm: $ALGO" >> $OUTPUT_FILE
else
    echo "Status: ZRAM not active." >> $OUTPUT_FILE
fi

# --- [NEW] Root Status Check ---
print_header "Root Status"
if [ -f /data/adb/magisk/magisk ]; then
    ROOT_SOLUTION="Magisk"
    ROOT_VERSION=$(/data/adb/magisk/magisk -v | cut -d ':' -f 1)
    echo "Detected Root: $ROOT_SOLUTION ($ROOT_VERSION)" >> $OUTPUT_FILE
elif [ -d /sys/kernel/notes/kernelsu ]; then
    ROOT_SOLUTION="KernelSU"
    ROOT_VERSION=$(cat /sys/kernel/notes/kernelsu/version)
    echo "Detected Root: $ROOT_SOLUTION (v$ROOT_VERSION)" >> $OUTPUT_FILE
else
    echo "Detected Root: None or Unknown" >> $OUTPUT_FILE
fi
echo "Supported Root Solutions: Magisk, KernelSU" >> $OUTPUT_FILE


# --- Footer ---
echo "" >> $OUTPUT_FILE
echo "======================================" >> $OUTPUT_FILE
echo "Check Complete - by KepalaLuweng" >> $OUTPUT_FILE

# Message in terminal for the user
echo "✅ Done! Check results saved to: $OUTPUT_FILE"

