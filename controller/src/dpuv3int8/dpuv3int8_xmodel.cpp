#include "dpuv3int8_controller.hpp"

std::string getFileNameIfExists(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    std::cout<<"missing "+name+" field in meta.json"<<std::endl;
  return json_object_get_string(obj);

}

uint32_t getValue(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    throw std::runtime_error("Error: missing "+name+" field in meta.json");
  return json_object_get_int(obj);

}

bool getBool(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    {
      if(name=="usexmodel" and name=="singlePoolDebug")
        return false;
    }
  return json_object_get_boolean(obj);

}

inputLayerParams::inputLayerParams(json_object* jobj, bool isDebugMode, bool multiFormat)
{
  if(multiFormat)
  {
    json_object* obj = json_object_object_get(jobj, "shape");
    json_object* shapeVal;
    shapeVal = json_object_array_get_idx(obj, 1);
    inH_ = json_object_get_int(shapeVal);
    shapeVal = json_object_array_get_idx(obj, 2);
    inW_ = json_object_get_int(shapeVal);
    shapeVal = json_object_array_get_idx(obj, 3);
    inCh_ = json_object_get_int(shapeVal);
  }
  else
  {
    inW_ = getValue("inW", jobj);
    inH_ = getValue("inH", jobj);
    inCh_ = getValue("inCh", jobj);
  }
  inDdrSize_ = getValue("inDDRSize", jobj);
  padRgt_ = getValue("padRt", jobj);

  dru_mode_ = isDebugMode ? false:getBool("druMode", jobj);
  
  channel_augmentationmode_ = getBool("channelAugmentationMode", jobj);
 
  inKernelW_ = getValue("inKernelW", jobj);
  padLft_ = getValue("padLft", jobj);
  inStrdW_ = getValue("inStrdW", jobj);
  druSrcBufSize_ = getValue("druSrcBufSize", jobj);
  druDstBufSize_ = getValue("druDstBufSize", jobj);

}

outputLayerParams::outputLayerParams(json_object* jobj, bool multiFormat)
{
  if(multiFormat)
  {
    json_object* obj = json_object_object_get(jobj, "shape");
    json_object* shapeVal;
    shapeVal = json_object_array_get_idx(obj, 1);
    outH_ = json_object_get_int(shapeVal);
    shapeVal = json_object_array_get_idx(obj, 2);
    outW_ = json_object_get_int(shapeVal);
    shapeVal = json_object_array_get_idx(obj, 3);
    outCh_ = json_object_get_int(shapeVal);
   
    outDdrSize_ = getValue("outDDRSize", jobj);
  }
  else
  {
    outH_ = getValue("outH", jobj);
    outW_ = getValue("outW", jobj);
    outCh_ = getValue("outCh", jobj);
    outDdrSize_ = getValue("outDDRSize", jobj);
  }
}

inputLayerParams::inputLayerParams(const xir::Subgraph *subgraph, bool isDebugMode, bool multiFormat)
{
    inW_ = subgraph->get_attr<int>("inW");
    inH_ = subgraph->get_attr<int>("inH");
    inCh_ = subgraph->get_attr<int>("inCh");
    inDdrSize_ = subgraph->get_attr<int>("inDDRSize");
    padRgt_ = subgraph->get_attr<int>("padRt");
  
    dru_mode_ = isDebugMode ? false:subgraph->get_attr<int>("druMode");
  
    channel_augmentationmode_ = subgraph->get_attr<int>("channelAugmentationMode");
   
    inKernelW_ = subgraph->get_attr<int>("inKernelW");
    padLft_ = subgraph->get_attr<int>("padLft");
    inStrdW_ = subgraph->get_attr<int>("inStrdW");
    
    druSrcBufSize_ = subgraph->get_attr<int>("druSrcBufSize");
    druDstBufSize_ = subgraph->get_attr<int>("druDstBufSize");

}

outputLayerParams::outputLayerParams(const xir::Subgraph *subgraph, bool multiFormat)
{
  outH_ = subgraph->get_attr<int>("outH");
  outW_ = subgraph->get_attr<int>("outW");
  outCh_ = subgraph->get_attr<int>("outCh");
  outDdrSize_ = subgraph->get_attr<int>("outSize");

}


