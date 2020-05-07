Minimal & fast runtime engine for Vitis accelerators. Capable of servicing > 300K QPS.

### Overview

```
runner/src
  dpu_runner.cpp                 Implementation of Vitis API DpuRunner
                                 Initialize DpuController from meta.json or XIR
    execute_async()             
      lambda_func:               Lambda function submitted to engine Q, get job_id
        upload()                 Call DeviceTransferManager.upload()
        exec()                   Call DpuController.run()
        download()               Call DeviceTransferManager.download()
    wait()                       Wait for engine to complete job_id

device/src
  transfer_manager.cpp           Manage host_ptr->fpga_buffer mapping
    upload()                     Write from host to FPGA
    download()                   Read from FPGA to host
  dpu_control_xrt.cpp
  xrt_cu.cpp

controller/src
  dpu_controller.cpp             XRT programming for IP
    init()                       Get device handle, program core(s)

engine/src
  engine.cpp                  
    Engine
      EngineThreadPool
        run()                    Fetch new job from Q, exec lambda_func given by user
        wait()                   Block until job done

tests/
  engine/
    main.cpp                     Engine max throughput test, shows > 300K QPS

  app/
    main.cpp                     Vitis API Resnet example, uses DpuRunner
      DpuRunner()
      DpuRunner.execute_async()
      DpuRunner.wait()
 
    model/
      meta.json
      model.data
      dpu.xclbin
```

### Example

```
runner/src/dpu_runner.cpp:

std::pair<uint32_t, int> DpuRunner::execute_async(
  const std::vector<vart::TensorBuffer*>& inputs,
  const std::vector<vart::TensorBuffer*>& outputs) {
  Engine& engine = Engine::get_instance();
  auto job_id = engine.submit([&inputs, &outputs, &dpu_controller_] {
    prepare_and_upload(inputs);
    dpu_controller_.run();
    download_and_post_process(outputs);
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

make clean; make


### Run

LD_LIBRARY_PATH=build build/tests/engine.exe
LD_LIBRARY_PATH=build build/tests/app.exe
