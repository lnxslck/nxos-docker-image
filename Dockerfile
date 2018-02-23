FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y apt-transport-https wget ca-certificates
RUN wget https://archive.neon.kde.org/public.key -O neon.key
RUN if echo ee86878b3be00f5c99da50974ee7c5141a163d0e00fccb889398f1a33e112584 neon.key | sha256sum -c; then \
		apt-key add neon.key; \
		echo deb https://archive.neon.kde.org/user/ xenial main > /etc/apt/sources.list.d/neon.list; \
	fi
RUN rm neon.key

RUN wget http://repo.nxos.org/public.key -O nxos.key
RUN if echo de7501e2951a9178173f67bdd29a9de45a572f19e387db5f4e29eb22100c2d0e nxos.key | sha256sum -c; then \
		apt-key add nxos.key; \
		echo deb http://repo.nxos.org nxos main > /etc/apt/sources.list.d/nxos.list; \
	fi
RUN rm nxos.key

RUN apt-get update -y -qq
RUN apt-get -y install \
		git \
		gcc \
		g++ \
		fuse \
		kmod \
		cmake \
		inkscape \
		patchelf \
		qtbase5-dev \
		qtdeclarative5-dev \
		extra-cmake-modules \
		plasma-framework-dev \
		libqt5xmlpatterns5-dev \
		qtdeclarative5-dev-tools \
		qml-module-qtgraphicaleffects > /dev/null

RUN apt-get -y -qq clean
RUN rm -rf /var/log/* /tmp/*
