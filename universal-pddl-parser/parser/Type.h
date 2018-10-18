
#pragma once

#include "TokenStruct.h"

namespace parser { namespace pddl {

class Type;

typedef std::vector< Type * > TypeVec;

class Type {

public:

	std::string name;
	TypeVec subtypes;
	Type * supertype;

	TokenStruct< std::string > constants;
	TokenStruct< std::string > objects;

	Type()
		: supertype( 0 ) {}

	Type( const std::string & s )
		: name( s ), supertype( 0 ) {}

	Type( const Type * t )
		: name( t->name ), supertype( 0 ), constants( t->constants ), objects( t->objects ) {}

	virtual ~Type() {
	}

	virtual std::string getName() const {
		return name;
	}

	void insertSubtype( Type * t ) {
		subtypes.push_back( t );
		t->supertype = this;
	}

	void copySubtypes( Type * t, const TokenStruct< Type * > & ts ) {
		for ( unsigned i = 0; i < t->subtypes.size(); ++i )
			subtypes.push_back( ts.get( t->subtypes[i]->name ) );
	}

	void print( std::ostream & stream ) const {
		stream << name;
		if ( supertype ) stream << "[" << supertype->name << "]";
		stream << "\n";
	}

	virtual void PDDLPrint( std::ostream & s ) const {
		s << "\t" << name;
		if ( supertype ) s << " - " << supertype->name;
		s << "\n";
	}

	std::pair< bool, int > parseConstant( const std::string & object ) {
		int k = 0;

		int i = constants.index( object );
		if ( i < 0 ) k += constants.size();
		else return std::make_pair( true, -1 - i );

		for ( unsigned i = 0; i < subtypes.size(); ++i ) {
			std::pair< bool, int > p = subtypes[i]->parseConstant( object );
			if ( p.first ) return std::make_pair( true, - k + p.second );
			else k += p.second;
		}

		return std::make_pair( false, k );
	}

	std::pair< bool, unsigned > parseObject( const std::string & object ) {
		unsigned k = 0;

		int i = objects.index( object );
		if ( i < 0 ) k += objects.size();
		else return std::make_pair( true, i );

		for ( unsigned i = 0; i < subtypes.size(); ++i ) {
			std::pair< bool, unsigned > p = subtypes[i]->parseObject( object );
			if ( p.first ) return std::make_pair( true, k + p.second );
			else k += p.second;
		}

		return std::make_pair( false, k );
	}

	std::pair< std::string, int > object( int index ) {
		if ( index < 0 ) {
			if ( -index <= (int)constants.size() ) return std::make_pair( constants[-1 - index], 0 );
			else index += constants.size();
		}
		else {
			if ( index < (int)objects.size() ) return std::make_pair( objects[index], 0 );
			else index -= objects.size();
		}

		for ( unsigned i = 0; i < subtypes.size(); ++i ) {
			std::pair< std::string, int > p = subtypes[i]->object( index );
			if ( p.first.size() ) return p;
			else index = p.second;
		}

		return std::make_pair( "", index );
	}

	unsigned noObjects() {
		unsigned total = objects.size() + constants.size();
		for ( unsigned i = 0; i < subtypes.size(); ++i )
			total += subtypes[i]->noObjects();
		return total;
	}

	unsigned noConstants() {
		unsigned total = constants.size();
		for ( unsigned i = 0; i < subtypes.size(); ++i ) {
			total += subtypes[i]->noConstants();
		}
		return total;
	}

	virtual Type * copy() {
		return new Type( this );
	}

};

inline std::ostream & operator<<( std::ostream & stream, const Type * t ) {
	t->print( stream );
	return stream;
}

} } // namespaces
