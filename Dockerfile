############################################################
# Dockerfile to run Mesos Slaves
# Based on Ubuntu Image
############################################################

# Set the base image to use to Ubuntu
FROM itzg/ubuntu-openjdk-7

# Set the file maintainer (your name - the file's author)
MAINTAINER Federico Bonelli

RUN apt-get update

RUN apt-get install -y python-setuptools python-protobuf curl

# install mesos from mesosphere
RUN curl -sSfL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.19.0~ubuntu14.04%2B1_amd64.deb --output /tmp/mesos.deb
RUN dpkg -i /tmp/mesos.deb
RUN rm /tmp/mesos.deb

# install python egg
RUN curl -sSfL http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.19.0_rc2-py2.7-linux-x86_64.egg --output /tmp/mesos.egg
RUN easy_install /tmp/mesos.egg
RUN rm /tmp/mesos.egg

RUN echo -n "manual" > /etc/init/mesos-master.override

RUN echo "LOGS=/var/log/mesos" > /etc/default/mesos
RUN echo "PORT=5051" > /etc/default/mesos-slave

EXPOSE 5051

# Default run command arguments
#CMD ["bash", "-c", "/usr/bin/mesos-init-wrapper slave --hostname $MESOS_HOSTNAME --master $MESOS_MASTER"]
CMD ["bash", "-c", "echo \"$MESOS_PASSWD\" >> /etc/passwd && /usr/bin/mesos-init-wrapper slave --master $MESOS_MASTER"]

USER root

