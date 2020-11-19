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
use jni::sys::{jboolean, JNI_TRUE, jobject};

use crate::hello_world::say_hello;
use crate::vector3f::add_to_vector3f;

mod hello_world;
mod vector3f;

/*
 * Class:     dev_nekkan_jnitest_HelloWorld
 * Method:    sayHello
 * Signature: (Ljava/lang/String;)Z
 *
 * JNIEXPORT jboolean JNICALL Java_dev_nekkan_jnitest_HelloWorld_sayHello
 * (JNIEnv *, jobject, jstring);
 */
#[no_mangle] // This keeps Rust from "mangling" the name and making it unique for this
// crate.
pub extern "system" fn Java_dev_nekkan_jnitest_HelloWorld_sayHello(
    environment: JNIEnv,
    object: JObject,
    name: JString,
) -> jboolean {
    say_hello(environment, object, name)
}

/*
 * Class:     dev_nekkan_jnitest_Vector3F
 * Method:    plus
 * Signature: (Ldev/nekkan/jnitest/Vector3F;)Ldev/nekkan/jnitest/Vector3F;
 *
 * JNIEXPORT jobject JNICALL Java_dev_nekkan_jnitest_Vector3F_plus
 (JNIEnv *, jobject, jobject);
 */
#[no_mangle]
pub extern "system" fn Java_dev_nekkan_jnitest_Vector3F_plus(
    environment: JNIEnv,
    object: JObject,
    other: JObject,
) -> jobject {
    add_to_vector3f(environment, object, other)
}