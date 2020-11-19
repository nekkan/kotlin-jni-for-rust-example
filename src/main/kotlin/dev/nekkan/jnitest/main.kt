package dev.nekkan.jnitest

fun main() {
    println(HelloWorld().sayHello("Rust"))
    println(Vector3F(1.0, 1.0, 1.0) + Vector3F(1.0, 1.0, 1.0))
}