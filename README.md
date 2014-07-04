bonelli/mesos-slave
==================

Since this will be ran inside the bridged network, a bit of configuration is needed.

sudo docker run --net=host --env MESOS_MASTER=mesos-master:5050 --env MESOS_PASSWD="`getent passwd`" -v /home:/home -d bonelli/mesos-slave
