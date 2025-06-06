//! # Modular Exponentiation FFI Library
//!
//! This library provides an efficient modular exponentiation function
//! for arbitrarily large integers using Rust's `num-bigint` crate.
//!
//! ## Exposed C API
//!
//! ### `rust_modpow_string(base_str, exp_str, mod_str) -> *mut c_char`
//! - Computes `(base ^ exp) % mod`, all values provided as null-terminated decimal strings.
//! - Returns a C string (heap-allocated) containing the result or null if error.
//!
//! ### `free_rust_cstring(ptr)`
//! - Frees memory allocated for the returned result string.
//!
//! ## Internal Logic
//! - Modular exponentiation is done using binary exponentiation for performance.

use num_bigint::BigUint;
use num_traits::{One, Zero};
use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::str::FromStr;

/// Internal function to compute (base^exp) % modulus efficiently.
/// Uses binary exponentiation method.
///
/// # Parameters
/// - `base`: reference to a BigUint (base value)
/// - `exp`: reference to a BigUint (exponent)
/// - `modulus`: reference to a BigUint (modulo)
///
/// # Returns
/// A BigUint containing the result of modular exponentiation.
fn mod_pow(base: &BigUint, exp: &BigUint, modulus: &BigUint) -> BigUint {
    let mut result = BigUint::one();
    let mut base = base % modulus;
    let mut exp = exp.clone();

    while !exp.is_zero() {
        if &exp & BigUint::one() == BigUint::one() {
            result = (&result * &base) % modulus;
        }
        base = (&base * &base) % modulus;
        exp >>= 1;
    }

    result
}

/// FFI-safe function to compute modular exponentiation from C-style decimal strings.
///
/// # Safety
/// This function uses unsafe blocks to convert raw pointers to strings.
/// Make sure to pass valid, null-terminated C strings.
///
/// # Parameters
/// - `base_str`: *const c_char — null-terminated C string representing base (decimal)
/// - `exp_str`: *const c_char — null-terminated C string representing exponent (decimal)
/// - `mod_str`: *const c_char — null-terminated C string representing modulus (decimal)
///
/// # Returns
/// - *mut c_char — pointer to a newly allocated C string containing result
/// - Returns null pointer if any input is invalid or conversion fails.
///
/// # Example C usage
/// ```c
/// char* result = rust_modpow_string("123456", "789", "100000007");
/// printf("Result: %s\n", result);
/// free_rust_cstring(result);
/// ```
#[no_mangle]
pub extern "C" fn rust_modpow_string(
    base_str: *const c_char,
    exp_str: *const c_char,
    mod_str: *const c_char,
) -> *mut c_char {
    unsafe {
        if base_str.is_null() || exp_str.is_null() || mod_str.is_null() {
            return std::ptr::null_mut();
        }

        // Convert raw pointers to Rust string slices
        let base_cstr = CStr::from_ptr(base_str);
        let exp_cstr = CStr::from_ptr(exp_str);
        let mod_cstr = CStr::from_ptr(mod_str);

        let base_str = match base_cstr.to_str() {
            Ok(s) => s,
            Err(_) => return std::ptr::null_mut(),
        };
        let exp_str = match exp_cstr.to_str() {
            Ok(s) => s,
            Err(_) => return std::ptr::null_mut(),
        };
        let mod_str = match mod_cstr.to_str() {
            Ok(s) => s,
            Err(_) => return std::ptr::null_mut(),
        };

        // Parse to BigUint
        let base = match BigUint::from_str(base_str) {
            Ok(n) => n,
            Err(_) => return std::ptr::null_mut(),
        };
        let exp = match BigUint::from_str(exp_str) {
            Ok(n) => n,
            Err(_) => return std::ptr::null_mut(),
        };
        let modulus = match BigUint::from_str(mod_str) {
            Ok(n) => n,
            Err(_) => return std::ptr::null_mut(),
        };

        // Compute result
        let result = mod_pow(&base, &exp, &modulus);
        let result_str = result.to_string();

        // Convert to C string and return pointer
        CString::new(result_str).unwrap().into_raw()
    }
}

/// Free memory allocated for C string returned by `rust_modpow_string`.
///
/// # Parameters
/// - `ptr`: *mut c_char — pointer to C string returned by Rust
///
/// # Safety
/// Must only be called once per pointer returned by `rust_modpow_string`.
#[no_mangle]
pub extern "C" fn free_rust_cstring(ptr: *mut c_char) {
    unsafe {
        if !ptr.is_null() {
            let _ = CString::from_raw(ptr);
        }
    }
}
