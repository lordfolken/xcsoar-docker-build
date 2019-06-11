# Builds XCSoar UNIX Target in a docker image

FROM debian:stable-backports
ENV DEBIAN_FRONTEND=noninteractive

# Install build dependencies 
COPY ./ide/provisioning/install-debian-packages.sh /root/install-debian-packages.sh
RUN apt update && apt -y install curl && apt-get clean
RUN curl https://raw.githubusercontent.com/XCSoar/XCSoar/master/ide/provisioning/install-android-tools.sh -o /root/install-android-tools.sh
RUN chmod 755 /root/install-android-tools.sh /root/install-debian-packages.sh
RUN /root/install-debian-packages.sh && apt-get clean
RUN /root/install-android-tools.sh && apt-get clean
RUN apt-get -y install python-minimal python3 vim ccache python3-pkgconfig && apt-get clean

# volume needs to be mounted later, as git clone will fail
VOLUME ["/opt/xcsoar/"]

WORKDIR /opt/xcsoar

COPY ./bin/* /usr/local/bin/
RUN cd /usr/local/bin && chmod 755 ./*

# CCcache volume for performance gain on subsequent runs
VOLUME ["/root/.ccache" ]

COPY VERSION.txt /root/
