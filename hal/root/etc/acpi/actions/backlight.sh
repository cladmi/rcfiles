#! /bin/bash
set -eu

case "$1" in
    video/brightness*)
        case "$2" in
            BRTUP)
                brightnessctl --quiet --exponent set 5%+
                ;;
            BRTDN)
                brightnessctl --quiet --exponent set 5%-
                ;;
        esac
        ;;
    *)
        ;;
esac
