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

class InstrFormatConverter
{
  public:
    void convertAsmToDdrFormat(std::string instrfname, std::string instrfilename);
 
  private:
    struct Instr {
        std::string instrName;
        std::map<std::string, int> fieldValues;
      };
      
    bool isNumber(const std::string &s);
    std::string prepend(std::string hexString, int length);
    std::string hexOf(unsigned __int128 value);
    void loadAsmInstructionFile(std::vector<Instr> &instructions_, std::string instrfname);
    void loadInstruction(std::vector<Instr> &instructions, std::string fieldName, int value, bool isDpdonDpdby);
    
    std::vector<std::string> iset_int8_names_{"END", "LOAD", "SAVE", "CONVINIT", "CONV", "ELEWINIT", "ELEW", "POOL"};

    std::vector<std::vector<std::pair<std::string, std::vector<int>>>> iset_int8_{
                                       {
                                         {"opcode_v",{7}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}}
                                       },
                                       {
                                         {"opcode_v",{0}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}},
                                         {"mode",{0,18,2,0}},
                                         {"bank_addr",{0,0,18,0}},
                                         {"bank_id",{1,12,6,0}},
                                         {"jump_read",{1,0,12,-1}},
                                         {"jump_write",{2,22,8,-1}},
                                         {"length",{2,12,10,-1}},
                                         {"channel",{2,0,12,-1}},
                                         {"reg_id",{3,29,3,0}},
                                         {"ddr_addr",{3,0,29,0}}
                                       },
                                       {
                                         {"opcode_v",{4}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}},
                                         {"mode",{0,18,2,0}},
                                         {"bank_addr",{0,0,18,0}},
                                         {"bank_id",{1,12,6,0}},
                                         {"jump_write",{1,0,12,-1}},
                                         {"jump_read",{2,22,8,-1}},
                                         {"length",{2,12,10,-1}},
                                         {"channel",{2,0,12,-1}},
                                         {"reg_id",{3,29,3,0}},
                                         {"ddr_addr",{3,0,29,0}}
                                        },
                                        {
                                         {"opcode_v",{9}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}},
                                         {"act_type",{0,18,2,0}},
                                         {"shift_cut",{0,12,6,0}},
                                         {"jump_read",{0,0,12,-1}},
                                         {"stride_h",{1,29,3,-1}},
                                         {"wgt_jump_read_endl",{1,16,13,-1}},
                                         {"channel_offset",{1,12,4,0}},
                                         {"jump_read_endl",{1,0,12,-1}},
                                         {"stride_w",{2,29,3,-1}},
                                         {"kernel_h",{2,25,4,-1}},
                                         {"kernel_w",{2,21,4,-1}},
                                         {"channel_group_out",{2,12,9,-1}},
                                         {"jump_write",{2,0,12,-1}},
                                         {"stride_out",{3,30,2,-1}},
                                         {"prelu_shift_p",{3,24,6,0}},
                                         {"channel_group_in",{3,12,9,-1}},
                                         {"jump_write_endl",{3,0,12,-1}}
                                        },
                                        {
                                         {"opcode_v",{8}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}},
                                         {"prelu_offset",{0,16,4,0}},
                                         {"valid_pixel_parallel",{0,13,3,-1}},
                                         {"bank_addr_in",{0,0,13,0}},
                                         {"pad_left",{1,28,4,0}},
                                         {"pad_top",{1,24,4,0}},
                                         {"length",{1,13,11,-1}},
                                         {"bank_addr_out",{1,0,13,0}},
                                         {"pad_right",{2,28,4,0}},
                                         {"pad_bottom",{2,24,4,0}},
                                         {"bank_id_in",{2,19,5,0}},
                                         {"bank_id_out",{2,14,5,0}},
                                         {"bank_addr_weights",{2,0,13,0}},
                                         {"bias_offset",{3,30,2,0}},
                                         {"stride_offset_out",{3,28,2,0}},
                                         {"prelu_shift_n",{3,22,6,0}},
                                         {"bank_addr_prelu",{3,13,9,0}},
                                         {"bank_addr_bias",{3,0,13,0}}
                                        },
                                        {
                                         {"opcode_v",{13}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}},
                                         {"bank_id_in",{0,15,5,0}},
                                         {"shift_read",{0,10,4,0}},
                                         {"jump_read",{0,0,10,-1}},
                                         {"jump_read_endl",{1,20,12,-1}},
                                         {"id",{1,13,2,0}},
                                         {"bank_addr_in",{1,0,13,0}}
                                        },
                                        {
                                         {"opcode_v",{14}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}},
                                         {"stride_out",{0,17,3,-1}},
                                         {"stride_offset_out",{0,14,3,0}},
                                         {"num",{0,12,2,-1}},
                                         {"nonlinear_type",{0,10,2,0}},
                                         {"jump_write",{0,0,10,-1}},
                                         {"jump_write_endl",{1,18,12,-1}},
                                         {"bank_id_out",{1,13,5,0}},
                                         {"bank_addr_out",{1,0,13,0}},
                                         {"width",{2,18,10,-1}},
                                         {"bank_id_prelu",{2,13,5,0}},
                                         {"bank_addr_prelu",{2,0,13,0}},
                                         {"valid_pixel_parallel",{3,20,2,-1}},
                                         {"channel_group",{3,12,8,-1}},
                                         {"shift_write",{3,6,6,0}},
                                         {"shift_write_prelu_n",{3,0,6,0}}
                                        },
                                        {
                                         {"opcode_v",{12}},
                                         {"opcode",{0,28,4,0}},
                                         {"dpdon",{0,24,4,0}},
                                         {"dpdby",{0,20,4,0}},
                                         {"pad_top",{0,16,4,0}},
                                         {"pad_bottom",{0,12,4,0}},
                                         {"pad_left",{0,8,4,0}},
                                         {"pad_right",{0,4,4,0}},
                                         {"shift_avg",{0,0,4,0}},
                                         {"bank_addr_in",{1,19,13,0}},
                                         {"bank_addr_out",{1,6,13,0}},
                                         {"stride_w",{1,3,3,-1}},
                                         {"stride_h",{1,0,3,-1}},
                                         {"jump_read_endl",{2,21,11,-1}},
                                         {"jump_write_endl",{2,10,11,-1}},
                                         {"length",{2,0,10,-1}},
                                         {"kernel_w",{3,28,4,-1}},
                                         {"select_avg",{3,24,4,0}},
                                         {"channel_group",{3,17,7,-1}},
                                         {"bank_id_in",{3,12,5,0}},
                                         {"bank_id_out",{3,7,5,0}},
                                         {"valid_pixel_parallel",{3,5,2,-1}},
                                         {"pool_type",{3,4,1,0}},
                                         {"kernel_h",{3,0,4,-1}}
                                        }
}; 

};


