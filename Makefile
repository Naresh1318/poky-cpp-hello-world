CXX ?= $(TARGET_TOOLCHAIN_PREFIX)g++
RM = rm

CXXFLAGS ?= -O3 -DNDEBUG -fPIC
EXTRA_CXXFLAGS := -std=c++17

BINDIR=/usr/bin

SOURCES = main.cpp
OBJECTS = $(SOURCES:.cpp=.o)

EXECUTABLE = hello

.cpp .o:
	$(CXX) $(CXXFLAGS) $< -o $@

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LDFLAGS) $^ -o $@

install: $(EXECUTABLE)
	mkdir -p $(DESTDIR)/$(BINDIR)
	install -m 0755 $< $(DESTDIR)/$(BINDIR)

clean:
