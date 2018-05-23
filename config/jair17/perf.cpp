#include<bits/stdc++.h>

using namespace std;

#define MAX_DOMAINS 4

string routes[ MAX_DOMAINS ]={
	"hfsc/summatory/domain.pddl", "generics/generic-list/domain.pddl", "hfsc/blocks/domain_cl.pddl", "generics/generic-dfs/domain.pddl"
};

string domains[ MAX_DOMAINS ]={
	"summatory", "list", "blocks", "dfs"
};

int procedures[ MAX_DOMAINS ] = {
	0, 0, 0, 0
};

int states[ MAX_DOMAINS ] = {
	2, 2, 3, 3
};

int t[ MAX_DOMAINS ] = {
	20, 10, 20, 1500
};

int inst[ MAX_DOMAINS ] = {
	4, 6, 5, 4
};

vector< vector< string> > instances;

int nPred[ MAX_DOMAINS ] = { 0, 0, 0, 1 }; 
string stPred[ MAX_DOMAINS ][ 1 ] = { { "" }, { "" }, { "" }, { "ASSIGNMENT" } }; 
int nVar[ MAX_DOMAINS ] = { 0, 0, 0, 1 };
string stVar[ MAX_DOMAINS ][ 1 ] = { { "" }, { "" }, { "" }, { "VARIABLE" } };
int stBound[ MAX_DOMAINS ] = { 1, 1, 1, 4 };

int main(){
	instances.resize( MAX_DOMAINS );
	instances[ 0 ].push_back("domains/hfsc/summatory/prob3.pddl");
	instances[ 0 ].push_back("domains/hfsc/summatory/prob2.pddl");
	instances[ 0 ].push_back("domains/hfsc/summatory/prob1.pddl");
	instances[ 0 ].push_back("domains/hfsc/summatory/prob0.pddl");
	instances[ 1 ].push_back("domains/generics/generic-list/list123.pddl");
	instances[ 1 ].push_back("domains/generics/generic-list/list132.pddl");
	instances[ 1 ].push_back("domains/generics/generic-list/list213.pddl");
	instances[ 1 ].push_back("domains/generics/generic-list/list231.pddl");
	instances[ 1 ].push_back("domains/generics/generic-list/list312.pddl");
	instances[ 1 ].push_back("domains/generics/generic-list/list321.pddl");
	instances[ 2 ].push_back("domains/hfsc/blocks/prob2.pddl"); 
	instances[ 2 ].push_back("domains/hfsc/blocks/prob2b.pddl");
	instances[ 2 ].push_back("domains/hfsc/blocks/prob2c.pddl");
	instances[ 2 ].push_back("domains/hfsc/blocks/prob3.pddl");
	instances[ 2 ].push_back("domains/hfsc/blocks/prob3b.pddl");
	instances[ 3 ].push_back("domains/generics/generic-dfs/trees5.pddl"); 
	instances[ 3 ].push_back("domains/generics/generic-dfs/trees5b.pddl");
	instances[ 3 ].push_back("domains/generics/generic-dfs/trees5c.pddl");
	instances[ 3 ].push_back("domains/generics/generic-dfs/trees5d.pddl");
   
	for( int idx = 0; idx < MAX_DOMAINS; idx++ ){
		vector< string > vs;
		for( int i = 0; i < inst[ idx ]; i++ )
			vs.push_back( instances[ idx ][ i ] );
		sort( vs.begin(), vs.end() );
		string d = domains[ idx ];
		if( d != "blocks" ) continue;
		int id = -1;
		do{	id++;
			if( !( ( id > 95 && id < 109 ) || ( id > 53&& id < 72 )|| ( id > 41&& id < 49 )|| ( id > 29 && id < 36 ) ) ) continue;
			ofstream ofs( "performance/" + d + to_string( id ) + ".txt" );
			ofs << "HFSC\nbin/compile\ndomains/"<< routes[ idx ] << "\ndomain.pddl ins.pddl" << endl;
			ofs << procedures[ idx ] << endl;
			ofs << states[ idx ] << " " << (10*t[ idx ]) << " " << inst[ idx ];
			for( string s : vs ) ofs << " " << s; ofs << endl << 0 << endl;
			ofs << nPred[ idx ];
			if( nPred[ idx ] )
				for( string s : stPred[ idx ] ) ofs << " " << s;
			ofs << " " << nVar[ idx ];
			if( nVar[ idx ] )
				for( string s : stVar[ idx ] ) ofs << " " << s;
			ofs << endl;
			ofs << stBound[ idx ] << " " << stBound[ idx ] << " 0 0 0" << endl;
			//id++;
		}while( next_permutation( vs.begin(), vs.end() ) );
		
	}
}
