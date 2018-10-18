#include <validator/Message.h>

void showErrorMsg( const std::string& s ) {
    std::cerr << "\033[1;31m" << s << "\033[0m\n";
}

void showSuccessMsg( const std::string& s ) {
    std::cout << "\033[1;32m" << s << "\033[0m\n";
}

void showMsg( const std::string& s ) {
    std::cout << s << "\n";
}
