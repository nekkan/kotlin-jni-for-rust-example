# kotlin-jni-for-rust-example

An example project that could be used as a template to provide native code to Kotlin (JVM only)
with JNI and Rust.

# Compiling

`1.` Make sure that you have Git, JDK (at least version 8) and Cargo installed.

`2.` Clone the repository using `git clone https://github.com/nekkan/kotlin-jni-for-rust-example`
and run `cd kotlin-jni-for-rust-example/scripts`.

`3.` Run the `run_all` script for the first time, and every time you update the Rust code or want to build the project
with Cargo and Gradle you should run it again.

# How it works?

When you run the `run_all` script, it runs all other necessary scripts in the same folder:

* `setup_rust_targets` Setup all targets to run when you want to cross-compile.

* `build_all` Build both Gradle and Cargo projects.

* `generate_headers` Generate headers used to provide the necessary information to make a Rust implementation of each
  native function located at the Kotlin source code.

* `move` Move the generated `.dll`, `.so` or `.dylib` file to the resources folder.

* `add_to_path` Add the JNI files to the path.

*javap command is also useful for getting method signatures: https://stackoverflow.com/a/20318210/12207196*

# Common issues

* `java.lang.UnsatisfiedLinkError no <> in java.library.path`:
  - Go to the scripts folder and run `. ./add_to_path.sh` or pass the parameter
    `-Djava.library.path=path/that/the/jni/file/is/located/on`.
  - On Windows, you can also edit the `PATH` environment variable to point to the JNI file path.

* How can I execute all scripts on Windows?
  - You must download WSL. Then you should run `build_all.bat` with Command Prompt or PowerShell, then you can
    run `run_all.sh` using WSL.

* My `add_to_path.sh` script is not adding to path after running it.
  - You must run it using `. ./add_path.sh` instead of just `./add_path.sh`, since it is not run by `run_all.sh`.