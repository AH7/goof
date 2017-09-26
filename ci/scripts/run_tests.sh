#!/usr/bin/env bash

set -e -u -x

# mv dependency-cache/node_modules goof
ls -la goof
mv cache/node_modules goof
cd goof && npm test
