
// bin/compile_variable domains/excel/domain.pddl 3 domains/excel/copy01.pddl domains/excel/copy02.pddl domains/excel/fill01.pddl 1 INPUT

#include "include.h"

StringVec files;
StringVec vars;
StringVec types;
StringVec type_preds;
std::map< int, int > varmap;
parser::pddl::CondVec conditionals;

parser::pddl::Domain * d;
parser::pddl::Domain * cd;

bool contains( const StringVec & vec, const String & str ) {
	for ( unsigned i = 0; i < vec.size(); ++i )
		if ( vec[i] == str ) return true;
	return false;
}

StringVec modifyPars( const IntVec & vec, IntVec & ixs, const IntSet & pres = IntSet() ) {
	StringVec pars;
	for ( unsigned i = 0; i < vec.size(); ++i ) {
		std::map< int, int >::iterator j = varmap.find( vec[i] );
		// HACK: ONLY INCLUDE FIRST OCCURRENCE OF TYPE!
		if ( j != varmap.end() && !contains( pars, types[j->second] ) ) {
			ixs.push_back( i );
			pars.push_back( types[j->second] );
		}
		else pars.push_back( d->types[vec[i]]->name );
	}
	return pars;
}

void conds( parser::pddl::Condition * cond, IntSet & out ) {
	parser::pddl::And * a = dynamic_cast< parser::pddl::And * >( cond );
	for ( unsigned i = 0; a && i < a->conds.size(); ++i )
		conds( a->conds[i], out );
	parser::pddl::Exists * e = dynamic_cast< parser::pddl::Exists * >( cond );
	if ( e ) conds( e->cond, out );
	parser::pddl::Forall * f = dynamic_cast< parser::pddl::Forall * >( cond );
	if ( f ) conds( f->cond, out );
	parser::pddl::Ground * g = dynamic_cast< parser::pddl::Ground * >( cond );
	if ( g ) out.insert( g->params.begin(), g->params.end() );
	parser::pddl::Not * n = dynamic_cast< parser::pddl::Not * >( cond );
	if ( n ) conds( n->cond, out );
	parser::pddl::Or * o = dynamic_cast< parser::pddl::Or * >( cond );
	if ( o ) {
		conds( o->first, out );
		conds( o->second, out );
	}
	parser::pddl::When * w = dynamic_cast< parser::pddl::When * >( cond );
	if ( w ) {
		conds( w->pars, out );
		conds( w->cond, out );
	}
}

void processPrecon( const String & name, parser::pddl::Condition * cond, const IntVec & vec, bool b ) {
	parser::pddl::And * a = dynamic_cast< parser::pddl::And * >( cond );
	for ( unsigned i = 0; a && i < a->conds.size(); ++i )
		processPrecon( name, a->conds[i], vec, b );
	parser::pddl::Not * n = dynamic_cast< parser::pddl::Not * >( cond );
	if ( n ) processPrecon( name, n->cond, vec, true );
	parser::pddl::Ground * g = dynamic_cast< parser::pddl::Ground * >( cond );
	if ( g ) {
		bool z = 1;
		for ( unsigned i = 0; i < g->params.size(); ++i )
			for ( unsigned j = 0; j < vec.size(); ++j )
				z &= g->params[i] != vec[j];

		if ( z ) cd->addPre( b, name, g->name, g->params );
		else if ( b ) conditionals.push_back( new parser::pddl::Not( g ) );
		else conditionals.push_back( g );
	}
}

parser::pddl::Condition * insertedCond( parser::pddl::Condition * cond, const IntVec & pars, const IntVec & vec, int off ) {
	parser::pddl::And * a = dynamic_cast< parser::pddl::And * >( cond );
	if ( a ) {
		parser::pddl::And * out = new parser::pddl::And;
		for ( unsigned i = 0; i < a->conds.size(); ++i )
			out->conds.push_back( insertedCond( a->conds[i], pars, vec, off ) );
		return out;
	}
	parser::pddl::Ground * g = dynamic_cast< parser::pddl::Ground * >( cond );
	if ( g ) {
		IntVec newPars;
		for ( unsigned i = 0; i < g->params.size(); ++i ) {
			IntVec::const_iterator j = std::find( vec.begin(), vec.end(), g->params[i] );
			if ( j != vec.end() )
				newPars.push_back( pars.size() + off + ( j - vec.begin() ) );
			else newPars.push_back( g->params[i] );
		}
		return cd->ground( g->name, newPars );
	}
	parser::pddl::Not * n = dynamic_cast< parser::pddl::Not * >( cond );
	if ( n ) return new parser::pddl::Not( ( parser::pddl::Ground * )insertedCond( n->cond, pars, vec, off ) );
	parser::pddl::Or * o = dynamic_cast< parser::pddl::Or * >( cond );
	if ( o ) {
		parser::pddl::Or * out = new parser::pddl::Or;
		out->first = insertedCond( o->first, pars, vec, off );
		out->second = insertedCond( o->second, pars, vec, off );
		return out;
	}
	return new parser::pddl::Ground;
}

