#include "include.h"

class DomainCreator{
	public:
	DomainCreator(){}
	static parser::pddl::Domain* create( String& name, bool condeffects = true, bool typed = true, bool cons = true, bool costs = true){
		parser::pddl::Domain* nd = new parser::pddl::Domain;
		nd->name = name;
		nd->condeffects = condeffects;
		nd->typed = typed;
		nd->cons = cons;
		nd->costs = costs;
		return nd;
	}
};
