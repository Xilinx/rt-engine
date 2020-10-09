#include "dpuv3int8_controller.hpp"

uint32_t Xmodel::getInW(){return inW_;}
uint32_t Xmodel::getInH(){return inH_;}
uint32_t Xmodel::getInCh(){return inCh_;}
uint32_t Xmodel::getOutSize(){return outSize_;}
uint32_t Xmodel::getInKernelW(){return inKernelW_;}
uint32_t Xmodel::getPadLft(){return padLft_;}
uint32_t Xmodel::getPadRgt(){return padRgt_;}
uint32_t Xmodel::getInStrdW(){return inStrdW_;}
uint32_t Xmodel::getSwapBufSize(){return swapBufSize_;}
uint32_t Xmodel::getDruSrcBufSize(){return druSrcBufSize_;}
uint32_t Xmodel::getDruDstBufSize(){return druDstBufSize_;}
uint32_t Xmodel::getInDdrSize(){return inDdrSize_;}
bool Xmodel::getDruMode(){return dru_mode_;}
bool Xmodel::getChannelAugmentationMode(){return channel_augmentationmode_;}
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

  inW_ = getValue("inW", jobj);
  inH_ = getValue("inH", jobj);
  inCh_ = getValue("inCh", jobj);
  outSize_ = getValue("outSize", jobj);
  inDdrSize_ = getValue("inDDRSize", jobj);
  padRgt_ = getValue("padRt", jobj);

  dru_mode_ = getBool("druMode", jobj);
  
  channel_augmentationmode_ = getBool("channelAugmentationMode", jobj);
 
  inKernelW_ = getValue("inKernelW", jobj);
  padLft_ = getValue("padLft", jobj);
  inStrdW_ = getValue("inStrdW", jobj);
  
  swapBufSize_ = getValue("swapBufSize", jobj);
  druSrcBufSize_ = getValue("druSrcBufSize", jobj);
  druDstBufSize_ = getValue("druDstBufSize", jobj);

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
  for(int i=0; i<machineCode.size(); i++)
  {
    oFile<<machineCode[i]<<"\n";
  }
  oFile.close();
  std::vector<std::string> paramsMachineFormat = subgraph->get_attr<std::vector<std::string>>("params");
  std::ofstream oFile1;
  oFile1.open(params_filename_);
  for(int i=0; i<paramsMachineFormat.size(); i++)
  {
    oFile1<<paramsMachineFormat[i]<<"\n";
  }
  oFile1.close();

  inW_ = subgraph->get_attr<int>("inW");
  inH_ = subgraph->get_attr<int>("inH");
  inCh_ = subgraph->get_attr<int>("inCh");
  outSize_ = subgraph->get_attr<int>("outSize");
  inDdrSize_ = subgraph->get_attr<int>("inDDRSize");
  padRgt_ = subgraph->get_attr<int>("padRt");

  dru_mode_ = subgraph->get_attr<int>("druMode");
  
  channel_augmentationmode_ = subgraph->get_attr<int>("channelAugmentationMode");
 
  inKernelW_ = subgraph->get_attr<int>("inKernelW");
  padLft_ = subgraph->get_attr<int>("padLft");
  inStrdW_ = subgraph->get_attr<int>("inStrdW");
  
  swapBufSize_ = subgraph->get_attr<int>("swapBufSize");
  druSrcBufSize_ = subgraph->get_attr<int>("druSrcBufSize");
  druDstBufSize_ = subgraph->get_attr<int>("druDstBufSize");

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
  runner_dir_ = "tests/dpuv3int8/models/dpuv3int8_xir/";//subgraph->get_attr<std::string>("runner_dir");
  std::cout<<"Runner dir is hardcoded right now, xir subgraph has ot be annotated with runner dir"<<std::endl;
  instr_asm_filename_ = runner_dir_+"instr.asm";
  instr_filename_ = runner_dir_+"instr.txt";
  params_filename_ = runner_dir_+"params.txt";
  loadParamsSubgraph(subgraph, isDebugMode);

}

