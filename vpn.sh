#!/bin/sh

nix-shell -p stdenv.cc.cc.lib qt6.qtwebengine qt6.full python312Packages.pyqt6 python312Packages.pyqt6-webengine zstd --run "/home/$USER/.local/bin/openconnect-sso $*"
