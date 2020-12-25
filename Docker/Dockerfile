FROM ubuntu:latest

ARG USER_ID
ARG USER_NAME

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -qq dist-upgrade && apt-get -qq autoremove

RUN apt-get -qq install \ 
    curl \
    nano \
    git

# npm
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash
RUN apt-get -qq install nodejs

# dependencies for electron start
RUN apt-get -qq install \
    librust-gobject-sys-dev \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    librust-gdk-pixbuf-sys-dev \
    libgtk-3-0 \
    libdrm2 \
    libgbm1 \
    libasound2

# debian build
RUN apt-get -qq install \
    dpkg \
    fakeroot \
    rpm

# windows build
RUN apt-get -qq install \
    wine32 \
    wine64 \
    mono-complete

RUN useradd -u $USER_ID $USER_NAME
WORKDIR /home/$USER_NAME
RUN chown -R $USER_ID:$USER_ID /home/$USER_NAME
USER $USER_NAME