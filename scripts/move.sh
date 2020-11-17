# You will need to have Cargo installed on your machine.
if ! command -v cargo &>/dev/null; then
    echo "Command \`cargo\` not found. Make sure you have Cargo installed in your machine."
    exit 1
fi

cd ..
ROOT=$PWD

# Variable that points to the resources folder.
RESOURCES="$ROOT/src/main/resources"

# Variable that points to the Rust project folder.
RUST="./src/main/rust"

# Build Rust project.
cd "$RUST" || exit
cargo build

cd ./target/debug || exit

for file in *; do
    if [[ $file == *.so ]] || [[ $file == *.dll ]] || [[ $file == *.dylib ]]; then
        mv "$file" "$RESOURCES"
    fi
done
