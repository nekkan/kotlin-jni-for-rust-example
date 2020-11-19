extern crate jni;

// This is the interface to the JVM that we'll call the majority of our
// methods on.
use jni::JNIEnv;
// These objects are what you should use as arguments to your native
// function. They carry extra lifetime information to prevent them escaping
// this context and getting used after being GC'd.
use jni::objects::{JObject, JString};
// This is just a pointer. We'll be returning it from our function. We
// can't return one of the objects with lifetime information because the
// lifetime checker won't let us.
use jni::sys::{jboolean, JNI_TRUE};

use crate::hello_world::say_hello;

mod hello_world;

// This keeps Rust from "mangling" the name and making it unique for this
// crate.
#[no_mangle]
pub extern "system" fn Java_dev_nekkan_jnitest_HelloWorld_sayHello(
    environment: JNIEnv,
    object: JObject,
    name: JString,
) -> jboolean {
    say_hello(environment, object, name)
}