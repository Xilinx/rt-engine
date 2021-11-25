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

#include "dpuv3int8_controller.hpp"

using namespace std;

bool InstrFormatConverter::isNumber(const std::string &s) {
  return !s.empty() && std::all_of(s.begin(), s.end(), ::isdigit);
}

std::string InstrFormatConverter::prepend(std::string hexString, int length)
{
   if((uint32_t)length==hexString.size())
     return hexString;

   int toAdd = length-hexString.size();
   if(toAdd<0)
   {
     std::cout<<"prepend cannot remove"<<std::endl;
     exit(1);
   }
   for(int k=0; k<toAdd; k++)
   {
     hexString = "0"+hexString;
   }
   return hexString;
}

void InstrFormatConverter::loadInstruction(std::vector<Instr> &instructions, std::string fieldName, int value, bool isDpdonDpdby)
{
   if(isDpdonDpdby)
   {
     if(value==0)
     {
       instructions[instructions.size()-1].fieldValues["dpdon"] = std::stoi(fieldName, nullptr,2);
       return;
     }
     if(value==1)
     {
       instructions[instructions.size()-1].fieldValues["dpdby"] = std::stoi(fieldName, nullptr, 2);
       return;
     }
   }


   instructions[instructions.size()-1].fieldValues[fieldName] = value;


}

void InstrFormatConverter::loadAsmInstructionFile(std::vector<Instr> &instructions_, std::string instr_asm_filename_)
{
  std::ifstream inputFile;
  std::string instrLine;
  inputFile.open(instr_asm_filename_);
  std::string field;
  std::string opCode;
  std::string fieldName;

  while(std::getline(inputFile, instrLine))
  {
    std::stringstream ss(instrLine);
    if(getline(ss,field,' '))
    {
      opCode = field;
      if(std::find(iset_int8_names_.begin(), iset_int8_names_.end(), opCode) != iset_int8_names_.end())
      {
        instructions_.push_back(Instr());
        instructions_[instructions_.size()-1].instrName = field;
        if(getline(ss, field, ' ') && isNumber(field))
          loadInstruction(instructions_, field, 0, true); //0 indicates dpdon
        if(getline(ss, field, ' ') && isNumber(field))
          loadInstruction(instructions_, field, 1, true); //1 indicates dpdby
        
        int counter = 0;
        while(getline(ss,field,' '))
          {    
            if(!isNumber(field) && field.size()!=0)
              fieldName = field;
            if(isNumber(field) && field.size()!=0)
              loadInstruction(instructions_, fieldName, std::stoi(field), false);

            if(field.size()!=0)
              counter++;
          }

      }
    }
  }

  
}

