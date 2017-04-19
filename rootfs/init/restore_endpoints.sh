#
#  restore older satellite endpoints
#
#

if ( [ -z ${ICINGA_MASTER} ] && [ ${ICINGA_MASTER} != ${HOSTNAME} ] )
then
  return
fi

restoreEndpoints() {

  source="/srv/icinga2/automatic-zones.d"
  destination="/etc/icinga2"

  [ -d ${source} ] || mkdir -p ${source}

  cp -ra "${source}" ${destination}/

  exec /init/watch-endpoints.sh &

}

restoreEndpoints
