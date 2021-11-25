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

#include <boost/filesystem.hpp>
#include <memory>
#include "cpuUtil.hpp"
#include "XirKeys.hpp"

using namespace std;
using namespace boost::filesystem;

cpuUtil::cpuUtil(std::string xmodel, std::string image_dir, unsigned num_queries, bool verbose,
                 std::string synset_filename, std::string golden_filename, std::string accuracyCheckTop1Top5Nums, std::string performanceCheck)
  : keysobj_(std::make_unique<XirKeys>(xmodel)), verbose_(verbose), synset_filename_(synset_filename),
    golden_filename_(golden_filename) {

  synsetAvailable_ = !synset_filename_.empty();
  goldenAvailable_ = !golden_filename_.empty();
  loadImages(image_dir, num_queries);
  if (synsetAvailable_)
    load_synset();
  if (goldenAvailable_) {
    top1Count_ = 0;
    top5Count_ = 0;
    load_golden();
  }
  parseTop1Top5Expected(accuracyCheckTop1Top5Nums);
  parsePerformanceExpected(performanceCheck);

}

void cpuUtil::load_golden() {
  std::string filename = golden_filename_;
  std::ifstream ifile;
  std::string line;
  ifile.open(filename);
  while (std::getline(ifile, line)) {
    std::string buf;
    std::stringstream ss(line);
    std::vector<std::string> tokens;
    while (ss >> buf) {
      tokens.push_back(buf);
    }

    goldenLabels_.emplace_back(tokens[0], std::stoi(tokens[1]));

  }
  ifile.close();

}

void cpuUtil::parseTop1Top5Expected(std::string accuracyCheckTop1Top5Nums)
{
    top1Expected_ = 0;
    top5Expected_ = 0;
    std::string buf;                 
    std::stringstream ss(accuracyCheckTop1Top5Nums);    
    std::vector<std::string> tokens(2,"0");
    int count=0;
    while (ss >> buf)
    {
       if(count<2)
       {
         tokens[count]=buf;
         count++;
       }
       else
       {
         throw std::runtime_error("Format expected for env variable XLNX_CHECK_ACCURACY \"top1 top5\", such as \"50 70\", in order to skip checking accuracy please pass in an empty string for env variable XLNX_CHECK_ACCURACY");
       }
    }
    
    std::stringstream numbers0(tokens[0]);
    std::stringstream numbers1(tokens[1]);

    numbers0 >> top1Expected_;
    numbers1 >> top5Expected_;
}

void cpuUtil::parsePerformanceExpected(std::string performanceExpected)
{
    performanceExpected_ = 0;
    std::string buf;                 
    std::stringstream ss(performanceExpected);    
    int count=0;
    while (ss >> buf)
    {
       if(count<1)
       {
         performanceExpected_=std::stoi(buf);
         count++;
       }
       else
       {
         throw std::runtime_error("Format expected for env variable XLNX_CHECK_PERFORMANCE \"qps\", such as \"50\", in order to skip checking performance please pass in an empty string for env variable XLNX_CHECK_PERFORMANCE");
       }
    }

}

int cpuUtil::printtop1top5(unsigned num_queries, double totalTimeSec) {
  std::cout << "Num images processed: " << num_queries*4 << std::endl;
  float top1 = ((float) (top1Count_)/((float) (num_queries*4)))*100;
  float top5 = ((float) (top5Count_)/((float) (num_queries*4)))*100;
  float performance = (float)(((float)num_queries)/((float)totalTimeSec));
  if (goldenAvailable_) {
    std::cout << "Top-1: " << top1 << "%" << std::endl;
    std::cout << "Top-5: " << top5 << "%" << std::endl;
  }
 
  if(top1Expected_>0 or top5Expected_>0)
  {
     std::cout<<"Accuracy Check against expected top1 top5 numbers ..."<<std::endl;
     std::cout<<"Top-1: Expected: >="<<top1Expected_<<"%"<<" Seen from program: "<<top1<<"%"<<std::endl;
     std::cout<<"Top-5: Expected: >="<<top5Expected_<<"%"<<" Seen from program: "<<top5<<"%"<<std::endl;
  }

  if(performanceExpected_>0)
  {
    std::cout<<"Performance Check against expected queries per sec ..."<<std::endl;
    std::cout<<"Queries per sec Expected: >="<<performanceExpected_<<"qps"<<" Seen from program: "<<performance<<"qps"<<std::endl;
  }

  if(top1>=top1Expected_ && top5>=top5Expected_ && performance>=performanceExpected_)
     return 0;
  
  return -1;


}

