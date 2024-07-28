#! /bin/bash
set -eu

case "$1" in
    video/brightness*)
        case "$2" in
            BRTUP)
                xbacklight -inc 5
                ;;
            BRTDN)
                xbacklight -dec 5
                ;;
        esac
        ;;
    *)
        ;;
esac
