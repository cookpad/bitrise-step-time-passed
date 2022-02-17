#!/bin/bash
set -e
set -x

export SECONDS_PASSED_SINCE_TRIGGER=$((`date +%s` - $trigger_timestamp))
envman add --key "SECONDS_PASSED_SINCE_TRIGGER" --value="$SECONDS_PASSED_SINCE_TRIGGER"

minutes_part=$(($SECONDS_PASSED_SINCE_TRIGGER / 60))
seconds_part=$(($SECONDS_PASSED_SINCE_TRIGGER % 60))
if [ $seconds_part -eq 0 ]; then
  TIME_PASSED_SINCE_TRIGGER="${minutes_part} min"
else
  TIME_PASSED_SINCE_TRIGGER="${minutes_part} min ${seconds_part} s"
fi
export TIME_PASSED_SINCE_TRIGGER
envman add --key "TIME_PASSED_SINCE_TRIGGER" --value="$TIME_PASSED_SINCE_TRIGGER"
