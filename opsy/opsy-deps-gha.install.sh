#! /bin/sh

set -ex

sudo -v

equivs-build opsy-deps-gha.equivs
sudo apt-get install --force-reinstall=true ./opsy-deps-gha_1.0_all.deb
