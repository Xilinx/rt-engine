#include <xir/graph/graph.hpp>
#include <xir/graph/subgraph.hpp>
#include <xir/util/tool_function.hpp>
#include "cpuutil.hpp"

jsonOrXirKeys::jsonOrXirKeys(std::string runner_dir)
{
  if(runner_dir.find(".json") != std::string::npos)
  { 
    runner_dir_ = runner_dir.substr(0, runner_dir.size()-9);
    std::ifstream f(runner_dir);
    std::stringstream metabuf;
    metabuf << f.rdbuf();
    json_object *jobj = json_tokener_parse(metabuf.str().c_str());     
    enable_xmodel_format_ = getBool("usexmodel", jobj);
    if(enable_xmodel_format_)
    {
      std::string xmodel_filename = runner_dir_+getFileNameIfExists("xmodelFile",jobj);
      loadFromXmodel(xmodel_filename);
    }
  else
    loadFromJson(jobj);
  }
  else
  {
    loadFromXmodel(runner_dir);
  }
}

int jsonOrXirKeys::getOutSize(){return outSize_;}
bool jsonOrXirKeys::getDebugMode(){return debugMode_;}
std::string jsonOrXirKeys::getGoldenFilename(){return golden_filename_;}
std::string jsonOrXirKeys::getSynsetFilename(){return synset_filename_;}
uint32_t jsonOrXirKeys::getInW(){return inW_;}
uint32_t jsonOrXirKeys::getInH(){return inH_;}
uint32_t jsonOrXirKeys::getInCh(){return inCh_;}

void jsonOrXirKeys::loadFromJson(json_object* jobj)
{
  debugMode_ = getBool("debugMode", jobj);
  golden_filename_ = runner_dir_+"gold.txt";
  synset_filename_ = runner_dir_+"synset_words.txt";

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

  if(not multiFormat)
    outSize_ = getValue("outSize", jobj);
  
  if(not multiFormat)
  {
    inW_ = getValue("inW", jobj);
    inH_ = getValue("inH", jobj);
    inCh_ = getValue("inCh", jobj);
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
          json_object* obj = json_object_object_get(inputval, "shape");
          json_object* shapeVal;
          shapeVal = json_object_array_get_idx(obj, 1);
          inH_ = json_object_get_int(shapeVal);
          shapeVal = json_object_array_get_idx(obj, 2);
          inW_ = json_object_get_int(shapeVal);
          shapeVal = json_object_array_get_idx(obj, 3);
          inCh_ = json_object_get_int(shapeVal);
        }
      }
      if(keyString.compare("outputs") == 0)
      {
        json_object_object_foreach(val, outputkey, outputval)
        {
          assert(outputkey);
          outSize_ = getValue("outDDRSize", outputval);
        }
      }
    }
  }

}

void jsonOrXirKeys::loadFromXmodel(std::string xmodelFname)
{

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodelFname);

  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  runner_dir_ = subgraph->get_attr<std::string>("runner_dir");
  outSize_ = subgraph->get_attr<int>("outSize");
  debugMode_ = false;//subgraph->get_attr<int>("debugMode");
  golden_filename_ = runner_dir_+"gold.txt";//subgraph->get_attr<std::string>("goldenFile");
  synset_filename_ = runner_dir_+"synset_words.txt";//subgraph->get_attr<std::string>("synsetFile");
  inW_ = subgraph->get_attr<int>("inW");
  inH_ = subgraph->get_attr<int>("inH");
  inCh_ = subgraph->get_attr<int>("inCh");

}

std::string jsonOrXirKeys::getFileNameIfExists(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    throw std::runtime_error("Error: missing "+name+" field in meta.json");
  return json_object_get_string(obj);

}

uint32_t jsonOrXirKeys::getValue(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
    throw std::runtime_error("Error: missing "+name+" field in meta.json");
  return json_object_get_int(obj);

}

bool jsonOrXirKeys::getBool(std::string name, json_object* jobj)
{
  json_object *obj = NULL;
  if (!json_object_object_get_ex(jobj, name.c_str(), &obj))
  {  
    if(name=="usexmodel")
      return false;
    else
      throw std::runtime_error("Error: missing "+name+" field in meta.json");
  }
  return json_object_get_boolean(obj);

}


