# Use Ubuntu 16.04 as the base image.
FROM ubuntu:16.04

# Install the development packages.
RUN wget -qO - http://archive.neon.kde.org/public.key |  apt-key add - && \
	wget -qO - http://repo.nxos.org/public.key |  apt-key add - && \
	echo "deb http://archive.neon.kde.org/user/ xenial main" > /etc/apt/sources.list.d/neon.list && \
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
	qml-module-qtgraphicaleffects

# TODO: create start.sh.
CMD ["start.sh"]
