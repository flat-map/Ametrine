name = lang
dir = /home/sotaro/$(name)

scanner = $(name)/src/scanner
parser  = $(name)/src/parser
driver  = $(name)/src/driver

CXX = g++
CXXFLAGS = -Wall -std=c++11 -O2 -I $(dir)
LEX = /usr/bin/flex
YACC = /usr/bin/bison


.PHONY: all

all: clean build build/$(name)

clean:
	rm -rf build

build:
	mkdir -p build



build/$(name): build/parser.o build/scanner.o build/main.o build/driver.o
	$(CXX) $(CXXFLAGS) -o $@ $^

build/main.o: src/main.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/driver.o: src/driver/driver.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/scanner.o: build/scanner.tab.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/parser.o: build/parser.tab.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $^

build/scanner.tab.cpp: src/scanner/scanner.lpp
	$(LEX) -o $@ $^

build/parser.tab.cpp: src/parser/parser.ypp
	$(YACC) -o $@ $^