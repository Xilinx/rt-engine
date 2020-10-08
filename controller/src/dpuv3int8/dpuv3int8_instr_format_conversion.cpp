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

std::string InstrFormatConverter::hexOf(unsigned __int128 value)
{
    int r;
    std::string hexdec_num="";
    char hex[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
	  while(value>0)
    {
      r = value % 16;
      hexdec_num = hex[r] + hexdec_num;
      value = value/16;
    }
    
    return hexdec_num;
}

//https://stackoverflow.com/questions/25114597/how-to-print-int128-in-g
std::ostream& operator<<( std::ostream& dest, unsigned __int128 value )
{
    std::ostream::sentry s( dest );
    if ( s ) {
        __uint128_t tmp = value < 0 ? -value : value;
        char buffer[ 128 ];
        char* d = std::end( buffer );
        do
        {
            -- d;
            *d = "0123456789"[ tmp % 10 ];
            tmp /= 10;
        } while ( tmp != 0 );
        if ( value < 0 ) {
            -- d;
            *d = '-';
        }
        int len = std::end( buffer ) - d;
        if ( dest.rdbuf()->sputn( d, len ) != len ) {
            dest.setstate( std::ios_base::badbit );
        }
    }
    return dest;
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
        if(getline(ss, field, ' ') and isNumber(field))
          loadInstruction(instructions_, field, 0, true); //0 indicates dpdon
        if(getline(ss, field, ' ') and isNumber(field))
          loadInstruction(instructions_, field, 1, true); //1 indicates dpdby
        
        int counter = 0;
        while(getline(ss,field,' '))
          {    
            if(!isNumber(field) and field.size()!=0)
              fieldName = field;
            if(isNumber(field) and field.size()!=0)
              loadInstruction(instructions_, fieldName, std::stoi(field), false);

            if(field.size()!=0)
              counter++;
          }

      }
    }
  }

  
}

void InstrFormatConverter::convertAsmToDdrFormat(std::string instr_asm_filename_, std::string instr_filename_)
{
  std::vector<Instr> instructions_;
  loadAsmInstructionFile(instructions_, instr_asm_filename_); 

  std::vector<std::string> mach;

  for(uint32_t i=0; i<instructions_.size(); i++)
  {
    unsigned __int128 instrVal = 0;
    int maxIdx = 0;
    int opcode_v = 0;
    assert(iset_int8_names_.size()==iset_int8_.size());
   for(uint32_t j=0; j<iset_int8_names_.size(); j++)
   {
     if(instructions_[i].instrName == iset_int8_names_[j])
     {
         for(uint32_t k=0; k<iset_int8_[j].size(); k++)
         {
             if((iset_int8_[j][k].first)=="opcode_v")
             {
               opcode_v = iset_int8_[j][k].second[0];
             }
             else if((iset_int8_[j][k].first)=="opcode")
             {
               maxIdx = std::max(maxIdx, iset_int8_[j][k].second[0]);
               instrVal = instrVal + ((unsigned __int128)((opcode_v)+(iset_int8_[j][k].second[3]))<<(unsigned __int128)((iset_int8_[j][k].second[0]*32)+(iset_int8_[j][k].second[1])));
             }
             else
             {
               maxIdx = std::max(maxIdx, iset_int8_[j][k].second[0]);
               if(false)
               {
                  std::cout<<"Incorrect" <<std::endl;
                  exit(1);
               }
               else if(false)
               {
                  std::cout<<"Incorrect"<<std::endl;
                  exit(1);
               }
               else
               {
                  instrVal = instrVal + ((unsigned __int128)((instructions_[i].fieldValues[iset_int8_[j][k].first])+iset_int8_[j][k].second[3])<<(unsigned __int128)((iset_int8_[j][k].second[0]*32)+iset_int8_[j][k].second[1]));

               }
             }
         }
         std::string hexString = hexOf(instrVal);
         mach.push_back(prepend(hexString, (maxIdx+1)*8));
         
     }
   }

  }
  
  std::ofstream outFile;
  outFile.open(instr_filename_);
  std::string temp="";
  int count = 0;
  for(uint32_t i=0; i<mach.size(); i++)
  {
     int length = mach[i].size();

     for(int j=0; j<(length/8); j++)
     {
       temp= mach[i].substr(((length/8)-(j+1))*8, 8);
       outFile<<temp<<"\n";
       
       count++;
     }
  }
  
  if(count%16!=0)
  {
    int r = count%16;
    int toFill = 16-r;
    for(int i=0; i<toFill; i++)
    {
      outFile<<"00000000\n";
    }
  }
  outFile.close(); 

}

