VART_PATH := /proj/xsjhdstaff1/aaronn/git/xcdl/Vitis-AI/vart

TARGET_LIB := libengine.so 

BUILD_DIR ?= ./build
SRC_DIRS ?= ./engine/src ./runner/src ./device/src

CXX := g++
SRCS := $(shell find $(SRC_DIRS) -name *.cpp)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

TESTS := $(shell find tests -mindepth 1 -type d)
TEST_BINS := $(TESTS:%=$(BUILD_DIR)/%.exe)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

VART_INCLUDES := -I $(VART_PATH)/runner/include
CPPFLAGS ?= $(INC_FLAGS) $(VART_INCLUDES) -Wall -Wextra -std=c++11 -O3 -L$(BUILD_DIR) 

.PHONY: all
all: $(BUILD_DIR)/$(TARGET_LIB) $(TEST_BINS)

$(BUILD_DIR)/tests/%.exe: tests/%/*.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) -o $@ $(dir $<)*.cpp -lengine -lpthread

$(BUILD_DIR)/$(TARGET_LIB): $(OBJS)
	$(CXX) -fPIC -shared -o $@ $^

$(BUILD_DIR)/%.cpp.o: %.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) -fPIC -c $< -o $@

.PHONY: clean

clean:
	$(RM) -r $(BUILD_DIR)

-include $(DEPS)

MKDIR_P ?= mkdir -p
