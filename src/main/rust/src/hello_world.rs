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

fn say_hello_internally(name: &str) -> bool {
    println!("Hello, {}", name);
    true
}

pub fn say_hello(
    environment: JNIEnv,
    object: JObject,
    name: JString,
) -> jboolean {
    // First, we have to get the string out of Kotlin environment.
    let name: String = environment.get_string(name)
        .expect("Failed to get the name")
        .into();

    // Now, we need to print the name.
    say_hello_internally(&*name);

    // Then we have to create a new valid Kotlin boolean to return.
    return JNI_TRUE;
}

