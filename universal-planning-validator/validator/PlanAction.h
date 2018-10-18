#pragma once

#include <validator/State.h>

using namespace parser::pddl;

typedef std::pair< std::string, StringVec > GroundedObj;
typedef std::vector< GroundedObj > GroundedObjVec;

typedef struct FunctionModifierObj {
    std::string fname;
    StringVec fparams;
    double changedValue;

    FunctionModifierObj( const std::string& name, StringVec& params, double value )
        : fname( name ), fparams( params ), changedValue( value ) {}
} FunctionModifierObj;

typedef std::vector< FunctionModifierObj > FunctionModifierObjVec;

class PlanAction {
public:
    std::string name;
    StringVec params;

    PlanAction( const std::string& name, const StringVec& params );

    bool holds( State * s, Domain * d );

    void apply( State * s, Domain * d, Instance * ins );

    std::string getActionName() const;

    friend std::ostream& operator<<( std::ostream& os, const PlanAction& pa ) {
        return pa.print( os );
    }

    virtual std::ostream& print( std::ostream& stream ) const {
        stream << getActionName() << '\n';
        return stream;
    }

protected:
    void applyRec( State * s, Domain * d, Instance * ins, Condition * c, GroundedObjVec& addList, GroundedObjVec& deleteList, FunctionModifierObjVec& funcList );

    void forallApplyRec( const StringVec& forallParams, unsigned paramIndex, State * s, Domain * d, Instance * ins, Condition * c, GroundedObjVec& addList, GroundedObjVec& deleteList, FunctionModifierObjVec& funcList );

    void applyDeleteList( State * s, const GroundedObjVec& deleteList ) const;

    void applyAddList( State * s, const GroundedObjVec& addList ) const;

    void applyFuncList( State * s, const FunctionModifierObjVec& funcList ) const;

    void showFunctionValueUpdateMsg( State * s, const FunctionModifierObj& fmo ) const;
};

std::string getGroundedObjectStr( const GroundedObj& go );
std::string getFunctionModifierObjectStr( const FunctionModifierObj& fmo );
