#pragma once

#include <string>
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
  cpuUtil(std::string xmodel, std::string image_dir, unsigned num_queries, bool verbose, std::string synset_filename = std::string(), std::string golden_filename = std::string());

  void fillInData(int idx, std::vector<vart::TensorBuffer*> inputs);

  void postProcess(std::vector<vart::TensorBuffer*> outputs, int idx);

  void printtop1top5(unsigned num_queries);

private:

  std::vector<pair<float, int>> sortArr(std::vector<float> arr, int n);

  void load_golden();

  void load_synset();

  void printPredictionLabels(std::vector<std::vector<pair<float, int>>> indices, int queryNum);

  std::vector<float> computeSoftmax(std::vector<int8_t> input);

  void loadImages(std::string image_dir, unsigned num_queries);

  void
  resizeImgs(std::vector<cv::Mat>& input_images, std::vector<cv::Mat>& resize_images, void* din_data, int image_width,
             int image_height, int batch_size);

  void flattenData(std::vector<uint8_t>& flattenedData, int batch_size, int image_width, int image_height,
                   std::vector<cv::Mat>& resize_images);

  int top1Count_;
  int top5Count_;
  std::vector<pair<std::string, int>> goldenLabels_;
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
