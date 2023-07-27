#!/bin/sh

# toolsディレクトリを作成
tools_dir="../tools"
mkdir -p "$tools_dir"

# mitamae
# curl -sL -o "$tools_dir"/mitamae https://github.com/itamae-kitchen/mitamae/releases/download/v1.14.0/mitamae-x86_64-linux
curl -sL -o "$tools_dir"/mitamae https://github.com/itamae-kitchen/mitamae/releases/download/v1.14.0/mitamae-aarch64-linux
chmod +x "$tools_dir"/mitamae
"$tools_dir"/mitamae version