// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
      if(name=="usexmodel" && name=="singlePoolDebug")
        return false;
    }
  return json_object_get_boolean(obj);

}

inputLayerParams::inputLayerParams(json_object* jobj, bool isDebugMode, bool multiFormat)
{
  
  int batchSizeXmodelCompiledWith = 4;
  
  if(multiFormat)
  {
    json_object* obj = NULL;
    json_object_object_get_ex(jobj, "shape", &obj);
    json_object* shapeVal;
    shapeVal = json_object_array_get_idx(obj, 0);
    batchSizeXmodelCompiledWith = json_object_get_int(shapeVal);
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
  
  if(batchSizeXmodelCompiledWith==4)
  {
    inDdrSize_ = getValue("inDDRSize", jobj);
  }
  else if(batchSizeXmodelCompiledWith<4 && batchSizeXmodelCompiledWith>0)
  {
     std::cout<<"Xmodel compiled with batchSize: "<<batchSizeXmodelCompiledWith<<std::endl;
     
     inDdrSize_ = getValue("inDDRSize", jobj);
     if(batchSizeXmodelCompiledWith==1)
       inDdrSize_ = inDdrSize_*4;
     else if(batchSizeXmodelCompiledWith==2)
       inDdrSize_ = inDdrSize_*2;
     else if(batchSizeXmodelCompiledWith==3)
       inDdrSize_ = (inDdrSize_/3)*4;
  }
  else
  {
     std::cout<<"Xmodel compiled with batchSize: "<<batchSizeXmodelCompiledWith<<std::endl;
     throw std::runtime_error("Error: batchSizes other than 1,2,3,4 are not supported for this IP, please cosnider re-compiling the xmodel with one of these batch sizes - either 1 or 2 or 3 or 4");
  }
  padRgt_ = getValue("padRt", jobj);

  dru_mode_ = isDebugMode ? false:getBool("druMode", jobj);
  
  channel_augmentationmode_ = getBool("channelAugmentationMode", jobj);
 
  inKernelW_ = getValue("inKernelW", jobj);
  padLft_ = getValue("padLft", jobj);
  inStrdW_ = getValue("inStrdW", jobj);
  druSrcBufSize_ = getValue("druSrcBufSize", jobj);
  druDstBufSize_ = getValue("druDstBufSize", jobj);
  inName_ = getFileNameIfExists("name", jobj); 
}

outputLayerParams::outputLayerParams(json_object* jobj, bool isDebugMode, bool multiFormat)
{
  if(multiFormat)
  {
    //json_object* obj = json_object_object_get_ex(jobj, "shape",obj);
    json_object  *obj = NULL;
    json_object_object_get_ex(jobj, "shape",&obj);
    json_object* shapeVal;
    shapeVal = json_object_array_get_idx(obj, 1);
    outH_ = json_object_get_int(shapeVal);
    shapeVal = json_object_array_get_idx(obj, 2);
    outW_ = json_object_get_int(shapeVal);
    shapeVal = json_object_array_get_idx(obj, 3);
    outCh_ = json_object_get_int(shapeVal);
    
    outAddress_ = getValue("address", jobj);
    outDdrSize_ = getValue("outDDRSize", jobj);
    debug_golden_filename_ = isDebugMode ? getFileNameIfExists("debugGoldenFile", jobj):"";
    outName_ = getFileNameIfExists("name", jobj);
  }
  else
  {
    outH_ = getValue("outH", jobj);
    outW_ = getValue("outW", jobj);
    outCh_ = getValue("outCh", jobj);
    outAddress_ = 0;
    outDdrSize_ = getValue("outDDRSize", jobj);
    debug_golden_filename_ = "";
    outName_ = "output";
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

outputLayerParams::outputLayerParams(const xir::Subgraph *subgraph, bool isDebugMode, bool multiFormat)
{
  outH_ = subgraph->get_attr<int>("outH");
  outW_ = subgraph->get_attr<int>("outW");
  outCh_ = subgraph->get_attr<int>("outCh");
  outAddress_ = 0;
  outDdrSize_ = subgraph->get_attr<int>("outSize");
  debug_golden_filename_ = "";
}

std::vector<std::string> Xmodel::getInTensorsNames()
{
   std::vector<std::string> inTensorsNames;
   for(uint32_t i=0; i<inputParams_.size(); i++)
   {
     inTensorsNames.push_back(inputParams_[i].inName_);
   }
   return inTensorsNames;
}


std::vector<std::string> Xmodel::getOutTensorsNames()
{
   std::vector<std::string> outTensorsNames;
   for(uint32_t i=0; i<outputParams_.size(); i++)
   {
     outTensorsNames.push_back(outputParams_[i].outName_);
   }
   return outTensorsNames;
}

std::vector<std::vector<std::int32_t>> Xmodel::getOutTensorsDims()
{
   std::vector<std::vector<std::int32_t>> outTensorsDims;
   for(uint32_t i=0; i<outputParams_.size(); i++)
   {
      std::vector<std::int32_t> outdims(5,0);
      outdims[0] = outputParams_[i].outW_;
      outdims[1] = outputParams_[i].outH_;
      outdims[2] = outputParams_[i].outCh_;
      outdims[3] = outputParams_[i].outAddress_;
      outdims[4] = outputParams_[i].outDdrSize_;
      outTensorsDims.push_back(outdims);
   }
   return outTensorsDims;
}

std::string Xmodel::getDebugGoldenFilename(int outputNum)
{
  if(outputNum==0 && outputParams_[outputNum].debug_golden_filename_=="")
    return debug_golden_filename_;
  return runner_dir_+outputParams_[outputNum].debug_golden_filename_;
}
uint32_t Xmodel::getOutputNum(){return outputParams_.size();}
uint32_t Xmodel::getInW(){return inputParams_[0].inW_;}
uint32_t Xmodel::getInH(){return inputParams_[0].inH_;}
uint32_t Xmodel::getInCh(){return inputParams_[0].inCh_;}
uint32_t Xmodel::getOutDdrSize()
{
   return (outputParams_[outputParams_.size()-1].outAddress_+(4*outputParams_[outputParams_.size()-1].outDdrSize_))/4;

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

std::vector<std::int32_t> Xmodel::get_input_fix_point_values(){return input_fix_point_values_;}
std::vector<std::int32_t> Xmodel::get_output_fix_point_values(){return output_fix_point_values_;}

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
      if(name=="usexmodel" && name=="singlePoolDebug")
        return false;
    }
  return json_object_get_boolean(obj);

}

void Xmodel::loadParamsJson(json_object* jobj, bool isDebugMode)
{
  instrFormatConverter_.reset(new InstrFormatConverter());
  
  bool multiFormat = false;
  json_object_object_foreach(jobj, key, val) 
  {
    std::string keyString(key);
    if(keyString.compare("inputs") == 0)
    {
      if (val)
      multiFormat = true;
      else throw std::runtime_error("Error: Parsing JSON object");
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
          if(inputkey)
          inputParams_.push_back(inputLayerParams(inputval, isDebugMode, multiFormat));
          else throw std::runtime_error("Error: Parsing json object");
	}
      }
      if(keyString.compare("outputs") == 0)
      {
        json_object_object_foreach(val, outputkey, outputval)
        {
          if(outputkey)
          outputParams_.push_back(outputLayerParams(outputval, isDebugMode, multiFormat)); 
          else throw std::runtime_error("Error: Parsing json object");
        }
      }
    }
  }
  else
  {
    inputParams_.push_back(inputLayerParams(jobj, isDebugMode, multiFormat));
    outputParams_.push_back(outputLayerParams(jobj, isDebugMode, multiFormat));
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
 
  // Get instructions and parmaeters from xmodel
  instr_ = subgraph->get_attr<std::vector<std::string>>("mc_code");
  params_ = subgraph->get_attr<std::vector<std::string>>("params");

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
    const char * c = tensorInfo.c_str();
    json_object* jobj = json_tokener_parse(c);
    json_object_object_foreach(jobj, key, val)
    {
      std::string keyString(key);
      if(keyString.compare("inputs") == 0)
      {
        json_object_object_foreach(val, inputkey, inputval)
        {
          if(inputkey)
          inputParams_.push_back(inputLayerParams(inputval, isDebugMode, multiFormat));
          else throw std::runtime_error("Error: Parsing json object");
        }
      }
      if(keyString.compare("outputs") == 0)
      {
        json_object_object_foreach(val, outputkey, outputval)
        {
          if(outputkey)
          outputParams_.push_back(outputLayerParams(outputval, isDebugMode, multiFormat)); 
          else throw std::runtime_error("Error: Parsing json object");
        }
      }
    }
  }
  else
  {
    inputParams_.push_back(inputLayerParams(subgraph, isDebugMode, multiFormat));
    outputParams_.push_back(outputLayerParams(subgraph, isDebugMode, multiFormat));
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
  input_fix_point_values_.push_back(0);
  output_fix_point_values_.push_back(0);

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

bool Xmodel::get_zero_copy()
{
   return zero_copy_;
}

Xmodel::Xmodel(const xir::Subgraph *subgraph, xir::Attrs* attrs, bool isDebugMode)
{

  if(attrs==nullptr)
  {
    zero_copy_ = false;
  }
  else
  {
    if(attrs->has_attr("zero_copy"))
    {
      zero_copy_ = attrs->get_attr<bool>("zero_copy");
    }
    else
    {
      zero_copy_ = false;
    } 
  }
  
  runner_dir_ = subgraph->get_attr<std::string>("runner_dir");
  instr_asm_filename_ = runner_dir_+"instr.asm";
  instr_filename_ = runner_dir_+"instr.txt";
  params_filename_ = runner_dir_+"params.txt";
  loadParamsSubgraph(subgraph, isDebugMode);
  
  auto input_tensors = subgraph->get_input_tensors();
  auto output_tensors = subgraph->get_output_tensors();
  for (auto &in_tensor : input_tensors)
  {
    input_scales_.push_back(pow(2,in_tensor->get_attr<std::int32_t>("fix_point")));
    input_fix_point_values_.push_back(in_tensor->get_attr<std::int32_t>("fix_point"));

  }
  
  output_fix_point_values_.clear();
  output_fix_point_values_.resize(getOutputNum());
  output_scales_.clear();
  output_scales_.resize(getOutputNum());

  for(auto &out_tensor : output_tensors)
  {
    std::string outName = out_tensor->get_name();
    for(uint32_t i=0; i<getOutputNum(); i++)
    {
       if(outName==getOutTensorsNames()[i])
       {  
           output_scales_[i]=pow(2,(-1)*out_tensor->get_attr<std::int32_t>("fix_point"));
          output_fix_point_values_[i] = out_tensor->get_attr<std::int32_t>("fix_point");

       }
    }

  }
}

const std::vector<std::string>& Xmodel::getInstr()
{
  return instr_;
}

const std::vector<std::string>& Xmodel::getParams()
{
  return params_;
}

