Simple & fast runtime engine for Vitis accelerators

```
runner/src
  dpu_runner.cpp                 Implementation of Vitis API DpuRunner
    init()                       Initialize DpuController from meta.json or XIR
    execute_async()              Submits job to engine Q, gets job_id
    wait()                       cond_wait on job_id

device/src
  transfer_manager.cpp           Manages host_ptr->fpga_buffer mapping
    upload()                     Write from host to FPGA
    download()                   Read from FPGA to host
  dpu_control_xrt.cpp
  xrt_cu.cpp

controller/src
  dpu_controller.cpp             XRT programming for IP
    init()                       Get device handle, program core(s)

engine/src
  engine.cpp                  
    thread()                     Thread pool
      run()                      Get new job from Q (inTensors, outTensors, dpuController)
        upload()                 Calls DeviceTransferManager.upload()
        exec()                   Calls DpuController.run()
        download()               Calls DeviceTransferManager.download()
    
tests/
  app/
    app.cpp                      Vitis API Resnet example, creates DpuRunner
      DpuRunner()
      DpuRunner.execute_async()
      DpuRunner.wait()
 
    model/
      meta.json
      model.data
      dpu.xclbin
```
