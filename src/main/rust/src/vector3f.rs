extern crate jni;

// This is the interface to the JVM that we'll call the majority of our
// methods on.
use jni::JNIEnv;
// These objects are what you should use as arguments to your native
// function. They carry extra lifetime information to prevent them escaping
// this context and getting used after being GC'd.
use jni::objects::{JObject, JString, JValue};
// This is just a pointer. We'll be returning it from our function. We
// can't return one of the objects with lifetime information because the
// lifetime checker won't let us.
use jni::sys::{jboolean, JNI_TRUE, jobject};

fn get_double_parameter(object: JObject, environment: JNIEnv, name: &str) -> f64 {
    environment.call_method(object, name, "()D", &[])
        .expect(&*format!("Cannot call the {} method.", name))
        .d().expect("Failed to convert to double.")
}

pub fn add_to_vector3f(
    environment: JNIEnv,
    object: JObject,
    other: JObject,
) -> jobject {
    let class = environment.find_class("dev/nekkan/jnitest/Vector3F")
        .expect("Class `dev.nekkan.jnitest.Vector3F` not found.");

    let other_x = get_double_parameter(other, environment, "getX");
    let other_y = get_double_parameter(other, environment, "getY");
    let other_z = get_double_parameter(other, environment, "getZ");
    let this_x = get_double_parameter(object, environment, "getX");
    let this_y = get_double_parameter(object, environment, "getY");
    let this_z = get_double_parameter(object, environment, "getZ");

    let x = JValue::Double(this_x + other_x);
    let y = JValue::Double(this_y + other_y);
    let z = JValue::Double(this_z + other_z);

    // Signature logic: (Double, Double, Double)Void
    environment
        .new_object(class, "(DDD)V", &[x, y, z])
        .expect("Constructor for Vector3F (Double,Double,Double/Void) not found.")
        .into_inner()
}