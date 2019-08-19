#!/bin/bash
set -ex

cd /root

go version

pushd caddy

CGO_ENABLED=0 go build .

popd

