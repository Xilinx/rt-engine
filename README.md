Minimal & fast runtime engine for Vitis accelerators. Capable of servicing > 300K QPS.

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
        run()                    Get new job from Q 
                                 Execute lambda function given by user

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
