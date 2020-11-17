#!/usr/bin/env bash

# You will need to have rustup installed on your machine.
if ! command -v rustup &>/dev/null; then
    echo "Command \`rustup\` not found. Make sure you rustup installed in your machine."
    exit 1
fi

# Go to the Rust project directory.
cd ../src/main/rust || exit

rustup target add armv7-linux-androideabi   # for arm
rustup target add i686-linux-android        # for x86
rustup target add aarch64-linux-android     # for arm64
rustup target add x86_64-linux-android      # for x86_64
rustup target add x86_64-unknown-linux-gnu  # for linux-x86-64
rustup target add x86_64-apple-darwin       # for darwin (macOS)
rustup target add x86_64-pc-windows-gnu     # for win32-x86-64-gnu
rustup target add x86_64-pc-windows-msvc    # for win32-x86-64-msvc