parser::pddl::Condition * modifiedCond( parser::pddl::Condition * cond, const IntVec & pars, const IntVec & vec ) {
	parser::pddl::And * a = dynamic_cast< parser::pddl::And * >( cond );
	if ( a ) {
		parser::pddl::And * out = new parser::pddl::And;
		for ( unsigned i = 0; i < a->conds.size(); ++i ) {
			IntSet effs;
			conds( a->conds[i], effs );

			IntVec res;
			for ( unsigned i = 0; i < vec.size(); ++i )
				if ( effs.find( vec[i] ) != effs.end() )
					res.push_back( vec[i] );

			if ( res.size() ) out->conds.push_back( modifiedCond( a->conds[i], pars, res ) );
			else out->conds.push_back( a->conds[i]->copy( *cd ) );
		}
		return out;
	}
	parser::pddl::Exists * e = dynamic_cast< parser::pddl::Exists * >( cond );
	if ( e ) {
		parser::pddl::Exists * out = new parser::pddl::Exists;
		out->params = e->params;
		out->cond = insertedCond( e->cond, pars, vec, e->params.size() );

		for ( unsigned i = 0; i < vec.size(); ++i ) {
			IntVec newPars( 1, vec[i] );
			newPars.push_back( pars.size() + out->params.size() );

			out->params.push_back( pars[vec[i]] );
			( ( parser::pddl::And * )out->cond )->conds.push_back( cd->ground( type_preds[varmap[pars[vec[i]]]], newPars ) );
		}
		return out;
	}
	parser::pddl::Forall * f = dynamic_cast< parser::pddl::Forall * >( cond );
	if ( f ) {
		parser::pddl::Forall * out = new parser::pddl::Forall;
		out->params = f->params;

		if ( vec.size() ) {
			parser::pddl::When * when = new parser::pddl::When;
			parser::pddl::When * w = dynamic_cast< parser::pddl::When * >( f->cond );
			if ( w ) {
				when->pars = insertedCond( w->pars, pars, vec, f->params.size() );
				when->cond = insertedCond( w->cond, pars, vec, f->params.size() );
			}
			else {
				when->pars = new parser::pddl::And;
				when->cond = insertedCond( f->cond, pars, vec, f->params.size() );
			}

			for ( unsigned i = 0; i < vec.size(); ++i ) {
				IntVec newPars( 1, vec[i] );
				newPars.push_back( pars.size() + out->params.size() );

				out->params.push_back( pars[vec[i]] );
				( ( parser::pddl::And * )when->pars )->conds.push_back( cd->ground( type_preds[varmap[pars[vec[i]]]], newPars ) );
			}

			out->cond = when;
		}
		else out->cond = insertedCond( f->cond, pars, vec, f->params.size() );
		return out;
	}
	parser::pddl::Ground * g = dynamic_cast< parser::pddl::Ground * >( cond );
	parser::pddl::Not * n = dynamic_cast< parser::pddl::Not * >( cond );
	parser::pddl::Or * o = dynamic_cast< parser::pddl::Or * >( cond );
	if ( g || n || o ) {
		parser::pddl::Forall * out = new parser::pddl::Forall;
		parser::pddl::When * when = new parser::pddl::When;
		when->pars = new parser::pddl::And;
		for ( unsigned i = 0; i < vec.size(); ++i ) {
			IntVec newPars( 1, vec[i] );
			newPars.push_back( pars.size() + out->params.size() );

			out->params.push_back( pars[vec[i]] );
			( ( parser::pddl::And * )when->pars )->conds.push_back( cd->ground( type_preds[varmap[pars[vec[i]]]], newPars ) );
		}
		for ( unsigned i = 0; i < conditionals.size(); ++i )
			( ( parser::pddl::And * )when->pars )->conds.emplace_back( insertedCond( conditionals[i], pars, vec, 0 ) );

		when->cond = insertedCond( cond, pars, vec, 0 );

		out->cond = when;
		return out;
	}
	//When * w = dynamic_cast< When * >( cond );
	//if ( w ) {}
	return new parser::pddl::Ground;
}

