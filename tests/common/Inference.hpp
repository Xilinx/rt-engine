#pragma once

#include <string>
#include <memory>
#include "dpu_runner.hpp"
#include <opencv2/opencv.hpp>
#include "json-c/json.h"
#include <xir/graph/graph.hpp>
#include <xir/tensor/tensor.hpp>
#include "cpuUtil.hpp"

/* This class is meant to orchestrate model inference */
class Inference {
public:

  Inference(std::string xmodel, unsigned num_queries, unsigned num_threads, unsigned num_runners, std::string image_dir,
            bool verbose, std::string synset_filename = std::string(), std::string golden_filename = std::string(), std::string accuracyCheckTop1Top5Nums=" ", std::string performanceCheck="0");

  int run();

private:
  void run_thread(unsigned tidx, unsigned ridx, unsigned n);

  std::string xmodel_;
  unsigned num_queries_;
  unsigned num_threads_;
  unsigned num_runners_;
  xir::Subgraph *subgraph_;
  std::vector<std::unique_ptr<vart::DpuRunner>> runners_;
  std::unique_ptr<cpuUtil> cpuUtilobj_;
};
