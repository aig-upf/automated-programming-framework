
#pragma once

#include <fstream>
#include <stdexcept>

#include "TokenStruct.h"
#include "Type.h"

namespace parser { namespace pddl {

class Domain;

class ExpectedToken : public std::runtime_error {
public:
	ExpectedToken(const std::string& token) : std::runtime_error(token + " expected") {}
};

class UnknownToken : public std::runtime_error {
public:
	UnknownToken(const std::string& token) : std::runtime_error(token +  " does not name a known token") {}
};

class UnexpectedEOF : public std::runtime_error {
public:
	UnexpectedEOF() : std::runtime_error("Unexpected EOF found") {}
};

class Filereader {

public:

	std::string s;      // current line of file
	std::ifstream f;    // file input stream
	unsigned r, c;      // current row and column of file
  
	Filereader( const std::string & file ) : f( file.c_str() ), r( 1 ), c( 0 ) {
		if (!f) throw std::runtime_error(std::string("Failed to open file '") + file + "'");
		std::getline( f, s );
		next();
	}

	~Filereader() {
		f.close();
	}

	// characters to be ignored
	bool ignore( char c ) {
		return c == ' ' || c == '\t' || c == '\r' || c == '\n' || c == '\f';
	}

	// parenthesis
	bool paren( char c ) {
		return c == '(' || c == ')' || c == '{' || c == '}';
	}

	// current character
	char getChar() {
		return s[c];
	}

	// print line and column
	void printLine() {
		std::cout << "Line " << r << ", column " << c+1 << ": ";
	}

	void tokenExit( const std::string & t ) {
		c -= t.size();
		printLine();
		throw UnknownToken(t);
	}

	// get next non-ignored character
	void next() {
		for ( ; c < s.size() && ignore( s[c] ); ++c );
		while ( c == s.size() || s[c] == ';' ) {
			++r;
			c = 0;
			if ( f.eof() ) {
				printLine();
				throw UnexpectedEOF();
			}
			std::getline( f, s );
			for ( ; c < s.size() && ignore( s[c] ); ++c );
		}
	}

	// get token converted to uppercase
	std::string getToken() {
		std::ostringstream os;
		while ( c < s.size() && !ignore( s[c] ) && !paren( s[c] ) && s[c] != ',' )
			os << ( 97 <= s[c] && s[c] <= 122 ? (char)( s[c++] - 32 ) : s[c++] );
		return os.str();
	}

	// get token converted to uppercase
	// check that the token exists
	template < typename T >
	std::string getToken( const TokenStruct< T > & ts ) {
		std::string t = getToken();
		if ( ts.index( t ) < 0 )
			tokenExit( t );
		return t;
	}

	// assert syntax
	void assert_token( const std::string & t ) {
		unsigned b = 0;
		for ( unsigned k = 0; c + k < s.size() && k < t.size(); ++k )
			b += s[c + k] == t[k] || 
			     ( 97 <= s[c + k] && s[c + k] <= 122 && s[c + k] == t[k] + 32 );
		if ( b < t.size() ) {
			printLine();
			throw ExpectedToken(t);
		}
		c += t.size();
		next();
	}

	// parse the name of a domain or instance
	std::string parseName( const std::string & u ) {
		std::string out;
		std::string t[5] = { "(", "DEFINE", "(", u, ")" };
		for ( unsigned i = 0; i < 5; ++i ) {
			assert_token( t[i] );
			if ( i == 3 ) {
				out = getToken();
				next();
			}
		}
		return out;
	}


	// parse a typed list
	// if check is true, checks that types exist
	TokenStruct< std::string > parseTypedList( bool check, const TokenStruct< Type * > & ts = TokenStruct< Type * >(), const std::string & lt = "" ) {
		unsigned k = 0;
		TokenStruct< std::string > out;
		for ( next(); getChar() != ')' && lt.find( getChar() ) == std::string::npos; next() ) {
			if ( getChar() == '-' ) {
				assert_token( "-" );

				std::string t;
				// check if the type is "EITHER"
				if ( getChar() == '(' ) {
					assert_token( "(" );
					assert_token( "EITHER" );

					t = "( EITHER";
					for ( ; getChar() != ')'; next() ) {
						if ( check ) t += " " + getToken( ts );
						else t += " " + getToken();
					}
					t += " )";
					++c;
				}
				else if ( check ) t = getToken( ts );
				else t = getToken();

				out.types.insert( out.types.end(), out.size() - k, t );
				k = out.size();
			}
			else if ( getChar() == '(' ) {
				assert_token( "(" );
				assert_token( ":PRIVATE" );
				getToken();
				out.append( parseTypedList( check, ts ) );
			}
			else out.insert( getToken() );
		}
		if ( k < out.size() ) out.types.insert( out.types.end(), out.size() - k, check ? "OBJECT" : "" );
		++c;

		return out;
	}

};

} } // namespaces

