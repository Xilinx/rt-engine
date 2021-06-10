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

#define CONTROL_ADDR_AP_CTRL                            0x00
#define CONTROL_ADDR_GIE                                0x04
#define CONTROL_ADDR_IER                                0x08
#define CONTROL_ADDR_ISR                                0x0c
#define CONTROL_ADDR_BLOCK_INSTR                        0x10
#define CONTROL_ADDR_BLOCK_PARAMS                       0x18
#define CONTROL_ADDR_BLOCK_SWAP                         0x20
#define CONTROL_ADDR_BLOCK_RSLT                         0x28
#define CONTROL_ADDR_BLOCK_SRC                          0x30
#define CONTROL_ADDR_BLOCK_DST                          0x38
#define CONTROL_ADDR_TASK_DRU_ADDR_STRD                  0x40
#define CONTROL_ADDR_TASK_DRU_KW                         0x44
#define CONTROL_ADDR_TASK_DRU_SW                         0x48
#define CONTROL_ADDR_TASK_DRU_IC                         0x4c
#define CONTROL_ADDR_TASK_DRU_OW                         0x50
#define CONTROL_ADDR_TASK_DRU_OH                         0x54
#define CONTROL_ADDR_TASK_DRU_SRC_NTRANS                 0x58
#define CONTROL_ADDR_TASK_DRU_DST_NTRANS                 0x5c
#define CONTROL_ADDR_TASK_DRU_PL_CORR                    0x60
#define CONTROL_ADDR_TASK_DRU_PR_CORR                    0x64
#define CONTROL_ADDR_TASK_DRU_IW_CORR                    0x68
#define CONTROL_ADDR_TASK_DRU_SW_CORR                    0x6c
#define CONTROL_ADDR_TASK_DRU_WCG_CORR                   0x70
#define CONTROL_ADDR_TASK_DRU_READ_MODE                  0x74
#define CONTROL_ADDR_TASK_MODE                          0x78
#define CONTROL_ADDR_REG_VERSION                        0x7c
#define CONTROL_ADDR_REG_AXCACHE_AXOS                   0x80
#define CONTROL_ADDR_REG_DPU_PROF_ENABLE                0x84
#define CONTROL_ADDR_REG_DPU_PROF_FLAG                  0x90
#define CONTROL_ADDR_REG_DPU_PROF_TSTAMP                0x94
#define CONTROL_ADDR_REG_DPU_PROF_LSNUM                 0x98
#define CONTROL_ADDR_REG_DPU_PROF_SSNUM                 0x9c
#define CONTROL_ADDR_REG_DPU_PROF_CSNUM                 0xa0
#define CONTROL_ADDR_REG_DPU_PROF_MSNUM                 0xa4
#define CONTROL_ADDR_REG_DPU_PROF_LFNUM                 0xa8
#define CONTROL_ADDR_REG_DPU_PROF_SFNUM                 0xac
#define CONTROL_ADDR_REG_DPU_PROF_CFNUM                 0xb0
#define CONTROL_ADDR_REG_DPU_PROF_MFNUM                 0xb4
#define CONTROL_ADDR_REG_DPU_STATUS                     0xb8
#define CONTROL_ADDR_REG_DRU_STATUS                      0xbc
#define CONTROL_ADDR_DONE_CNT                           0xc0
#define CONTROL_ADDR_REG_DRU_PROF_ENABLE                 0xc4
#define CONTROL_ADDR_REG_DRU_PROF_WORK_CYC               0xc8
#define CONTROL_ADDR_REG_DRU_PROF_WAIT_DPU_CYC           0xcc
#define CONTROL_ADDR_REG_DRU_PROF_DPU_ACK_CYC            0xd0
#define CONTROL_ADDR_REG_DRU_PROF_WAIT_RD_DATA_CYC       0xd4
#define CONTROL_ADDR_REG_DRU_PROF_WRITE_BUF_FULL_CYC     0xd8
#define CONTROL_ADDR_REG_DRU_PROF_DATAREORG_CYC          0xdc
#define CONTROL_ADDR_REG_DRU_PROF_BUS_RD_TRANS           0xe0
#define CONTROL_ADDR_REG_DRU_PROF_BUS_WT_TRANS           0xe4
#define CONTROL_ADDR_REG_DRU_PROF_BUS_RD_CYC             0xe8
#define CONTROL_ADDR_REG_DRU_PROF_BUS_WT_CYC             0xec
#define CONTROL_ADDR_REG_DRU_PROF_BUS_RREQ_WAIT_CYC      0xf0
#define CONTROL_ADDR_REG_DRU_PROF_BUS_AWREQ_WAIT_CYC     0xf4
#define CONTROL_ADDR_REG_DRU_PROF_BUS_WREQ_WAIT_CYC      0xf8
#define CONTROL_ADDR_REG_DRU_PROF_OVERFLOW               0xfc
#define REG_AXCACHE_AXOS                                 0x01012020

#define BUF_IDX_NUM                     12

#define BUF_IDX_INSTR                   0
#define BUF_IDX_PARAMS                  1
#define BUF_IDX_SWAP                    2
#define BUF_IDX_DIN                     3
#define BUF_IDX_DOUT                    4
#define BUF_IDX_RESULT                  5
#define BUF_IDX_DRUSRC                   6
#define BUF_IDX_DRUDST                   7
#define BUF_IDX_SRC                     9
#define BUF_IDX_DST                     10
#define BUF_IDX_NULL                    11

#define REG_IDX_TASK_DRU_ADDR_STRD       0
#define REG_IDX_TASK_DRU_KW              1
#define REG_IDX_TASK_DRU_SW              2
#define REG_IDX_TASK_DRU_IC              3
#define REG_IDX_TASK_DRU_OW              4
#define REG_IDX_TASK_DRU_OH              5
#define REG_IDX_TASK_DRU_SRC_NTRANS      6
#define REG_IDX_TASK_DRU_DST_NTRANS      7
#define REG_IDX_TASK_DRU_PL_CORR         8
#define REG_IDX_TASK_DRU_PR_CORR         9
#define REG_IDX_TASK_DRU_IW_CORR         10
#define REG_IDX_TASK_DRU_SW_CORR         11
#define REG_IDX_TASK_DRU_WCG_CORR        12
#define REG_IDX_TASK_DRU_READ_MODE       13
#define REG_IDX_TASK_MODE               14
#define REG_IDX_REG_VERSION             15
#define REG_IDX_REG_AXCACHE_AXOS        16
#define REG_IDX_REG_DPU_PROF_ENABLE     17
#define REG_IDX_REG_DPU_PROF_FLAG       18
#define REG_IDX_REG_DPU_PROF_TSTAMP     19
#define REG_IDX_REG_DPU_PROF_LSNUM      20
#define REG_IDX_REG_DPU_PROF_SSNUM      21
#define REG_IDX_REG_DPU_PROF_CSNUM      22
#define REG_IDX_REG_DPU_PROF_MSNUM      23
#define REG_IDX_REG_DPU_PROF_LFNUM      24
#define REG_IDX_REG_DPU_PROF_SFNUM      25
#define REG_IDX_REG_DPU_PROF_CFNUM      26
#define REG_IDX_REG_DPU_PROF_MFNUM      27
#define REG_IDX_REG_DPU_STATUS          28
#define REG_IDX_REG_DRU_STATUS           29
#define REG_IDX_DONE_CNT                30
