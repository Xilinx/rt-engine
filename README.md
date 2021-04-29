# rt-engine
Minimal & fast async runtime engine for Vitis accelerators. Capable of servicing > 800K requests per second.

### Overview

```
runner/src
  dpu_runner.cpp                 Implementation of Vitis API DpuRunner
                                 Initialize DpuController from meta.json or XIR
    execute_async()             
      lambda_func:               Lambda function submitted to engine Q, get job_id
        run()                    Call DpuController.run()
    wait()                       Wait for engine to complete job_id

device/src
  device_handle.cpp              Acquire FPGA DeviceHandle, store metadata
  device_memory.cpp              DeviceBuffer manages FPGA memory for TensorBuffer

controller/src
  dpu_controller.cpp             XRT programming for IP, holds one DeviceHandle
    DpuController()              Init IP core with meta.json or XIR
    run()
      alloc()                    Allocate in_addr/out_addr FPGA bufs for host ptrs
      upload()                   Write from host to FPGA DDR
      execute()                  Pass in_addr/out_addr to core, execute
      download()                 Read from FPGA to host DDR

engine/src
  engine.cpp                  
    Engine
      submit()                   Push new DPU task (lambda function) to Q
      wait()                     Block until task done

    EngineThreadPool
      run()                      Fetch new task from Q, exec user lambda_func

tests/
  engine/
    main.cpp                     Engine max throughput tests
    single_thread.cpp            shows >300K requests per second
    multi_thread.cpp             shows >800K requests per second

  app/
    main.cpp                     Vitis API app throughput tests, uses DpuRunner
    single_thread.cpp            shows ~4K requests per second (limited by DDR)
    multi_thread.cpp             shows ~13K requests per second (limited by DDR)
 
    models/
      sample_resnet50/
        meta.json                Describes configs/files to create this DpuRunner
```

### Example CPP Usage

```
runner/src/dpu_runner.cpp:

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<vart::TensorBuffer*>& inputs,
  const std::vector<vart::TensorBuffer*>& outputs) {
  Engine& engine = Engine::get_instance();
  auto job_id = engine.submit([this, &inputs, &outputs] {
    dpu_controller_[0]->run(inputs, outputs);
  });
  return std::pair<uint32_t, int>(job_id, 0);
}

int DpuRunner::wait(int jobid, int timeout) {
  Engine& engine = Engine::get_instance();
  engine.wait(jobid);

  return 0;
}
```

### Build && Install
```
# Link from and install to Conda Environment
./cmake.sh --clean --build-dir=$PWD/build --install-prefix=$CONDA_PREFIX --conda --type=release

#If you would like to utilise system's XRM, please build using the following command
./cmake.sh --clean --build-dir=$PWD/cmake-build --install-prefix=$CONDA_PREFIX --conda --cmake-options="-DXRM_DIR=/opt/xilinx/xrm/share/cmake" --type=release

# Link from and install to system
./cmake.sh --clean --build-dir=$PWD/build --type=release
```

### Run Test Example
Test executables are generated in the cmake build-dir  
They are also installed into `CMAKE_INSTALL_PATH/bin`  
Meaning the executables should be in your path
```
engine.exe
```

### Conda Environment
[Install Anaconda](https://docs.anaconda.com/anaconda/install/linux/#installation)
  
For Universal Development (You are building, and installing unilog/targetfactory/xir/vart/xip/xrm/xrt):  
```
conda create -n rt-engine python=3.6 cmake opencv protobuf libprotobuf-static pybind11 json-c jsoncpp glog libuuid -c defaults -c conda-forge/label/gcc7
```

For rt-engine Development (You want to use prebuilt conda packages for: unilog/targetfactory/xir/vart/xip/xrm/xrt):  
```
conda create -n rt-engine python=3.6 cmake vart -c defaults -c conda-forge/label/gcc7 -c http://web/~bryanloz
```

For rt-engine Testing (You want everything from prebuilt conda packages)
```
conda create -n rt-engine python=3.6 rt-engine -c defaults -c conda-forge/label/gcc7 -c http://web/~bryanloz
```
