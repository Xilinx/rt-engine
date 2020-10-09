#include <thread>
#include "tests.hpp"

TestClassifyMultiThread::TestClassifyMultiThread(
  std::string runner_dir, unsigned nqueries, unsigned nthreads, unsigned nrunners, std::string img_dir, const bool goldenAvailable, const bool verbose) 
 : num_queries_(nqueries), num_threads_(nthreads), num_runners_(nrunners), 
   runner_dir_(runner_dir), runners_(nrunners)
{
  
  cpuUtilobj_.reset(new cpuUtil(runner_dir, goldenAvailable, verbose, img_dir, num_queries_));

  std::vector<std::thread> threads(num_runners_);
  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti] = std::thread([this,ti]{init_thread(ti);});

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();

  std::cout<<"********************************"<<std::endl;
  std::cout<<"Loading "<<num_queries_*4<<" Images ..."<<std::endl;

}

void TestClassifyMultiThread::run() {
  std::vector<std::thread> threads(num_threads_);

  auto t1 = std::chrono::high_resolution_clock::now();

  for (unsigned ti=0; ti < threads.size(); ti++)
  {
    auto ri = ti % runners_.size();
    threads[ti] = std::thread([this,ti,ri]{run_thread(ti, ri, num_queries_/num_threads_);});
  }

  for (unsigned ti=0; ti < threads.size(); ti++)
    threads[ti].join();

  auto t2 = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> elapsed = t2-t1;
  std::cout << "Elapsed Threads: " << elapsed.count() << std::endl;

  cpuUtilobj_->printtop1top5(num_queries_);

}

void TestClassifyMultiThread::init_thread(unsigned ridx) {

  std::unique_ptr<xir::Graph> graph = xir::Graph::deserialize(runner_dir_);
  std::vector<xir::Subgraph *> subgraphs = graph->get_root_subgraph()->children_topological_sort();
  auto subgraph = subgraphs[1];//TO_DO - replace 1 with automated value
  runners_[ridx].reset(new vart::DpuRunner(subgraph));
}

void TestClassifyMultiThread::run_thread(unsigned tidx, unsigned ridx, unsigned n) {
  auto runner = runners_[ridx].get();
  auto inputs = runner->get_inputs();
  auto outputs = runner->get_outputs();
  
  for (unsigned i=tidx*n; i < (tidx+1)*n; i++)
  {
    cpuUtilobj_->fillInData(i, inputs);
    auto ret = runner->execute_async(inputs, outputs);
    runner->wait(uint32_t(ret.first), -1);
    cpuUtilobj_->postProcess(outputs, i);
  }

}


