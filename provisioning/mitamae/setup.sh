#!/bin/sh

# curl -sL -o ../tools/mitamae https://github.com/itamae-kitchen/mitamae/releases/download/v1.14.0/mitamae-x86_64-linux
curl -sL -o ../tools/mitamae https://github.com/itamae-kitchen/mitamae/releases/download/v1.14.0/mitamae-aarch64-linux.tar.gz

chmod +x ../tools/mitamae
../tools/mitamae version