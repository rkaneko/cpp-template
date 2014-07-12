
PREFIX = /usr/local
DEFAULT_CONFIG = ${PREFIX}/etc/$(PROJECT_NAME).conf

BIN = bin
SRC = src
INC = include
DIST = dist
ETC = etc
SCRIPT = script

MAIN_NAME = main

EXE = $(BIN)/$(PROJECT_NAME)
VERSION=0.1.0
ARCHIVE=$(PROJECT_NAME)-$(VERSION)

# CC = gcc
# CXX = g++
CC = clang
CXX = clang++

# WARNFLAGS = -Wall
WARNFLAGS = -Wall -Wnon-virtual-dtor -Woverloaded-virtual

CXXFLAGS = -std=gnu++11 $(WARNFLAGS)

LIBS_HEADERS = $(shell find $(INC)/ -name *.h)
LIBS_HEADERS += $(shell find $(INC)/ -name *.hpp)

HEADERS = $(wildcard $(SRC)/*.hpp)
HEADERS += $(LIBS_HEADERS)
SOURCES = $(wildcard $(SRC)/*.cpp)
OBJECTS = $(patsubst %.cpp,%.o,$(SOURCES))
# OBJECTS = $(SOURCES:.cpp=.o)

LIB_OBJECTS = $(filter-out $(SRC)/$(MAIN_NAME).o,$(OBJECTS))

.SUFFIXES: .cpp .hpp .o .c .h

all: build


build: $(EXE)


$(EXE): $(OBJECTS)
\t$(CXX) $(CXXFLAGS) -o $@ $(OBJECTS)

$(OBJECTS): $(HEADERS)

clean:
\trm -f $(OBJECTS) $(EXE)

.PHONY: all build clean
