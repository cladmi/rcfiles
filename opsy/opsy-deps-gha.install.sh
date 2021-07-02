#! /bin/sh

set -ex

SCRIPTDIR=$(dirname $0)
cd ${SCRIPTDIR}

sudo -v

equivs-build opsy-deps-gha.equivs
sudo apt-get install --force-reinstall=true ./opsy-deps-gha_*_all.deb

rm opsy-deps-gha_*_all.deb
