#pragma once

#ifndef FLEX_SCANNER
#include "FlexLexer.h"
#endif

#include <vector>

class MyLexer : public yyFlexLexer {
public:
    std::vector<string> filenames;
    int cur_fid;

    void set_filename(const std::string& filename);

    int yylex(yy::MyParser::semantic_type& lval, yy::MyParser::location_type& loc);
};
