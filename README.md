# nxos-docker-image

This image is useful for building Qt5 applications.
Be sure to add this to your `.travis.yml`.

```YAML
sudo: required

services:
  - docker

before_install:
  - docker pull nxos/nxos

script:
  - docker run --rm -v $(pwd)/${BUILD_SCRIPT_1}:/${BUILD_SCRIPT_1} nxos/nxos sh /${BUILD_SCRIPT_1}
  - docker run --rm -v $(pwd)/${BUILD_SCRIPT_2}:/${BUILD_SCRIPT_2} nxos/nxos sh /${BUILD_SCRIPT_2}

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
  - docker run --rm -v $(pwd)/build.sh:/build.sh nxos/nxos sh /build.sh

```
