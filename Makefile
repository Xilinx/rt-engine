TARGET_LIB := libengine.so 

BUILD_DIR ?= ./build
SRC_DIRS ?= ./engine/src ./runner/src ./device/src ./controller/src ./vitis/src

CXX := g++
SRCS := $(shell find $(SRC_DIRS) -name *.cpp)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

TESTS := $(shell find tests -mindepth 1 -maxdepth 1 -type d)
TEST_BINS := $(TESTS:%=$(BUILD_DIR)/%.exe)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

XILINX_XRT := /opt/xilinx/xrt/
VITIS_INCLUDES := -I $(XILINX_XRT)/include -I$(CONDA_PREFIX)/include/xip/butler -I$(CONDA_PREFIX)/include
VITIS_LIBS := -L$(BUILD_DIR) -L$(XILINX_XRT)/lib -L$(CONDA_PREFIX)/lib
CPPFLAGS ?= $(INC_FLAGS) $(VITIS_INCLUDES) $(VITIS_LIBS) -Wall -std=c++11 -O3

.PHONY: all
all: $(BUILD_DIR)/$(TARGET_LIB) $(TEST_BINS)

$(BUILD_DIR)/tests/%.exe: tests/%/*.cpp $(BUILD_DIR)/$(TARGET_LIB)
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) -o $@ $(dir $<)*.cpp -lengine -lpthread -lbutler -lxilinxopencl -lxrt_core -ljson-c

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
