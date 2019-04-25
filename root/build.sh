#!/bin/bash
set -ex

cd /root

pushd caddy

go build .

popd

