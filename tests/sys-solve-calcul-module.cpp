#include <iostream>
#include <string>
#include <cstring>


extern "C" {
    char* modpow_str(const char* base, const char* exp, const char* mod);
    void free_rust_cstring(char* s);
}


int main() {
    const char* base = "12345678901234567890";
    const char* exp = "9876543210";
    const char* mod = "1000000007";

    char* res = modpow_str(base, exp, mod);
    if (res != nullptr) {
        std::cout << "Result: " << res << std::endl;
        free_rust_cstring(res);
    } else {
        std::cerr << "Error computing modpow" << std::endl;
    }
    return 0;
}
