bonelli/mesos-slave
==================

Since this will be ran inside the bridged network, a bit of configuration is needed.

sudo docker.io run -p 5051:5051 --env MESOS_HOSTNAME=`hostname` --env MESOS_MASTER=`host mesos-master | cut -d' ' -f4`:5050 bonelli/mesos-slave
