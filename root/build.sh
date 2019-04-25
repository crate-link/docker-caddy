#!/bin/bash
set -ex

cd /root

pushd caddy

CGO_ENABLED=0 go build .

popd

