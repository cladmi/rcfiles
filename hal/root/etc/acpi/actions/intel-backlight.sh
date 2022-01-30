#! /bin/bash
set -eu

BACKLIGHT="/sys/class/backlight/intel_backlight"
CFG=${BACKLIGHT}/brightness

MIN=0
MAX=$(cat ${BACKLIGHT}/max_brightness)
CUR=$(cat ${CFG})

# ajust by 5% between 5% and MAX
# adjust by 0.5% between MIN and 5%

STEP=$(( MAX / 20 ))
if [[ ${CUR} -lt ${STEP} ]]; then
    STEP=$(( STEP / 10 ))
    STEP=$(( 1>STEP ? 1 : STEP ))
fi

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
        ;;
esac