void cpuUtil::printPredictionLabels(std::vector<std::vector<pair<float, int>>> indices, int queryNum) {
  int batch_size = 4;
  std::vector<std::string> golden(batch_size);
  for (int i = 0; i < batch_size; i++) {
    if (verbose_) {
      std::cout << "******************" << std::endl;
      std::cout << "Predictions for Image at " << fileNames_[(queryNum*batch_size) + i] << std::endl;
    }
    for (uint32_t k = 0; k < goldenLabels_.size(); k++) {
      if (fileNames_[(queryNum*batch_size) + i] == goldenLabels_[k].first) {
        golden[i] = synsetLabels_[goldenLabels_[k].second];
      }
    }
    for (int j = 0; j < 5; j++) {
      if (verbose_)
        std::cout << std::fixed << std::setprecision(5) << indices[i][j].first << " "
                  << synsetLabels_[indices[i][j].second].c_str() << std::endl;
      if (j == 0) {
        if ((synsetLabels_[indices[i][j].second].c_str()) == golden[i]) {
          top1Count_ = top1Count_ + 1;
          top5Count_ = top5Count_ + 1;
        }
      } else {
        if ((synsetLabels_[indices[i][j].second].c_str()) == golden[i]) {
          top5Count_ = top5Count_ + 1;
        }

      }
    }
    if (verbose_)
      std::cout << "******************" << std::endl;
  }
  if (verbose_)
    std::cout << "-----------------------------------------------" << std::endl;

}

void cpuUtil::resizeImgs(std::vector<cv::Mat>& input_images, std::vector<cv::Mat>& resize_images, void *din_data,
                         int image_width, int image_height, int batch_size) {
  for (int i = 0; i < batch_size; i++) {
    cv::Mat temp_image(image_height, image_width, CV_8UC3,
                       (void *) ((long long) din_data + i*image_width*image_height*3));
    cv::resize(input_images[i], temp_image, cv::Size(image_width, image_height));
    for (int j = 0; j < image_height; j++) {
      for (int k = 0; k < image_width; k++) {
        temp_image.at<cv::Vec3b>(j, k)[0] = (temp_image.at<cv::Vec3b>(j, k)[0] - 123)/2;
        temp_image.at<cv::Vec3b>(j, k)[1] = (temp_image.at<cv::Vec3b>(j, k)[1] - 107)/2;
        temp_image.at<cv::Vec3b>(j, k)[2] = (temp_image.at<cv::Vec3b>(j, k)[2] - 104)/2;
      }
    }
    resize_images.push_back(temp_image);
  }

}

void cpuUtil::flattenData(std::vector<uint8_t>& flattenedData, int batch_size, int image_width, int image_height,
                          std::vector<cv::Mat>& resize_images) {
  int idx = 0;
  for (int k51 = 0; k51 < batch_size; k51++) {
    for (int k52 = 0; k52 < image_height; k52++) {
      for (int k53 = 0; k53 < image_width; k53++) {
        flattenedData[idx] = (uint8_t) (resize_images[k51].at<cv::Vec3b>(k52, k53)).val[0];
        idx = idx + 1;
        flattenedData[idx] = (uint8_t) (resize_images[k51].at<cv::Vec3b>(k52, k53)).val[1];
        idx = idx + 1;
        flattenedData[idx] = (uint8_t) (resize_images[k51].at<cv::Vec3b>(k52, k53)).val[2];
        idx = idx + 1;

      }
    }
  }

}

std::vector<float> cpuUtil::computeSoftmax(std::vector<int8_t> input) {
  uint32_t i;
  float m;
  std::vector<float> output(synsetLabels_.size());
  /* Find maximum value from input array */
  m = (float) input[0];
  for (i = 1; i < synsetLabels_.size(); i++) {
    if ((float) input[i] > m) {
      m = (float) input[i];
    }
  }
  float sum = 0;
  for (i = 0; i < synsetLabels_.size(); i++) {
    sum += std::exp((float) input[i] - m);
  }
  for (i = 0; i < synsetLabels_.size(); i++) {
    output[i] = std::exp((float) input[i] - m - log(sum));
  }
  return output;

}

