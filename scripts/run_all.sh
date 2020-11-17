# You will need to have Java Development Kit installed on your machine.
if ! command -v java &>/dev/null; then
    echo "Command \`java\` not found. Make sure you have Java Development Kit installed in your machine."
    exit 1
fi

# You will need to have Cargo installed on your machine.
if ! command -v cargo &>/dev/null; then
    echo "Command \`cargo\` not found. Make sure you have Cargo installed in your machine."
    exit 1
fi

./setup_rust_targets.sh
./build_all.sh
./generate_headers.sh
./move.sh