uint32_t Xmodel::getInW(){return inputParams_[0].inW_;}
uint32_t Xmodel::getInH(){return inputParams_[0].inH_;}
uint32_t Xmodel::getInCh(){return inputParams_[0].inCh_;}
uint32_t Xmodel::getOutW(){return outputParams_[0].outW_;}
uint32_t Xmodel::getOutH(){return outputParams_[0].outH_;}
uint32_t Xmodel::getOutCh(){return outputParams_[0].outCh_;}
uint32_t Xmodel::getOutDdrSize()
{
   int totalOutputDdrSize = 0;
   for(int i=0; i<outputParams_.size(); i++)
   {
     totalOutputDdrSize = totalOutputDdrSize + outputParams_[i].outDdrSize_;
   }
   return totalOutputDdrSize;
}
uint32_t Xmodel::getInKernelW(){return inputParams_[0].inKernelW_;}
uint32_t Xmodel::getPadLft(){return inputParams_[0].padLft_;}
uint32_t Xmodel::getPadRgt(){return inputParams_[0].padRgt_;}
uint32_t Xmodel::getInStrdW(){return inputParams_[0].inStrdW_;}
uint32_t Xmodel::getSwapBufSize(){return swapBufSize_;}
uint32_t Xmodel::getDruSrcBufSize(){return inputParams_[0].druSrcBufSize_;}
uint32_t Xmodel::getDruDstBufSize(){return inputParams_[0].druDstBufSize_;}
uint32_t Xmodel::getInDdrSize(){return inputParams_[0].inDdrSize_;}
bool Xmodel::getDruMode(){return inputParams_[0].dru_mode_;}
bool Xmodel::getChannelAugmentationMode(){return inputParams_[0].channel_augmentationmode_;}
std::string Xmodel::getInstrAsmFileName(){return instr_asm_filename_;}
std::string Xmodel::getInstrFileName(){return instr_filename_;}
std::string Xmodel::getParamsFileName(){return params_filename_;}
bool Xmodel::getEnableXmodelFormat(){return enable_xmodel_format_;}

bool Xmodel::getSinglePoolDebug(){return single_pool_debug_;}
std::string Xmodel::getDebugDumpdir(){return debug_dumpdir_;}
std::string Xmodel::getDebugDinFilename(){return debug_din_filename_;}
std::string Xmodel::getDebugGoldenFilename(){return debug_golden_filename_;}


std::string Xmodel::getFileNameIfExists(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    std::cout<<"missing "+name+" field in meta.json"<<std::endl;
  return json_object_get_string(obj);

}

uint32_t Xmodel::getValue(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    throw std::runtime_error("Error: missing "+name+" field in meta.json");
  return json_object_get_int(obj);

}

bool Xmodel::getBool(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    {
      if(name=="usexmodel" and name=="singlePoolDebug")
        return false;
    }
  return json_object_get_boolean(obj);

}

void Xmodel::loadParamsJson(json_object* jobj, bool isDebugMode)
{
  instrFormatConverter_.reset(new InstrFormatConverter());
  instrFormatConverter_->convertAsmToDdrFormat(instr_asm_filename_, instr_filename_);
  
  bool multiFormat = false;
  json_object_object_foreach(jobj, key, val) 
  {
    std::string keyString(key);
    if(keyString.compare("inputs") == 0)
    {
      multiFormat = true;
      assert(val);
    }
  }
  
  if(multiFormat)
  {
    json_object_object_foreach(jobj, key, val)
    {
      std::string keyString(key);
      if(keyString.compare("inputs") == 0)
      {
        json_object_object_foreach(val, inputkey, inputval)
        {
          assert(inputkey);
          inputParams_.push_back(inputLayerParams(inputval, isDebugMode, multiFormat));
        }
      }
      if(keyString.compare("outputs") == 0)
      {
        json_object_object_foreach(val, outputkey, outputval)
        {
          assert(outputkey);
          outputParams_.push_back(outputLayerParams(outputval, multiFormat)); 
        }
      }
    }
  }
  else
  {
    inputParams_.push_back(inputLayerParams(jobj, isDebugMode, multiFormat));
    outputParams_.push_back(outputLayerParams(jobj, multiFormat));
  }
  
  swapBufSize_ = getValue("swapBufSize", jobj);
  if(swapBufSize_==0)
    swapBufSize_=1;

  if(isDebugMode)
  {
    single_pool_debug_ = getBool("singlePoolDebug", jobj);
    debug_dumpdir_ = runner_dir_+"debugDumpDir/";
    debug_din_filename_ = runner_dir_+getFileNameIfExists("debugDInFile", jobj);
    debug_golden_filename_ = runner_dir_+getFileNameIfExists("debugGoldenFile", jobj);
  }

}

