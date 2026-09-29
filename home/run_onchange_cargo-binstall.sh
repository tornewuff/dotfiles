#!/bin/sh

# Append cargo bin dir to path in case environment.d isn't in effect yet
export PATH=$PATH:$HOME/.cargo/bin

if ! command -v cargo-binstall >/dev/null 2>&1; then
    curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | sh
fi

if ! command -v cargo-install-update >/dev/null @2>&1; then
    cargo-binstall cargo-update
fi

cargo-install-update install-update -i cargo-binstall cargo-update jj-cli
