package dev.nekkan.jnitest

data class Vector3F(val x: Double, val y: Double, val z: Double) {

    external operator fun plus(other: Vector3F): Vector3F

}
