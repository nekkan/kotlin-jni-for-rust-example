plugins {
    kotlin("jvm") version "1.4.10"
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(kotlin("stdlib"))
}

val jar by tasks.getting(Jar::class) {
    manifest {
        attributes["Main-Class"] = "${project.group}.jnitest.MainKt"
    }
}

println(
    "[WARN] If you want to compile all or update the DLL/SO/DYLIB Rust code, " +
            "run the run_all.sh file at scripts folder."
)