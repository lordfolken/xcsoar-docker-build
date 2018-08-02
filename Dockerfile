# Builds XCSoar UNIX Target in a docker image

FROM debian:stretch
ENV DEBIAN_FRONTEND=noninteractive
ENV BPO="deb http://httpredir.debian.org/debian stretch-backports main non-free contrib"
ENV SID="deb http://httpredir.debian.org/debian stretch main non-free contrib" 

# Install build dependencies 
RUN echo $BPO > /etc/apt/sources.list.d/debian-backports.list && echo $SID > /etc/apt/sources.list.d/stretch.list && apt update 
COPY ./ide/provisioning/install-debian-packages.sh /root/install-debian-packages.sh
COPY ./ide/provisioning/install-android-tools.sh /root/install-android-tools.sh
RUN chmod 755 /root/install-android-tools.sh /root/install-debian-packages.sh
RUN /root/install-debian-packages.sh && apt-get clean
RUN /root/install-android-tools.sh && apt-get clean
RUN apt-get -y install python-minimal python3 vim ccache python3-pkgconfig && apt-get clean

# volume needs to be mounted later, as git clone will fail
VOLUME ["/opt/xcsoar/"]

WORKDIR /opt/xcsoar

COPY ./bin/xcsoar-update ./bin/xcsoar-compile-unix /./bin/xcsoar-compile-android ./bin/xcsoar-compile-pi ./bin/xcsoar-compile-pc /usr/local/bin/
RUN cd /usr/local/bin && chmod 755 xcsoar-update xcsoar-compile-android xcsoar-compile-pi xcsoar-compile-pc xcsoar-compile-unix

# CCcache volume for performance gain on subsequent runs
VOLUME ["/root/.ccache" ]

COPY VERSION.txt /root/
