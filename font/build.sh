#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

build

rsync -av woff2/ lib
