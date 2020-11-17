# kotlin-jni-for-rust-example

An example project that could be used as a template to provide native code to Kotlin (JVM only)
with JNI and Rust.

# Compiling

`1.` Make sure that you have Git, JDK (at least version 8) and Cargo installed.

`2.` Clone the repository using `git clone https://github.com/nekkan/kotlin-jni-for-rust-example`
and run `cd kotlin-jni-for-rust-example/scripts`.

`3.` Run the `run_all.sh` script for the first time, and every time you update the Rust code or want to build the
project with Cargo and Gradle you should run it again.

# How it works?

When you run the `run_all.sh` script, it runs all other necessary scripts in the same folder:

* `setup_rust_targets.sh` Setup all targets to run when you want to cross-compile.

* `build_all.sh` Build both Gradle and Cargo projects.

* `generate_headers.sh` Generate headers used to provide the necessary information to make a Rust implementation of each
  native function located at the Kotlin source code.

* `move.sh` Move the generated `.dll`, `.so` or `.dylib` file to the resources folder.