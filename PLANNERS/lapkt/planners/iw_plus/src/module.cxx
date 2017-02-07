#include <rp_iw_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( librpiw )
{
	class_<RPIW_Planner>("RPIW_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &RPIW_Planner::add_atom )
		.def( "add_action", &RPIW_Planner::add_action )
		.def( "add_mutex_group", &RPIW_Planner::add_mutex_group )
		.def( "num_atoms", &RPIW_Planner::n_atoms )
		.def( "num_actions", &RPIW_Planner::n_actions )
		.def( "get_atom_name", &RPIW_Planner::get_atom_name )
		.def( "get_domain_name", &RPIW_Planner::get_domain_name )
		.def( "get_problem_name", &RPIW_Planner::get_problem_name )
		.def( "add_precondition", &RPIW_Planner::add_precondition )
		.def( "add_effect", &RPIW_Planner::add_effect )
		.def( "add_cond_effect", &RPIW_Planner::add_cond_effect )
		.def( "set_cost", &RPIW_Planner::set_cost )
		.def( "notify_negated_conditions", &RPIW_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &RPIW_Planner::create_negated_fluents )
		.def( "set_init", &RPIW_Planner::set_init )
		.def( "set_goal", &RPIW_Planner::set_goal )
		.def( "set_domain_name", &RPIW_Planner::set_domain_name )
		.def( "set_problem_name", &RPIW_Planner::set_problem_name )
		.def( "write_ground_pddl", &RPIW_Planner::write_ground_pddl )
		.def( "print_action", &RPIW_Planner::print_action )
		.def( "setup", &RPIW_Planner::setup )
		.def( "solve", &RPIW_Planner::solve )
		.def_readwrite( "parsing_time", &RPIW_Planner::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &RPIW_Planner::m_ignore_action_costs )
		.def_readwrite( "iw_bound", &RPIW_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &RPIW_Planner::m_log_filename )
	;
}

