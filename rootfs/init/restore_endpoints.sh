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
  destination="/etc/icinga2/automatic-zones.d"

  [ -d ${source} ] || mkdir -p ${source}

  cp -a "${source}/*" ${destination}/

  cmd="/init/watch-endpoints.sh"

  $cmd &

}

restoreEndpoints
