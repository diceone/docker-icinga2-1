#!/bin/sh

[ -d /srv/icinga2/automatic-zones.d ] || mkdir -p /srv/icinga2/automatic-zones.d

while true
do
  $@ &
  PID=$!
  inotifywait -e modify -e move -e create -e delete /etc/icinga2/automatic-zones.d

  cp -arv /etc/icinga2/automatic-zones.d/* /srv/icinga2/automatic-zones.d/
done


# EOF

