#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <math.h>
#include <sstream>

int binToInt(std::string Bin){
	bool twoscomp = false;
	if (Bin[0] == 49){
		twoscomp = true;
		bool firstone = false;
		for (int i = Bin.length() - 1; i >= 0; i--){
			if (firstone == true){
				if (Bin[i] == 49)
					Bin[i] = '0';
				else
					Bin[i] = '1';
			}
			if (firstone == false && Bin[i] == 49)
				firstone = true;
		}
	}
	double tempint = 0;
	for (int i = (Bin.length() - 1); i >= 0; i--){
		int something = pow(2, Bin.length() - i);
		int something2 = (Bin[i] - 48);
		tempint += (pow(2, Bin.length() - i - 1) * (Bin[i] - 48));
	}
	if (twoscomp == true)
		tempint = 0 - tempint;
	return (int)tempint;
}
void binToOffset(std::string& Bin){
	Bin = Bin + "00";
}
int PCToIndex(int PC){
	return ((PC - 128) / 4);
}
struct instruction{
	std::string Binary;
	std::string Name;
	Name = "";
	int PC = 128;
	int rs = 0;
	int rt = 0;
	int rd = 0;
	bool category2 = false;
	bool category3 = false;
	int immediate_value = 0;
};
struct Data{
	std::string Binary;
	int PC = 0;
	int theData = 0;
};
class Instructions{
private:	instruction tempinstruction;
			std::vector<instruction> inst;



public: void clearInstruction(instruction& n){
			n.Binary = "";
			n.Name = "";
			n.rs = 0;
			n.rt = 0;
			n.rd = 0;
			n.category2 = false;
			n.category3 = false;
			n.immediate_value = 0;
		}
		void computeValues(std::string str, bool& startBreak, int PC){

			std::string tempstring;
			tempinstruction.Binary = str.substr(0,32);
			std::string twobit = str.substr(0, 2);
		
			if (twobit == "00"){
				std::string opCode = str.substr(2, 4);
				if (opCode == "0000"){
					tempinstruction.Name = "J";
					std::string offset = str.substr(6, 26);
					binToOffset(offset);
					tempinstruction.immediate_value = binToInt(offset);
				}
				else if (opCode == "0010"){
					tempinstruction.Name = "BEQ";
					tempinstruction.rs = binToInt(str.substr(6, 5));					
					tempinstruction.rt = binToInt(str.substr(11, 5));
					std::string offset = str.substr(16, 16);
					binToOffset(offset);
					tempinstruction.immediate_value = binToInt(offset);
				}
				else if (opCode == "0100"){
					tempinstruction.Name = "BGTZ";
					tempinstruction.rs = binToInt(str.substr(6, 5));
					std::string offset = str.substr(16, 16);
					binToOffset(offset);
					tempinstruction.immediate_value= binToInt(offset);

				}
				else if (opCode == "0101"){
					tempinstruction.Name = "BREAK";
					if (startBreak == false)
						startBreak = true;
				}
				else if (opCode == "0110"){
					tempinstruction.Name = "SW";
					tempinstruction.rs = binToInt(str.substr(6, 5));
					tempinstruction.rt = binToInt(str.substr(11, 5));
					tempinstruction.immediate_value = binToInt(str.substr(16, 16));
				}
				else if (opCode == "0111"){
					tempinstruction.Name = "LW";
					tempinstruction.rs = binToInt(str.substr(6, 5));
					tempinstruction.rt = binToInt(str.substr(11, 5));
					tempinstruction.immediate_value = binToInt(str.substr(16, 16));
				}
			}
			else if (twobit == "01"){
				tempinstruction.category2 = true;
				std::string opCode = str.substr(12, 4);
				tempinstruction.rs = binToInt(str.substr(2, 5));
				tempinstruction.rt = binToInt(str.substr(7, 5));
				tempinstruction.rd = binToInt(str.substr(16, 5));			
				if (opCode == "0000"){
					tempinstruction.Name = "ADD";
				}
				else if (opCode == "0001"){
					tempinstruction.Name = "SUB";
				}
				else if (opCode == "0010"){
					tempinstruction.Name = "MUL";
				}
				else if (opCode == "0011"){
					tempinstruction.Name = "AND";
				}
				else if (opCode == "0100"){
					tempinstruction.Name = "OR";
				}
				else if (opCode == "0101"){
					tempinstruction.Name = "XOR";
				}
				else if (opCode == "0110"){
					tempinstruction.Name = "NOR";
				}
			}
			else if (twobit == "10"){
				tempinstruction.category3 = true;
				tempinstruction.rs = binToInt(str.substr(2, 5));
				tempinstruction.rt = binToInt(str.substr(7, 5));
				tempinstruction.immediate_value = binToInt(str.substr(16, 16));

				std::string opCode = str.substr(12, 4);
				if (opCode == "0000"){
					tempinstruction.Name = "ADDI";
				}
				else if (opCode == "0001"){
					tempinstruction.Name = "ANDI";
				}
				else if (opCode == "0010"){
					tempinstruction.Name = "ORI";
				}
				else if (opCode == "0011"){
					tempinstruction.Name = "XORI";
				}
			}
			tempinstruction.PC = PC;
			inst.push_back(tempinstruction);
			
			clearInstruction(tempinstruction);

		}
		int instsize(){
			return inst.size();
		}
		std::string printInstruction(int i){
			std::stringstream ss;
			if (inst[i].category2 == true)
			{
				ss << inst[i].Binary << "\t" << inst[i].PC << "\t" << inst[i].Name << " R" << inst[i].rd << ", R" << inst[i].rs << ", R" << inst[i].rt << "\n";
			}
			else if (inst[i].category3 == true)
				ss << inst[i].Binary << "\t" << inst[i].PC << "\t" << inst[i].Name << " R" << inst[i].rt << ", R" << inst[i].rs << ", #" << inst[i].immediate_value << "\n";
			else{
				if (inst[i].Name == "BREAK"){
					ss << inst[i].Binary << "\t" << inst[i].PC << "\t" << inst[i].Name << "\n";
				}
				else if (inst[i].Name == "J")
					ss << inst[i].Binary << "\t" << inst[i].PC << "\t" << inst[i].Name << " #" << inst[i].immediate_value << "\n";
				else if (inst[i].Name == "BGTZ")
					ss << inst[i].Binary << "\t" << inst[i].PC << "\t" << inst[i].Name << " R" << inst[i].rs << ", #" << inst[i].immediate_value << "\n";
				else if (inst[i].Name == "BEQ")
					ss << inst[i].Binary << "\t" << inst[i].PC << "\t" << inst[i].Name << " R" << inst[i].rs << ", R" << inst[i].rt << ", #" << inst[i].immediate_value << "\n";
				else{
					ss << inst[i].Binary << "\t" << inst[i].PC << "\t" << inst[i].Name << " R" << inst[i].rt << ", " << inst[i].immediate_value << "(R" << inst[i].rs << ")" << "\n";
				}
			}
			return ss.str();
		}
		std::string returnName(int i){
			return inst[i].Name;
		}
		int returnRS(int i){
			return inst[i].rs;
		}
		int returnRT(int i){
			return inst[i].rt;
		}
		int returnRD(int i){
			return inst[i].rd;
		}
		int returnImmediate(int i){
			return inst[i].immediate_value;
		}
		instruction returnInstruction(int i){
			return inst[i];
		}
};

