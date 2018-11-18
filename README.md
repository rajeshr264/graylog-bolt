# graylog-bolt
Puppet bolt code to install graylog, mongo, elastic on 3 diff machines
Steps:
-  $ cd Boltdir
- Add your nodes: Edit Boltdir/inventory.yaml to change the node names to yours
- Install the modules on your laptop: $ bolt puppetfile install => install all the modules in Boltdir/modules/ 
- Execute the plan : $ bolt plan run profiles::graylog_install mongodb_server=mongodb elastic_server=elastic graylog_server=graylog
