CXXFLAGS+=-Iseqan-library-2.0.0/include/
CXXFLAGS+=-O3 -DNDEBUG -DSEQAN_ENABLE_TESTING=0 -DSEQAN_ENABLE_DEBUG=0 -DSEQAN_HAS_OPENMP
CXXFLAGS+=-W -Wall -Wno-long-long -pedantic -Wno-variadic-macros
CXXFLAGS+=-g -fopenmp

LDFLAGS+=-L/usr/lib/ -lpthread -lrt
LDFLAGS+=-g -fopenmp

default: all
all: suffix_tree_mapping

suffix_tree_mapping: suffix_tree_mapping.o
	$(CXX) -o suffix_tree_mapping suffix_tree_mapping.o $(LDFLAGS)

suffix_tree_mapping.o: suffix_tree_mapping.cpp
	$(CXX) $(CXXFLAGS) -c -o suffix_tree_mapping.o suffix_tree_mapping.cpp

clean:
	rm -f suffix_tree_mapping.o suffix_tree_mapping

.PHONY: default all clean
