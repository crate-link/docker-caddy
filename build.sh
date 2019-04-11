#!/bin/bash

set -ex

export GO111MODULE=on
export CVER=v1.0.0-beta1
export CTAG=${CVER}+crates

git config --global user.email "noshiro771@gmail.com"
git config --global user.name "crates docker"

mkdir -p /go/src/github.com/mholt
pushd /go/src/github.com/mholt
git clone https://github.com/mholt/caddy.git
cd caddy
git checkout -b ${CVER} ${CVER}
git log -3
git status
popd

pushd /go/src/github.com/mholt/caddy/caddy
tail caddymain/run.go
sed -i.bak -e 's/EnableTelemetry = true/EnableTelemetry = false/' caddymain/run.go
tail caddymain/run.go
git add caddymain/run.go
git commit -m "${CTAG}"
git tag "${CTAG}"
git log -3
git status
popd

go get -v github.com/mholt/caddy/caddy || true

go get -v github.com/caddyserver/builds

pushd /go/src/github.com/mholt/caddy/caddy
go run build.go
mv caddy /go
cd ..
git diff
git log -3
git status
popd

