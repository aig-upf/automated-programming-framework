
# Universal PDDL Parser [![Build Status](https://travis-ci.org/aig-upf/universal-pddl-parser.svg?branch=master)](https://travis-ci.org/aig-upf/universal-pddl-parser)

An algorithm for parsing any planning problem in PDDL format.

1. [Features](#features)
1. [Project Structure](#project-structure)
1. [Installation](#installation)
1. [Related Projects](#related-projects)

## <a name="features"></a>Features

The Universal PDDL Parser provides limited support for creating PDDL domains:

- creating types
- creating constants
- adding predicates
- adding functions
- adding actions
- adding preconditions and effects of actions
- adding objects
- adding initial and goal states

However, more complicated constructs (such as `forall` and `when`) currently have to be implemented manually. These classes include a method `PDDLPrint` for printing the resulting domains in PDDL format.

## <a name="project-structure"></a>Project Structure

* `parser` contains the main source code.
* The build script leaves the compiled object file in `build`, the library files in `lib`
* `tests` contains a number of tests
* `script` contains certain scripts useful for automated testing and continuous integration
* `domains` contains some sample domains

## <a name="installation"></a>Installation

Firstly, download this project. You can alternatively clone it using the following command:

```
git clone https://github.com/aig-upf/universal-pddl-parser.git
```

Then, open the project folder and compile it using `scons`:

```
cd universal-pddl-parser
scons
```

You can also run `scons tests`, which builds a binary that executes a series of automated tests on actual planning domains. To run the tests binary from the project folder do:

```
./tests/test.bin
```

Finally, you can also compile a simple program using the Universal PDDL Parser. This program reads a PDDL domain and a PDDL instance, parses them and writes them on screen. You can compile the example using the command `scons examples`. Then, run the example from the project folder as follows:

```
./examples/parser/parser.bin <domain> <instance>
```

For example, we can use the program in the Logistics domain:

```
./examples/parser/parser.bin domains/Log_dom.pddl domains/Log_ins.pddl
```

## <a name="related-projects"></a>Related Projects

The [Universal PDDL Parser Multiagent](https://github.com/aig-upf/universal-pddl-parser-multiagent) repository extends the Universal PDDL Parser to allow parsing multiagent domains. Besides, it also provides tools for solving multiagent problems as classical planning problems.

The [Temporal Planning](https://github.com/aig-upf/temporal-planning) repository contains tools that use the Universal PDDL Parser to parse temporal planning problems expressed using PDDL.
