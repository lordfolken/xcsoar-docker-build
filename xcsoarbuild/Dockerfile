# Builds XCSoar UNIX Target in a docker image

FROM debian:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV BPO="deb http://httpredir.debian.org/debian stable-backports main non-free contrib"
ENV SID="deb http://httpredir.debian.org/debian stable main non-free contrib" 

# Install build dependencies 
RUN echo $BPO > /etc/apt/sources.list.d/debian-backports.list && echo $SID > /etc/apt/sources.list.d/stable.list && apt update 
COPY ./ide/provisioning/install-debian-packages.sh /root/install-debian-packages.sh
COPY ./ide/provisioning/install-android-tools.sh /root/install-android-tools.sh
RUN chmod 755 /root/*.sh
RUN /root/install-debian-packages.sh && apt-get clean
RUN /root/install-android-tools.sh
RUN apt-get -y install python-minimal && apt-get clean
RUN apt-get -y install python3 && apt-get clean
RUN apt-get -y install vim && apt-get clean

# volume needs to be mounted later, as git clone will fail
VOLUME ["/opt/xcsoar/"]

WORKDIR /opt/xcsoar

COPY ./bin/xcsoar-update /usr/local/bin
COPY ./bin/xcsoar-compile-unix /usr/local/bin
COPY ./bin/xcsoar-compile-android /usr/local/bin
COPY ./bin/xcsoar-compile-pi /usr/local/bin
COPY ./bin/xcsoar-compile-pc /usr/local/bin
RUN chmod 755 /usr/local/bin/*
