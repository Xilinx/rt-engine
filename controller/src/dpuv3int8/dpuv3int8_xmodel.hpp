class Xmodel {
  public:
    uint32_t getInW();
    uint32_t getInH();
    uint32_t getInCh();
    uint32_t getOutSize();
    uint32_t getInKernelW();
    uint32_t getPadLft();
    uint32_t getPadRgt();
    uint32_t getInStrdW();
    uint32_t getSwapBufSize();
    uint32_t getDruSrcBufSize();
    uint32_t getDruDstBufSize();
    uint32_t getInDdrSize();
    bool getDruMode();
    bool getChannelAugmentationMode();
    std::string getInstrAsmFileName();
    std::string getInstrFileName();
    std::string getParamsFileName();
    bool getEnableXmodelFormat();

    bool getSinglePoolDebug();
    std::string getDebugDumpdir();
    std::string getDebugDinFilename();
    std::string getDebugGoldenFilename();

    Xmodel(std::string meta, bool isDebugMode);
    Xmodel(xir::Subgraph *subgraph, bool isDebugMode);        
    
  private:
    std::string getFileNameIfExists(std::string name, json_object* jobj);
    uint32_t getValue(std::string name, json_object* jobj);
    bool getBool(std::string name, json_object* jobj);
    void loadParamsJson(json_object* jobj, bool isDebugMode);
    void loadParamsXIR(std::string xmodel_filename, bool isDebugMode);
    void loadParamsSubgraph(xir::Subgraph *subgraph, bool isDebugMode);
    std::unique_ptr<InstrFormatConverter> instrFormatConverter_;

    uint32_t inW_;
    uint32_t inH_;
    uint32_t inCh_;
    uint32_t outSize_;
    uint32_t inKernelW_;
    uint32_t padLft_;
    uint32_t padRgt_;
    uint32_t inStrdW_;
    uint32_t swapBufSize_;
    uint32_t druSrcBufSize_;
    uint32_t druDstBufSize_;
    uint32_t inDdrSize_;
    bool dru_mode_;
    bool channel_augmentationmode_;
    std::string instr_asm_filename_;
    std::string instr_filename_;
    std::string params_filename_;
    bool enable_xmodel_format_;
    std::string runner_dir_;

    bool single_pool_debug_;
    std::string debug_dumpdir_;
    std::string debug_din_filename_;
    std::string debug_golden_filename_;



};

