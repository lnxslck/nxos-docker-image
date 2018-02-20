#! /bin/bash

# FIXME: use actual version instead of "latest" tag

TAG=0.0.1

exec docker build -t nxos/nxos:"$TAG" .