int main( int argc, char *argv[] ) {
	if ( argc < 6 ) {
		std::cout << "Usage: ./bin/compile_variable <domain.pddl> <num of tasks> <task\\s.pddl> <num of vars> <var1> <var2> ...\n";
		std::cout << "Writes new domain file and task files as \'X_variable.pddl\'\n";
		exit( 1 );
	}

	d = new parser::pddl::Domain( argv[1] );

	unsigned nfiles, nvars;

	std::stringstream ss( argv[2] );
	ss >> nfiles;

	for ( unsigned i = 0; i < nfiles; ++i )
		files.push_back( argv[3 + i] );

	ss.clear();
	ss.str( argv[3 + nfiles] );
	ss >> nvars;

	for ( unsigned i = 0; i < nvars; ++i ) {
		vars.push_back( argv[4 + nfiles + i] );
		varmap[d->types.index( vars[i] )] = i;
	}

	// create new domain

	cd = new parser::pddl::Domain;
	cd->name = d->name;
	cd->condeffects = d->condeffects;
	cd->typed = d->typed;
	cd->cons = d->cons;
	cd->costs = d->costs;

	cd->setTypes( d->copyTypes() );
	for ( unsigned i = 0; i < vars.size(); ++i ) {
		types.push_back( vars[i] + "-VARIABLE" );
		cd->createType( types[i] );
	}

	for ( unsigned i = 0; i < d->preds.size(); ++i ) {
		IntVec vec;
		StringVec pars = d->typeList( d->preds[i] );
		if ( 0 <= d->derived.index( d->preds[i]->name ) )
			pars = modifyPars( d->preds[i]->params, vec );
		cd->createPredicate( d->preds[i]->name, pars );
	}

	for ( unsigned i = 0; i < vars.size(); ++i ) {
		type_preds.push_back( vars[i] + "-ASSIGNMENT" );
		StringVec pars( 1, types[i] );
		pars.push_back( vars[i] );
		cd->createPredicate( type_preds[i], pars );
	}

	for ( unsigned i = 0; i < d->actions.size(); ++i ) {
		conditionals.clear();

		IntSet pres;
		conds( d->actions[i]->pre, pres );

		IntVec vec;
		StringVec pars = modifyPars( d->actions[i]->params, vec, pres );
		//std::cout << pres << " " << d->actions[i]->params << " " << vec << " " << pars << "\n";
		parser::pddl::Action * act = cd->createAction( d->actions[i]->name, pars );

		processPrecon( d->actions[i]->name, d->actions[i]->pre, vec, false );

		if ( vec.size() ) act->eff = modifiedCond( d->actions[i]->eff, d->actions[i]->params, vec );
		else cd->setEff( d->actions[i]->name, d->actions[i]->eff );
	}

	for ( unsigned i = 0; i < d->derived.size(); ++i ) {
		IntVec vec;
		parser::pddl::Derived * dv = new parser::pddl::Derived( d->derived[i]->name );
		StringVec pars = modifyPars( d->derived[i]->params, vec );
		for ( unsigned i = 0; i < pars.size(); ++i )
			dv->params.push_back( cd->types.index( pars[i] ) );
		dv->lifted = cd->preds.get( d->derived[i]->name );
		dv->cond = modifiedCond( d->derived[i]->cond, d->derived[i]->params, vec );
		cd->derived.insert( dv );
	}

	std::string dom( argv[1] );
	int ix = dom.find_last_of( '.' );
	dom = dom.substr( 0, ix ) + "_variables.pddl";
	std::ofstream file( dom );
	//cd->PDDLPrint( file );
	cd->print( file );
	file.close();

	for ( unsigned i = 0; i < files.size(); ++i ) {
		parser::pddl::Instance ins( *cd, files[i] );
		for ( unsigned j = 0; j < vars.size(); ++j ) {
			int ix = cd->types.index( vars[j] );
			for ( unsigned k = 0; k < cd->types[ix]->constants.size(); ++k ) {
				StringVec pars( 1, cd->types[ix]->constants[k] + "-VAR" );
				pars.push_back( cd->types[ix]->constants[k] );
				cd->types.get( types[j] )->constants.insert( pars[0] );
				ins.addInit( type_preds[j], pars );
			}
			for ( unsigned k = 0; k < cd->types[ix]->objects.size(); ++k ) {
				StringVec pars( 1, cd->types[ix]->objects[k] + "-VAR" );
				pars.push_back( cd->types[ix]->objects[k] );
				cd->types.get( types[j] )->objects.insert( pars[0] );
				ins.addInit( type_preds[j], pars );
			}
		}

		int ix = files[i].find_last_of( '.' );
		std::ofstream insfile( files[i].substr( 0, ix ) + "_variables.pddl" );
		//ins.PDDLPrint( insfile );
		ins.print( insfile );
		insfile.close();

		for ( unsigned j = 0; j < vars.size(); ++j ) {
			int i1 = cd->types.index( vars[j] );
			int i2 = cd->types.index( types[j] );
			cd->types[i1]->objects.tokens.clear();
			cd->types[i1]->objects.tokenMap.clear();
			cd->types[i2]->constants.tokens.clear();
			cd->types[i2]->constants.tokenMap.clear();
			cd->types[i2]->objects.tokens.clear();
			cd->types[i2]->objects.tokenMap.clear();
		}
	}

	delete cd;
	delete d;
}
