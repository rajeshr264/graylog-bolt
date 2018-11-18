plan profiles::graylog_install (
  TargetSpec $graylog_server,
  TargetSpec $elastic_server,
  TargetSpec $mongodb_server
) {
    apply_prep($mongodb_server)
    apply($mongodb_server) {
      class {'profiles::mongodb' : }
    }

    apply_prep($elastic_server)
    apply($elastic_server) {
      class {'profiles::elastic' : }
    }

    apply_prep($graylog_server)
    apply($graylog_server) {
      class {'profiles::graylog' : }
    }
}