class Values{
private: std::vector<Data> Dat;
		 Data tempdata;
		 void clearData(Data& tempdata){
			 std::string Binary = "";
			 int PC = 0;
			 int theData = 0;
		 }
public:	 void computeValues(std::string str, int PC){
			 tempdata.Binary = str.substr(0,32);
			 tempdata.PC = PC;
			 tempdata.theData = binToInt(str.substr(0,32));
			 Dat.push_back(tempdata);
			 clearData(tempdata);
		 }
		 int datasize(){
			 return Dat.size();
		 }
		 std::string printData(int i){
			 std::stringstream ss;
			 ss << Dat[i].Binary << "\t" << Dat[i].PC << "\t" << Dat[i].theData << "\n";
			 return ss.str();

		 }
		 int returnPC(int i){
			 return Dat[i].PC;
		 }
		 int& returnValue(int i){
			 return Dat[i].theData;
		 }
};
class Analysis{
	Instructions instructions;
	Values values;
	int PC = 128;
	int Reg[32];
	bool startBreak = false;
	std::ifstream input;
	std::ofstream output;
	std::string tempstring;
public:		Analysis(){
				for (int i = 0; i < 32; i++){
					Reg[i] = 0;
				}
			}

			void assemble(std::string inputname){
				input.open(inputname);
				while (!input.eof()){
					std::getline(input, tempstring);
					if (startBreak == false)
						instructions.computeValues(tempstring, startBreak, PC);
					else
						values.computeValues(tempstring, PC);
					PC = PC + 4;
				}
				input.close();
			}
			void disassemble(std::string outputname){
				output.open(outputname);
				for (int i = 0; i < instructions.instsize(); i++){
					output << instructions.printInstruction(i);
				}
				for (int i = 0; i < values.datasize(); i++){
					output << values.printData(i);
				}
				output.close();
				output.flush();
			}
			std::string printCycle(int j, instruction tempinst){
				std::stringstream ss;
				std::stringstream superstr;
				std::string instname;
				if (tempinst.category2 == true)
				{
					ss << tempinst.Name << " R" << tempinst.rd << ", R" << tempinst.rs << ", R" << tempinst.rt << "\n";
				}
				else if (tempinst.category3 == true)
					ss  << tempinst.Name << " R" << tempinst.rt << ", R" << tempinst.rs << ", #" << tempinst.immediate_value << "\n";
				else{
					if (tempinst.Name == "BREAK"){
						ss << tempinst.Name << "\n";
					}
					else if (tempinst.Name == "J")
						ss << tempinst.Name << " #" << tempinst.immediate_value << "\n";
					else if (tempinst.Name == "BGTZ")
						ss << tempinst.Name << " R" << tempinst.rs << ", #" << tempinst.immediate_value << "\n";
					else if (tempinst.Name == "BEQ")
						ss  << tempinst.Name << " R" << tempinst.rs << ", R" << tempinst.rt << ", #" << tempinst.immediate_value << "\n";
					else{
						ss << tempinst.Name << " R" << tempinst.rt << ", " << tempinst.immediate_value << "(R" << tempinst.rs << ")" << "\n";
					}

				}
				instname = ss.str();
				superstr << "--------------------\n" <<
					"Cycle:" << j << " " << tempinst.PC << "\t" << instname << "\n" <<
					"Registers\n" <<
					"R00:\t" << Reg[0] << "\t" << Reg[1] << "\t" << Reg[2] << "\t" << Reg[3] << "\t" << Reg[4] << "\t" << Reg[5] << "\t" << Reg[6] << "\t" << Reg[7] << "\n" <<
					"R08:\t" << Reg[8] << "\t" << Reg[9] << "\t" << Reg[10] << "\t" << Reg[11] << "\t" << Reg[12] << "\t" << Reg[13] << "\t" << Reg[14] << "\t" << Reg[15] << "\n" <<
					"R16:\t" << Reg[16] << "\t" << Reg[17] << "\t" << Reg[18] << "\t" << Reg[19] << "\t" << Reg[20] << "\t" << Reg[21] << "\t" << Reg[22] << "\t" << Reg[23] << "\n" <<
					"R24:\t" << Reg[24] << "\t" << Reg[25] << "\t" << Reg[26] << "\t" << Reg[27] << "\t" << Reg[28] << "\t" << Reg[29] << "\t" << Reg[30] << "\t" << Reg[31] << "\n\n" <<
					"Data\n";
				for (int i = 0; i < values.datasize(); i++){
					if (i % 8 == 0)
						superstr << values.returnPC(i) << ":\t";
					superstr << values.returnValue(i) << "\t";
					if (i % 8 == 7)
						superstr << "\n";
				}
				superstr << "\n";
				return superstr.str();
			}
			void interpret(std::string simulator){
				int cycle = 0;
				output.open(simulator);
				for (int i = 128; i < values.returnPC(0); i = i + 4){
					bool wasJ = false;
					std::string readName = instructions.returnName(PCToIndex(i));
					if (readName == "J"){
						cycle++;
						output << printCycle(cycle, instructions.returnInstruction(PCToIndex(i)));
						i = instructions.returnImmediate(PCToIndex(i)) - 4;
						wasJ = true;
					}
					else if (readName == "BEQ"){
						if (Reg[instructions.returnRS(PCToIndex(i))] == Reg[instructions.returnRT(PCToIndex(i))]){
							cycle++;
							output << printCycle(cycle, instructions.returnInstruction(PCToIndex(i)));		
							i = i+  instructions.returnImmediate(PCToIndex(i));
							wasJ = true;
						}
					}
					else if (readName == "BGTZ"){
						if (Reg[instructions.returnRS(PCToIndex(i))] > 0){
							cycle++;
							output << printCycle(cycle, instructions.returnInstruction(PCToIndex(i)));		
							i = i+  instructions.returnImmediate(PCToIndex(i));
							wasJ = true;
						}
					}
					else if (readName == "SW"){
						values.returnValue(PCToIndex(Reg[instructions.returnRS(PCToIndex(i))] + instructions.returnImmediate(PCToIndex(i)) + 128 - values.returnPC(0))) = Reg[instructions.returnRT(PCToIndex(i))];
					}
					else if (readName == "LW"){
						Reg[instructions.returnRT(PCToIndex(i))] = values.returnValue(PCToIndex(Reg[instructions.returnRS(PCToIndex(i))] + instructions.returnImmediate(PCToIndex(i)) + 128 - values.returnPC(0)));
					}
					else if (readName == "ADD"){
						Reg[instructions.returnRD(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] + Reg[instructions.returnRT(PCToIndex(i))];
					}
					else if (readName == "SUB"){
						Reg[instructions.returnRD(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] - Reg[instructions.returnRT(PCToIndex(i))];
					}
					else if (readName == "MUL"){
						Reg[instructions.returnRD(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] * Reg[instructions.returnRT(PCToIndex(i))];
					}
					else if (readName == "AND"){
						Reg[instructions.returnRD(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] & Reg[instructions.returnRT(PCToIndex(i))];
					}
					else if (readName == "OR"){
						Reg[instructions.returnRD(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] | Reg[instructions.returnRT(PCToIndex(i))];
					}
					else if (readName == "XOR"){
						Reg[instructions.returnRD(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] ^ Reg[instructions.returnRT(PCToIndex(i))];
					}
					else if (readName == "NOR"){
						Reg[instructions.returnRD(PCToIndex(i))] = ~(Reg[instructions.returnRS(PCToIndex(i))] | Reg[instructions.returnRT(PCToIndex(i))]);
					}
					else if (readName == "ADDI"){
						Reg[instructions.returnRT(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] + instructions.returnImmediate(PCToIndex(i));
					}
					else if (readName == "ANDI"){
						Reg[instructions.returnRT(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] & instructions.returnImmediate(PCToIndex(i));
					}
					else if (readName == "ORI"){
						Reg[instructions.returnRT(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] | instructions.returnImmediate(PCToIndex(i));
					}
					else if (readName == "XORI"){
						Reg[instructions.returnRT(PCToIndex(i))] = Reg[instructions.returnRS(PCToIndex(i))] ^ instructions.returnImmediate(PCToIndex(i));
					}
					else if (readName == "BREAK"){

					}
					
					if (wasJ == false){
						cycle++;
						output << printCycle(cycle, instructions.returnInstruction(PCToIndex(i)));
					}	
				}
				output.close();
			}

};
int main(int argc, char*argv[]){
	Analysis analyze;
	std::string inputname;
	std::cout << argv[1];
	if (argc == 2)
		inputname = std::string(argv[1]);
	else
		std::cin >> inputname;
	analyze.assemble(inputname);
	analyze.disassemble("disassembly.txt");
	analyze.interpret("simulation.txt");
	return 0;
}
