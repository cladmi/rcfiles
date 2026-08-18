#! /bin/sh

set -e

readonly COMMAND="$1"
readonly DEFAULT_SOURCE=$(pactl get-default-source)
readonly DEFAULT_SINK=$(pactl get-default-sink)

stop()
{
    # Unload if exists
    pactl unload-module module-null-sink || true > /dev/null
}

create_sinks()
{
    pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=capture-mic-sink channel_map=mono
    pactl load-module module-null-sink media.class=Audio/Sink sink_name=capture-sink channel_map=stereo
    pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=captured channel_map=stereo
    pactl load-module module-null-sink media.class=Audio/Sink sink_name=capture-sink-level channel_map=stereo

    # Wait modules loaded to be seen by 'pw-link'
    sleep 1
}

link_sinks()
{
    pw-link capture-sink:monitor_FL capture-sink-level:playback_FL
    pw-link capture-sink:monitor_FR capture-sink-level:playback_FR

    pw-link capture-sink-level:monitor_FL captured:input_FL
    pw-link capture-sink-level:monitor_FR captured:input_FR

    pw-link capture-mic-sink:capture_MONO captured:input_FL
    pw-link capture-mic-sink:capture_MONO captured:input_FR
}

link_default()
{
    pw-link "${DEFAULT_SOURCE}":capture_MONO capture-mic-sink:input_MONO || true
    pw-link capture-sink:monitor_FL "${DEFAULT_SINK}":playback_FL
    pw-link capture-sink:monitor_FR "${DEFAULT_SINK}":playback_FR
}

start()
{
    create_sinks
    link_sinks
    link_default
}

case "${COMMAND}" in
  ""|restart)
    set -x
    stop
    start
    ;;
  start)
    set -x
    start
    ;;
  stop)
    set -x
    stop
    ;;
  *)
    echo "Usage: $0 [-h] <start|stop|restart|>"
    exit 1
    ;;
esac
