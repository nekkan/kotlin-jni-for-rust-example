#!/usr/bin/env bash

cd ..
ROOT=$PWD

# Variable that points to the resources folder.
RESOURCES="$ROOT/src/main/resources"

# Variable that points to the Rust project folder.
RUST="$ROOT/src/main/rust"

cd "$RUST" || exit
cd ./target/debug || exit

if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH="$RESOURCES"
elif [[ $LD_LIBRARY_PATH != *"$RESOURCES"* ]]; then
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$RESOURCES"
fi