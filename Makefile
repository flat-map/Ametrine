name = lang
dir = /home/sotaro/$(name)

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11 -O2 -I $(dir)
LEX = /usr/bin/flex
YACC = /usr/bin/bison


.PHONY: all run

run: build/lang test/test.lang
	./build/lang test/test.lang

all: clean build build/$(name)

clean:
	rm -rf build

build:
	mkdir -p build



build/$(name): build/ast.o build/parser.o build/lexer.o build/main.o build/ast_getType.o build/ast_getValue.o
	$(CXX) $(CXXFLAGS) -o $@ $^

build/main.o: src/main.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/ast.o: src/ast/ast.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/ast_getType.o: src/ast/ast_getType.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/ast_getValue.o: src/ast/ast_getValue.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/lexer.o: build/lexer.tab.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/parser.o: build/parser.tab.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/lexer.tab.cpp: src/lexer/lexer.lpp
	$(LEX) --header-file=build/lexer.tab.hpp -o $@ $^

build/parser.tab.cpp: src/parser/parser.ypp
	$(YACC) -o $@ $^


