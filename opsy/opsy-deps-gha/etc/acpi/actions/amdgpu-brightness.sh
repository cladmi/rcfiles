#! /bin/bash
set -eu

BACKLIGHT="/sys/class/backlight/amdgpu_bl0"
CFG=${BACKLIGHT}/brightness

MIN=1
MAX=$(cat ${BACKLIGHT}/max_brightness)
CUR=$(cat ${CFG})

# ajust by 5% between MIN and MAX
STEP=$(( MAX / 20 ))


case "$1" in
    video/brightness*)
        case "$2" in
            BRTUP)
                new=$(( CUR + STEP ))
                new=$(( new<MAX ? new : MAX ))
                logger "Brightness up ${new}"
                ;;
            BRTDN)
                new=$(( CUR - STEP ))
                new=$(( new>MIN ? new : MIN ))
                logger "Brightness down ${new}"
                ;;
        esac
        printf "%s\n" ${new} > ${CFG}
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
