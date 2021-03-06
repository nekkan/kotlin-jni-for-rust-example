#!/usr/bin/env bash

cd ..
ROOT=$PWD

# Variable that points to the resources folder.
RESOURCES="$ROOT/src/main/resources"

# Variable that points to the Rust project folder.
RUST="$ROOT/src/main/rust"

cd "$RUST" || exit
cd ./target/debug || exit

for file in *; do
    if [[ $file == *.so ]] || [[ $file == *.dll ]] || [[ $file == *.dylib ]]; then
        mv "$file" "$RESOURCES"
    fi
done
