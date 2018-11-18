# graylog-bolt
Puppet bolt code to install graylog, mongo, elastic on 3 diff machines
Steps:
-  $ cd Boltdir
- Edit inventory.yaml to change the node names to yours
- To run: bolt plan run profiles::graylog_install mongodb_server=mongodb elastic_server=elastic graylog_server=graylog
