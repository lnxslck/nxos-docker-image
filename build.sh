#! /bin/bash

# FIXME: use actual version instead of "latest" tag

TAG=latest

exec docker build -t nxos/nxos:"$TAG" .
