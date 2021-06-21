#pragma once

#include <string>
using std::string;
#include <build/parser.tab.hpp>

#define YY_DECL yy::parser::symbol_type yylex(driver &drv)

YY_DECL;

class driver {
  public:
    driver();
    int result;
    int parse(const string &f);
    string file;
    bool trace_parsing;
    void scan_begin();
    void scan_end();
    yy::location location;
};
