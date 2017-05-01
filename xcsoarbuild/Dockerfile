# Builds XCSoar UNIX Target in a docker image

FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV GIT "git"
ENV BUILDDEP "python3-minimal make g++  quilt libcurl4-openssl-dev python3-pkgconfig imagemagick xsltproc librsvg2-bin mesa-common-dev lua5.2 lua5.2-dev zlib1g-dev libfreetype6-dev libtiff5-dev libgeotiff-dev gettext libsdl1.2-dev libxml-parser-perl fonts-dejavu fonts-freefont-ttf fonts-droid ccache ffmpeg gcj-native-helper ant vorbis-tools mingw-w64"
ENV BPO="deb http://httpredir.debian.org/debian jessie-backports main non-free contrib"
ENV SID="deb http://httpredir.debian.org/debian sid main non-free contrib" 
ENV BUILDDEPSID "gcc-5-arm-linux-gnueabihf" 

# Install build dependencies 
RUN echo $BPO > /etc/apt/sources.list.d/debian-backports.list && echo $SID > /etc/apt/sources.list.d/sid.list && apt-get update && apt-get install --no-install-recommends -y $GIT $BUILDDEP && apt-get install -y $BUILDDEPSID && apt-get clean
RUN apt-get install -y xz-utils g++-arm-linux-gnueabihf gawk build-essential ttf-bitstream-vera g++-5-arm-linux-gnueabihf libc6-armhf-cross

# Pull source code into image
#RUN git clone --recursive git://git.xcsoar.org/xcsoar/master/xcsoar.git /opt/xcsoar

# volume needs to be mounted later, as git clone will fail
VOLUME ["/opt/xcsoar/"]

WORKDIR /opt/xcsoar
#CMD git pull && rm -rf /opt/xcsoar/output/* && mkdir -p output/src && make TARGET=UNIX TARGET=WIN64 TARGET=PC TARGET=PI  DEBUG=n USE_CCACHE=y -j 5
