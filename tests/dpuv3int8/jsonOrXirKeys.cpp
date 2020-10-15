#include <xir/graph/graph.hpp>
#include <xir/graph/subgraph.hpp>
#include <xir/util/tool_function.hpp>
#include "tests.hpp"

jsonOrXirKeys::jsonOrXirKeys(std::string runner_dir)
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

int jsonOrXirKeys::getOutSize(){return outSize_;}
bool jsonOrXirKeys::getDebugMode(){return debugMode_;}
std::string jsonOrXirKeys::getGoldenFilename(){return golden_filename_;}
std::string jsonOrXirKeys::getSynsetFilename(){return synset_filename_;}
uint32_t jsonOrXirKeys::getInW(){return inW_;}
uint32_t jsonOrXirKeys::getInH(){return inH_;}
uint32_t jsonOrXirKeys::getInCh(){return inCh_;}

void jsonOrXirKeys::loadFromJson(json_object* jobj)
{
  outSize_ = getValue("outSize", jobj);
  debugMode_ = getBool("debugMode", jobj);
  golden_filename_ = runner_dir_+"gold.txt";//getFileNameIfExists("goldenFile", jobj);
  synset_filename_ = runner_dir_+"synset_words.txt";//getFileNameIfExists("synsetFile", jobj);
  inW_ = getValue("inW", jobj);
  inH_ = getValue("inH", jobj);
  inCh_ = getValue("inCh", jobj);

}

void jsonOrXirKeys::loadFromXmodel(std::string xmodelFname)
{

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(xmodelFname);

  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
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


