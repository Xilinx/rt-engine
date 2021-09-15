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
#include <sstream>
#include <memory>
#include "dpu_runner.hpp"
#include <opencv2/opencv.hpp>
#include "json-c/json.h"
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>
#include "XirKeys.hpp"

/* This class is meant to provide preprocessing and postprocessing utilities to Inference class */
class cpuUtil {
public:
  cpuUtil(std::string xmodel, std::string image_dir, unsigned num_queries, bool verbose, std::string synset_filename = std::string(), std::string golden_filename = std::string(), std::string accuracyCheckTop1Top5Nums="0 0", std::string performanceCheck="0");

  void fillInData(int idx, std::vector<vart::TensorBuffer*> inputs);

  void postProcess(std::vector<vart::TensorBuffer*> outputs, int idx);

  int printtop1top5(unsigned num_queries, double totalTimeSec);

private:

  std::vector<std::pair<float, int>> sortArr(std::vector<float> arr, int n);

  void load_golden();

  void load_synset();
  void parseTop1Top5Expected(std::string accuracyCheckTop1Top5Nums);
  void parsePerformanceExpected(std::string performanceExpected);

  void printPredictionLabels(std::vector<std::vector<std::pair<float, int>>> indices, int queryNum);

  std::vector<float> computeSoftmax(std::vector<int8_t> input);

  void loadImages(std::string image_dir, unsigned num_queries);

  void
  resizeImgs(std::vector<cv::Mat>& input_images, std::vector<cv::Mat>& resize_images, void* din_data, int image_width,
             int image_height, int batch_size);

  void flattenData(std::vector<uint8_t>& flattenedData, int batch_size, int image_width, int image_height,
                   std::vector<cv::Mat>& resize_images);

  int top1Count_;
  int top5Count_;
  int top1Expected_;
  int top5Expected_;
  int performanceExpected_;

  std::vector<std::pair<std::string, int>> goldenLabels_;
  std::vector<std::string> synsetLabels_;
  std::vector<std::string> imgFileNames_;
  std::vector<std::string> fileNames_;
  std::vector<std::vector<uint8_t>> flattenedImgData_;
  bool goldenAvailable_;
  bool synsetAvailable_;
  std::unique_ptr<XirKeys> keysobj_;
  bool verbose_;
  std::string synset_filename_;
  std::string golden_filename_;
};
