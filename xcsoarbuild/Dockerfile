# Builds XCSoar UNIX Target in a docker image

FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV GIT "git"
ENV BUILDDEP "python3-minimal make g++  quilt libcurl4-openssl-dev python3-pkgconfig imagemagick xsltproc librsvg2-bin mesa-common-dev lua5.2 lua5.2-dev zlib1g-dev libfreetype6-dev libtiff5-dev libgeotiff-dev gettext libsdl1.2-dev libxml-parser-perl fonts-dejavu fonts-freefont-ttf fonts-droid-fallback ccache ffmpeg gcj-native-helper ant vorbis-tools mingw-w64 libinput-dev libinput-bin" 
ENV BPO="deb http://httpredir.debian.org/debian stable-backports main non-free contrib"
ENV SID="deb http://httpredir.debian.org/debian stable main non-free contrib" 
ENV BUILDDEPSID "gcc-6-arm-linux-gnueabihf" 

# Install build dependencies 
RUN echo $BPO > /etc/apt/sources.list.d/debian-backports.list && echo $SID > /etc/apt/sources.list.d/stable.list && apt update 
RUN apt install --no-install-recommends -y $GIT && apt clean
RUN apt install -y $BUILDDEP && apt clean 
RUN apt install -y $BUILDDEPSID && apt clean
RUN apt install -y xz-utils g++-arm-linux-gnueabihf gawk build-essential ttf-bitstream-vera g++-6-arm-linux-gnueabihf libc6-armhf-cross
# Basic build Dependencies
RUN apt install -y make librsvg2-bin xsltproc imagemagick gettext zip 
# Linux build Dependencies
RUN apt-get install make g++ zlib1g-dev libsdl1.2-dev libfreetype6-dev libpng-dev libjpeg-dev libcurl4-openssl-dev libxml-parser-perl librsvg2-bin xsltproc imagemagick gettext fonts-dejavu

# Android target
RUN apt-get install -y default-jdk-headless ant vorbis-tools
RUN apt-get install -y google-android-platform-14-installer
RUN apt-get install -y google-android-ndk-installer
RUN apt-get install -y m4 automake

# Pull source code into image

# volume needs to be mounted later, as git clone will fail
VOLUME ["/opt/xcsoar/"]

WORKDIR /opt/xcsoar

COPY ./bin/xcsoar-update /usr/local/bin
COPY ./bin/xcsoar-compile-unix /usr/local/bin
COPY ./bin/xcsoar-compile-android /usr/local/bin
RUN chmod 755 /usr/local/bin/*
#CMD cd /opt/xcsoar && git pull && rm -rf /opt/xcsoar/output/* && mkdir -p output/src && make TARGET=UNIX TARGET=WIN64 TARGET=PC DEBUG=n USE_CCACHE=y -j 5
