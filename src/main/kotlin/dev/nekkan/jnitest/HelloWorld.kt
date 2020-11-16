package dev.nekkan.jnitest

class HelloWorld {

    init {
        System.loadLibrary("rustproject")
    }

    external fun sayHello(name: String): Boolean

}