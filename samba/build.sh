#!/bin/bash

set -aex

scriptDir=$(dirname "$0")
image="samba-hk"

docker build -t "${image}" "${scriptDir}"

