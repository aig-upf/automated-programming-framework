#include<bits/stdc++.h>

using namespace std;

string route="config/jair17/performance/";
string config[ 5 ] = { "gripper", "reverse", "summatory", "blocks" , "list" };
int maxid[ 5 ] = { 2, 2, 24, 120, 720 };

string planner = "FD"; // FD or BFWS
string mainp = "main"; // main or main_nir

int main(){
	ofstream ofs("runPerformanceJair17.sh");
	for( int idx = 0; idx < 5; idx++ ){
		for( int id = 0; id < maxid[ idx ]; id++ ){
			ofs << "echo \'" << config[ idx ] << " " << id << "\'" << endl;
			ofs << "./" << mainp << " " << route << config[ idx ] << id << ".txt > experiments/jair17/performance/" << config[ idx ] << "/output" << planner << id << ".log 2> experiments/jair17/performance/" << config[ idx ] << "/output" << planner << id << ".err" << endl;
			ofs << "mv execution.txt experiments/jair17/performance/" << config[ idx ] << "/execution" << planner << id << ".txt" << endl;
			ofs << "mv program.txt experiments/jair17/performance/" << config[ idx ] << "/program" << planner << id << ".txt" << endl << endl;
		}
	}
}
