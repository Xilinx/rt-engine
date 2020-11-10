// Vitis API execute_async example
#include <algorithm>
#include <chrono>
#include <iostream>
#include "cxxopts.hpp"
#include "tests.hpp"

int main(int argc, char** argv) {
  cxxopts::Options options("AppTests", "Vitis application-level tests");
  options.add_options()
    ("r,runnermeta", "Path to DpuRunner meta.json", cxxopts::value<std::string>())
    ("t,tests", "Tests to run", cxxopts::value<std::vector<std::string>>()->default_value("st,mtsr,mtmr"))
    ("d,imgdir", "Image Directory", cxxopts::value<std::string>()->default_value("tests/dpuv3int8/models/commonImgLabelDir/imageDir"))
    ("n,numImgs", "Number of Images", cxxopts::value<int>()->default_value("4"))
    ("s,batchSz", "Batch Size", cxxopts::value<int>()->default_value("4"))
    ("g,golden", "Prints top-1 and top-5 results, given golden labels file", cxxopts::value<bool>()->default_value("false"))
    ("v,verbose", "cout each image details", cxxopts::value<bool>()->default_value("false"))
    ("p,noPrintMetrics", "don't print metrics", cxxopts::value<bool>()->default_value("false"))
    ("h,singlequery", "execute single query on fpga", cxxopts::value<bool>()->default_value("false"))
    ("c,numCUs", "Number of CUs To Utilize", cxxopts::value<int>()->default_value("1"))
    ("e,numThreads", "Number of Threads for multi thread test", cxxopts::value<int>()->default_value("-1"))
    ;
  auto result = options.parse(argc, argv);
  if (!result.count("runnermeta"))
    throw std::runtime_error("Usage: app.exe -r path_to_runner_meta.json");

  const std::vector<std::string> tests = result["tests"].as<std::vector<std::string>>();
  const auto runnerMeta = result["runnermeta"].as<std::string>();
  const std::string imgDir = result["imgdir"].as<std::string>();
  const int numImgs = result["numImgs"].as<int>();
  const int batchSz = result["batchSz"].as<int>();
  const bool golden = result["golden"].as<bool>();
  const bool verbose = result["verbose"].as<bool>();
  const bool noPrintMetrics = result["noPrintMetrics"].as<bool>();
  const bool singleQuery = result["singlequery"].as<bool>();
  const int numCUs = result["numCUs"].as<int>();
  const int numThreadsMt = result["numThreads"].as<int>();

  if(singleQuery)
  {
    FpgaOnlySingleQueryExecution fpgaOnlySingleQueryExecution(runnerMeta);
    fpgaOnlySingleQueryExecution.run();
    return 0;
  }


  if (std::find(tests.begin(), tests.end(), "st") != tests.end())
  {
    const unsigned numQueries = 10000;
    std::cout << std::endl << "Testing single thread..." << std::endl;
    SingleThreadTest singleThreadTest(runnerMeta, numQueries);
    auto t1 = std::chrono::high_resolution_clock::now();
    singleThreadTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  if (std::find(tests.begin(), tests.end(), "mtsr") != tests.end())
  {
    const unsigned numQueries = 10000;
    const unsigned numThreads = 100;
    std::cout << std::endl << "Testing multi thread (single runner)..." << std::endl;
    MultiThreadTest multiThreadTest(runnerMeta, numQueries, numThreads, /*numRunners*/1);
    auto t1 = std::chrono::high_resolution_clock::now();
    multiThreadTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;

  }

  if (std::find(tests.begin(), tests.end(), "mtmr") != tests.end())
  {
    const unsigned numQueries = 10000;
    const unsigned numThreads = 100; 
    const unsigned numRunners = 2; 
    std::cout << std::endl << "Testing multi thread (multi runner)..." << std::endl;
    MultiThreadTest multiThreadTest(runnerMeta, numQueries, numThreads, numRunners);
    auto t1 = std::chrono::high_resolution_clock::now();
    multiThreadTest.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    std::cout << "Elapsed: " << elapsed.count() << std::endl;
    std::cout << "QPS: " << numQueries/elapsed.count() << std::endl;
  }

  if (std::find(tests.begin(), tests.end(), "tc") != tests.end())
  {
    assert((numImgs%batchSz)==0);
    const unsigned numQueries = numImgs/batchSz;
    std::cout << std::endl << "Test Classify..." << std::endl;
    auto t3 = std::chrono::high_resolution_clock::now();
    TestClassify testClassify(runnerMeta, numQueries, imgDir, golden, verbose);
    auto t4 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed0 = t4-t3;
  
    if(not noPrintMetrics)
    {
      std::cout<<"(Load Images + Resize + Flatten) for "<<numQueries*4<<" Images, Time (ms): "<<elapsed0.count()*1000<<std::endl;
      std::cout<<"********************************"<<std::endl;
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    testClassify.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;
    
    if(not noPrintMetrics)
    {
      std::cout<<"-----------------------------------------------"<<std::endl;
      std::cout<<"Summary of Single Thread Execution: "<<std::endl;
      std::cout<<"Num CUs used: 1"<<std::endl;
      std::cout<<"Postprocess includes output reorganization, softmax"<<std::endl;  
      std::cout << "(Preprocess + Kernel + Postprocess) Execution time for "<<numQueries*4<<" images (ms): "<<elapsed.count()*1000 << std::endl;
      std::cout << "Average (Preprocess + Kernel + Postprocess) Execution time for 4 or 1 img (ms): "<<(elapsed.count()*1000)/(numQueries) << std::endl;
  
      std::cout << "Average (Preprocess + Kernel + Postprocess) imgs per second: " << (numQueries*4)/elapsed.count() << std::endl;
      std::cout<<"-----------------------------------------------"<<std::endl;
    }
  }

  if (std::find(tests.begin(), tests.end(), "tcmt") != tests.end())
  {
    assert((numImgs%batchSz)==0);
    const unsigned numQueries = numImgs/batchSz;//4;//10000;
    
    unsigned numThreads = 0;

    if(numQueries < 20)
    {
      numThreads = numQueries;
    }
    else
    {
      for(int i=20; i>0; i--)
      {
        if(numQueries%i==0)
        {
          numThreads = i;
          break;
        }
      }
    }
    if(numThreadsMt!=-1)
      numThreads = numThreadsMt;
    if(numQueries%numThreads!=0)
     throw std::runtime_error("Error: non-integer division of queries and threads, not supported at the moment");
    std::cout << std::endl << "Test Classify Multi Thread..." << std::endl;
    auto t3 = std::chrono::high_resolution_clock::now();
    TestClassifyMultiThread testClassifyMultiThread(runnerMeta, numQueries, numThreads, numCUs, imgDir, golden, verbose);
    auto t4 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed0 = t4-t3;

    std::cout<<"(Load Images + Resize + Flatten) for "<<numQueries*4<<" Images, Time (ms): "<<elapsed0.count()*1000<<std::endl;
    std::cout<<"********************************"<<std::endl;

    auto t1 = std::chrono::high_resolution_clock::now();
    testClassifyMultiThread.run();
    auto t2 = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = t2-t1;

    std::cout<<"-----------------------------------------------"<<std::endl;
    std::cout<<"Summary of Multi Thread Execution: "<<std::endl;
    std::cout<<"Num CUs used: "<<numCUs<<std::endl;
    std::cout<<"Postprocess includes output reorganization, softmax"<<std::endl;  
    std::cout << "(Preprocess + Kernel + Postprocess) Execution time for "<<numQueries*4<<" images (ms): "<<elapsed.count()*1000 << std::endl;
    std::cout << "Average (Preprocess + Kernel + Postprocess) Execution time for 4 or 1 img (ms): "<<(elapsed.count()*1000)/(numQueries) << std::endl;

    std::cout << "Average (Preprocess + Kernel + Postprocess) imgs per second: " << (numQueries*4)/elapsed.count() << std::endl;
    std::cout<<"-----------------------------------------------"<<std::endl;

  }


  return 0;
}
