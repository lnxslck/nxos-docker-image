# nxos-docker-image [![Build Status](https://travis-ci.org/nomad-desktop/nxos-docker-image.svg?branch=master)](https://travis-ci.org/nomad-desktop/nxos-docker-image)

This image is useful for building Qt5 applications.
Be sure to add this to your `.travis.yml`.

All the files that are generated by the build process
will be kept in the current directory (`pwd`).

```YAML
sudo: required

services:
  - docker

before_install:
  - docker pull nxos/nxos

script:
  - docker run --rm -v $(pwd)/:/build/ -w /build/ nxos/nxos sh /build/${BUILD_SCRIPT_1}
  - docker run --rm -v $(pwd)/:/build/ -w /build/ nxos/nxos sh /build/${BUILD_SCRIPT_2}

```

Replace `${BUILD_SCRIPT_1}` and `${BUILD_SCRIPT_2}` with the path to your
build script(s).

Your `.travis.yml` should look something like this:

```YAML
sudo: required

services:
  - docker

before_install:
  - docker pull nxos/nxos

script:
  - docker run --rm -v $(pwd)/:/build/ -w /build/ nxos/nxos sh /build/build.sh

```
