# Use Ubuntu 16.04 as the base image.
FROM ubuntu:16.04

# Install the development packages.
RUN bash -xc 'apt-get update && \
    apt-get install -y apt-transport-https wget ca-certificates && \
    wget https://archive.neon.kde.org/public.key -O neon.key && \
    echo "ee86878b3be00f5c99da50974ee7c5141a163d0e00fccb889398f1a33e112584  neon.key" | sha256sum -c && \
    apt-key add - < neon.key && \
    rm neon.key && \
    wget http://repo.nxos.org/public.key -O nxos.key && \
    echo "de7501e2951a9178173f67bdd29a9de45a572f19e387db5f4e29eb22100c2d0e  nxos.key" | sha256sum -c && \
    apt-key add - < nxos.key && \
    rm nxos.key && \
    echo "deb https://archive.neon.kde.org/user/ xenial main" > /etc/apt/sources.list.d/neon.list && \
    echo "deb http://repo.nxos.org nxos main" > /etc/apt/sources.list.d/nxos.list && \
    apt-get update -qq && \
    apt-get -y install --allow-unauthenticated \
    git \
    cmake \
    inkscape \
    patchelf \
    qtbase5-dev \
    qtdeclarative5-dev \
    extra-cmake-modules \
    plasma-framework-dev \
    libqt5xmlpatterns5-dev \
    qtdeclarative5-dev-tools \
    qml-module-qtgraphicaleffects'
