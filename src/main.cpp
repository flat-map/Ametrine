#include <iostream>
#include <fstream>
#include <vector>

#include <build/parser.tab.hpp>
#include <src/lexer/lexer.hpp>

using std::string;

int main(int argc, const char* argv[]) {

    if (argc != 2) {
        std::cerr << "[Error] Usage: " << argv[0] << " " << "input-file" << std::endl;
        return 1;
    }

    string input_file = argv[1];
    std::ifstream f;
    f.open(input_file);
    if (f) {
        MyLexer lexer;
        lexer.set_filename(input_file);
        lexer.switch_streams(&f, &std::cout);

        yy::MyParser parser(lexer);
        return parser.parse();

    } else {
        std::cerr << "Error: "
                  << "No such file or directory: '" << input_file << "'"
                  << std::endl;
        return 1;
    }

}