void Xmodel::loadParamsXIR(std::string xmodel_filename, bool isDebugMode)
{
  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodel_filename);

  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  loadParamsSubgraph(subgraph, isDebugMode);  
}

void Xmodel::loadParamsSubgraph(const xir::Subgraph *subgraph, bool isDebugMode)
{

  std::vector<std::string> machineCode = subgraph->get_attr<std::vector<std::string>>("mc_code");
  std::ofstream oFile;
  oFile.open(instr_filename_);
  for(uint32_t i=0; i<machineCode.size(); i++)
  {
    oFile<<machineCode[i]<<"\n";
  }
  oFile.close();
  std::vector<std::string> paramsMachineFormat = subgraph->get_attr<std::vector<std::string>>("params");
  std::ofstream oFile1;
  oFile1.open(params_filename_);
  for(uint32_t i=0; i<paramsMachineFormat.size(); i++)
  {
    oFile1<<paramsMachineFormat[i]<<"\n";
  }
  oFile1.close();
  
  bool multiFormat = true;
  
  auto attrs = subgraph->get_attrs();
  auto keys = attrs->get_keys();
  for (auto& key : keys) {
    std::string keyString(key);
    if(keyString.compare("inW")==0)
    {
      multiFormat = false;
      break;
    }
  }
  
  if(multiFormat)
  {
    std::string tensorInfo = subgraph->get_attr<std::string>("tensor_info");
    char * c = tensorInfo.c_str();
    json_object* jobj = json_tokener_parse(c);
    json_object_object_foreach(jobj, key, val)
    {
      std::string keyString(key);
      if(keyString.compare("inputs") == 0)
      {
        json_object_object_foreach(val, inputkey, inputval)
        {
          assert(inputkey);
          inputParams_.push_back(inputLayerParams(inputval, isDebugMode, multiFormat));
        }
      }
      if(keyString.compare("outputs") == 0)
      {
        json_object_object_foreach(val, outputkey, outputval)
        {
          assert(outputkey);
          outputParams_.push_back(outputLayerParams(outputval, multiFormat)); 
        }
      }
    }
  }
  else
  {
    inputParams_.push_back(inputLayerParams(subgraph, isDebugMode, multiFormat));
    outputParams_.push_back(outputLayerParams(subgraph, multiFormat));
  }

  swapBufSize_ = subgraph->get_attr<int>("swapBufSize");
  if(swapBufSize_==0)
    swapBufSize_=1;

  if(isDebugMode)
  {
    single_pool_debug_ = false;
    debug_dumpdir_ = runner_dir_+"debugDumpDir/";
    debug_din_filename_ = runner_dir_+subgraph->get_attr<std::string>("debugDInFile");
    debug_golden_filename_ = runner_dir_+subgraph->get_attr<std::string>("debugGoldenFile");
  }

}

Xmodel::Xmodel(std::string meta, bool isDebugMode)
{
  runner_dir_ = meta.substr(0, meta.size()-9);
  std::ifstream f(meta);
  std::stringstream metabuf;
  metabuf << f.rdbuf();
  json_object *jobj = json_tokener_parse(metabuf.str().c_str());     

  enable_xmodel_format_ = getBool("usexmodel", jobj);
  
  instr_asm_filename_ = runner_dir_+"instr.asm";
  instr_filename_ = runner_dir_+"instr.txt";
  params_filename_ = runner_dir_+"params.txt";
  if(enable_xmodel_format_)
  {
    std::string xmodel_filename = runner_dir_+getFileNameIfExists("xmodelFile", jobj);
    loadParamsXIR(xmodel_filename, isDebugMode);
  }
  else
    loadParamsJson(jobj, isDebugMode);


}

Xmodel::Xmodel(const xir::Subgraph *subgraph, bool isDebugMode)
{
  runner_dir_ = subgraph->get_attr<std::string>("runner_dir");
  instr_asm_filename_ = runner_dir_+"instr.asm";
  instr_filename_ = runner_dir_+"instr.txt";
  params_filename_ = runner_dir_+"params.txt";
  loadParamsSubgraph(subgraph, isDebugMode);

}


