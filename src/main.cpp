#include <src/driver/deriver.hpp>
#include <iostream>

int main(int argc, const char **argv) {

    int program_result = 0;

    driver drv;

    for (int i = 1; i < argc; i++) {
        if (argv[i] == string("-p")) {
            drv.trace_parsing = true;
        } else if (argv[i] == string("-s")) {
            drv.trace_scanning = true;
        } else if (!drv.parse(argv[i])) {
            std::cout << drv.result << std::endl;
        } else {
            program_result = 1;
        }
    }

    return program_result;
}