std::vector<pair<float, int>> cpuUtil::sortArr(std::vector<float> arr, int n) {

  int labelOffset = keysobj_->getOutCh() - 1000;
  vector<pair<float, float> > vp;

  for (int i = 0; i < n; ++i) {
    vp.push_back(make_pair(arr[i], i));
  }

  sort(vp.begin(), vp.end());

  std::vector<pair<float, int>> p;

  for (uint32_t i = vp.size() - 1; i > vp.size() - 6; i--) {
    p.push_back(make_pair(vp[i].first, vp[i].second - labelOffset));
  }
  return p;
}


void cpuUtil::postProcess(std::vector<vart::TensorBuffer *> outputs, int idx) {
  void *dat = (void *) outputs[0]->data().first;
  int batch_size = 4;
  int outSize = keysobj_->getOutW()*keysobj_->getOutH()*keysobj_->getOutCh();
  std::vector<std::vector<int8_t>> net_output(batch_size);
  int k = 0;
  for (int o = 0; o < batch_size; o++) {
    for (int j = 0; j < outSize; j++) {
      net_output[o].push_back(*(int8_t *) ((long long) dat + k));
      k = k + 1;
    }
  }

  // Softmax
  std::vector<std::vector<float>> softmax_output(batch_size, std::vector<float>(synsetLabels_.size()));
  // Judgment and output

  std::vector<std::vector<pair<float, int>>> labels;
  labels.resize(batch_size);


  for (int i = 0; i < batch_size; i++) {
    softmax_output[i] = computeSoftmax(net_output[i]);
    labels[i] = sortArr(softmax_output[i], synsetLabels_.size());
  }

  printPredictionLabels(labels, idx);
}

void cpuUtil::load_synset() {
  std::string filename = synset_filename_;
  std::ifstream ifile;
  std::string line;
  ifile.open(filename);
  while (std::getline(ifile, line)) {
    synsetLabels_.push_back(line);
  }
  ifile.close();
}

void cpuUtil::fillInData(int idx, std::vector<vart::TensorBuffer *> inputs) {

  void *std_data = (void *) inputs[0]->data().first;
  for (uint32_t i = 0; i < flattenedImgData_[idx].size(); i++) {

    *(int8_t *) ((long long) std_data + i) = flattenedImgData_[idx][i];
  }

}

void cpuUtil::loadImages(std::string img_dir, unsigned num_queries) {

  uint32_t inW = keysobj_->getInW();
  uint32_t inH = keysobj_->getInH();
  uint32_t inCh = keysobj_->getInCh();

  int k;
  int batch_size = 4;
  int image_width = inW;
  int image_height = inH;
  int image_channels = inCh;
  int imgSize = image_width*image_height*image_channels*batch_size;
  void *din_data = nullptr;
  int checkSize = rte::posix_memalign(&din_data, 4096, imgSize);
  if (checkSize != 0)
    std::cout << "Error loading images" << std::endl;

  path p(img_dir);
  for (auto i = directory_iterator(p); i != directory_iterator(); i++) {
    if (!is_directory(i->path())) //we eliminate directories
    {
      imgFileNames_.push_back(img_dir + "/" + i->path().filename().string());
      fileNames_.push_back(i->path().filename().string());
    } else
      continue;
  }

  flattenedImgData_.resize(num_queries);

  for (uint32_t o = 0; o < num_queries; o++) {
    std::vector<cv::Mat> input_images(batch_size);
    std::vector<cv::Mat> resize_images;
    k = 0;
    for (uint32_t l = o*batch_size; l < (o*batch_size) + batch_size; l++) {
      input_images[k] = cv::imread(imgFileNames_[l], cv::IMREAD_COLOR);
      k = k + 1;
    }

    resizeImgs(input_images, resize_images, din_data, image_width, image_height, batch_size);

    std::vector<uint8_t> flattenedData(batch_size*image_height*image_width*image_channels, 0);
    flattenData(flattenedData, batch_size, image_width, image_height, resize_images);
    for (uint32_t y = 0; y < flattenedData.size(); y++) {
      flattenedImgData_[o].push_back(flattenedData[y]);
    }
  }

}

