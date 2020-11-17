#!/usr/bin/env bash

# You will need to have Java Development Kit installed on your machine.
if ! command -v javac &>/dev/null; then
    echo "Command \`javac\` not found. Make sure you have Java Development Kit installed in your machine."
    exit 1
fi

# Change the current working directory to the previous one, since the directory structure
# we expect should be something like this:
# root
# ├─ scripts/
# ├──── build.bat
# ├──── build.sh
# ├──── src/
# ├──────── main/
# ├──────────── kotlin/
# ├──────────── resources/
# ├──────────────── headers/
# ├──────────── rust/

cd ..
ROOT=$PWD

# Set-up a variable that points to the expected build classes directory.
BUILD_CLASSPATH="./build/classes/kotlin/main"

# Go to the build working directory and compile all headers.
cd "${BUILD_CLASSPATH}" || exit

BUILD_CLASSPATH=$PWD

# The package that all Kotlin files are located.
PACKAGE="dev.nekkan.jnitest"

function generate_header() {
    echo "Generating a header file for $1"

    # Run javah if Java version is lower than 9, otherwise use javah.
    if ! command -v javah &>/dev/null; then
        echo "Javah command not found, using \`javac -d\`..."
        javac -d "$ROOT/src/main/resources/headers" -classpath "$BUILD_CLASSPATH" -h "$PACKAGE.$1"
    else
        javah -d "$ROOT/src/main/resources/headers" -classpath "$BUILD_CLASSPATH" "$PACKAGE.$1"
    fi
}

cd "./dev/nekkan/jnitest" || exit

for file_name in *; do
    if [[ $file_name == *.class ]]; then
        generate_header "${file_name/.class/}"
    fi
done
