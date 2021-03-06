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

#pragma once 
#include <string>
#include <memory>
#include "dpu_runner.hpp"
#include <opencv2/opencv.hpp>
#include "json-c/json.h"
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>

class Test {
  virtual void run() = 0;
};

class SingleThreadTest : public Test {
  public:
    SingleThreadTest(std::string runner_dir, unsigned num_queries);
    virtual void run();

  private:
    unsigned num_queries_;
    std::unique_ptr<vart::DpuRunner> runner_;
};

class MultiThreadTest : public Test {
  public:
    MultiThreadTest(std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners);
    virtual void run();

  private:
    void init_thread(unsigned ridx);
    void run_thread(unsigned ridx, unsigned n);

    unsigned num_queries_;
    unsigned num_threads_;
    unsigned num_runners_;
    std::string runner_dir_;
    std::vector<std::unique_ptr<vart::DpuRunner>> runners_;
};

class jsonOrXirKeys
{
  public:
    uint32_t getOutW();
    uint32_t getOutH();
    uint32_t getOutCh();
    bool getDebugMode();
    std::string getGoldenFilename();
    std::string getSynsetFilename();
    uint32_t getInW();
    uint32_t getInH();
    uint32_t getInCh();

    jsonOrXirKeys(std::string runner_dir);
  
  private:
    void loadFromJson(json_object* jobj);
    void loadFromXmodel(std::string xmodelFname);
    std::string getFileNameIfExists(std::string name, json_object* jobj);
    uint32_t getValue(std::string name, json_object* jobj);
    bool getBool(std::string name, json_object* jobj);
    bool debugMode_;
    std::string golden_filename_;
    std::string synset_filename_;
    uint32_t inW_;
    uint32_t inH_;
    uint32_t inCh_;
    uint32_t outW_;
    uint32_t outH_;
    uint32_t outCh_;
    bool enable_xmodel_format_;
    std::string runner_dir_;
};

class cpuUtil
{
  public:
    cpuUtil(std::string runner_dir, bool goldenAvailable, bool verbose, std::string img_dir, unsigned num_queries);
    bool getDebugMode();
    void fillInData(int idx, std::vector<vart::TensorBuffer*> inputs);
    void postProcess(std::vector<vart::TensorBuffer*> outputs, int idx);
    void printtop1top5(unsigned num_queries);

  private:
    void writeToBinaryFile();
    std::vector<std::pair<float,int>> sortArr(std::vector<float> arr, int n); 
    void load_golden();
    void load_synset();
    void printPredictionLabels(std::vector<std::vector<std::pair<float,int>>> indices, int queryNum);
    std::vector<float> computeSoftmax(std::vector<int8_t> input);
    void loadImages(std::string img_dir, unsigned num_queries);
    void resizeImgs(std::vector<cv::Mat> &input_images, std::vector<cv::Mat> &resize_images, void *din_data, int image_width, int image_height, int batch_size);
    void flattenData(std::vector<uint8_t> &flattenedData, int batch_size, int image_width, int image_height, std::vector<cv::Mat> &resize_images);

    int top1Count_;
    int top5Count_;
    std::vector<std::pair<std::string,int>> goldenLabels_;
    std::vector<std::string> synsetLabels_;
    std::vector<std::string> imgFileNames_;
    std::vector<std::string> fileNames_;
    std::vector<std::vector<uint8_t>> flattenedImgData_;
    bool goldenAvailable_;
    bool verbose_;
    std::unique_ptr<jsonOrXirKeys> keysobj_;
};

class TestClassify : public Test {
  public:
    TestClassify(std::string runner_dir, unsigned num_queries, std::string img_dir, const bool goldenAvailable, const bool verbose);
    virtual void run();

  private:
    unsigned num_queries_;
    std::unique_ptr<vart::DpuRunner> runner_;
    std::unique_ptr<cpuUtil> cpuUtilobj_;
     
};

class TestClassifyMultiThread : public Test {
  public:
    TestClassifyMultiThread(std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners, std::string img_dir, const bool goldenAvailable, const bool verbose);
    virtual void run();

  private:
    void init_thread(unsigned ridx);
    void run_thread(unsigned tidx, unsigned ridx, unsigned n);

    unsigned num_queries_;
    unsigned num_threads_;
    unsigned num_runners_;
    std::string runner_dir_;
    std::vector<std::unique_ptr<vart::DpuRunner>> runners_;
    std::unique_ptr<cpuUtil> cpuUtilobj_;
};

class FpgaOnlySingleQueryExecution : public Test {
  public:
    FpgaOnlySingleQueryExecution(std::string runner_dir);
    virtual void run();

  private:
    std::unique_ptr<vart::DpuRunner> runner_;
     
};

