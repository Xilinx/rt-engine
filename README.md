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
    single_thread.cpp            shows ~4K requests per second (limited by XRT)
    multi_thread.cpp             shows ~13K requests per second (limited by XRT)
 
    models/
      xdnn_resnet50/
        meta.json                Describes configs/files to create this DpuRunner
```

### Requirements

* Xilinx Butler (http://xcdl190260/vitis/XIP)
* XRT (https://github.com/Xilinx/XRT)
* json-c (https://github.com/json-c/json-c)


### Example

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

### Build

```
make clean; make -j
```


### Run

```
export LD_LIBRARY_PATH=build:${CONDA_PREFIX}/lib:/opt/xilinx/xrt/lib 
export XILINX_XRT=/opt/xilinx/xrt
build/tests/engine.exe
build/tests/app.exe tests/app/models/xdnn_resnet50/meta.json
```
