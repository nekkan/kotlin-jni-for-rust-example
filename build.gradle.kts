plugins {
    kotlin("jvm") version "1.4.10"
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(kotlin("stdlib"))
}

println(
    "[WARN] If you want to compile all or update the DLL/SO/DYLIB Rust code, " +
            "run the run_all.sh file at scripts folder."
)