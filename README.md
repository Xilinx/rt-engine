Minimal & fast runtime engine for Vitis accelerators. Capable of servicing > 800K QPS.

### Overview

```
runner/src
  dpu_runner.cpp                 Implementation of Vitis API DpuRunner
                                 Initialize DpuController from meta.json or XIR
    execute_async()             
      lambda_func:               Lambda function submitted to engine Q, get job_id
        upload()                 Call DpuController.upload()
        run()                    Call DpuController.run()
        download()               Call DpuController.download()
    wait()                       Wait for engine to complete job_id

device/src
  xrt_cu.cpp                     XrtCu acquires FPGA handle, holds metadata, runs IP

controller/src
  dpu_controller.cpp             XRT programming for IP, holds one XrtCu
    init()                       Set up IP core to run specific model
    alloc()                      Allocate in_addr/out_addr device bufs for host ptrs
    upload()                     Write from host to FPGA
    run()                        Pass in_addr/out_addr to core, execute
    download()                   Read from FPGA to host

engine/src
  engine.cpp                  
    Engine
      EngineThreadPool
        run()                    Fetch new job from Q, exec user lambda_func
        wait()                   Block until job done

tests/
  engine/
    main.cpp                     Engine max throughput tests
    single_thread.cpp            shows >300K QPS
    multi_thread.cpp             shows >800K QPS

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
