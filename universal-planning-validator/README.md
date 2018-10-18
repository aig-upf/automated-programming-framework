# Universal Planning Validator
Software that can be used to validate (still unfinished):
* Classical planning problems.
* Planning programs.

In the future we plan to add support for multiagent and temporal planning problems.

## Installation

You must first clone the [Universal PDDL Parser](https://github.com/aig-upf/universal-pddl-parser):

```
git clone https://github.com/aig-upf/universal-pddl-parser.git
```

Follow the instructions in that repository to build the software. Then, clone
this repository next to the Universal PDDL Parser (alternatively, set the `PDDL_PARSER_PATH`
environment variable to the parser path):

```
git clone https://github.com/aig-upf/universal-planning-validator.git
```

Finally, build the content of the validator by doing the following:

```
cd universal-planning-validator
scons
```

Once the software is built, you can run the tests to check that the validator
is running:

```
./tests/test.bin
```

## Running the validator

Currently, the software is used as follows:

```
./validate [options] <domain.pddl> <task.pddl> <plan>
```

where the possible options are:

* `-h` to show help.
* `-c` to specify that the input is a classical planning problem.
* `-p` to specify that the input is a planning program.
* `-v` to print verbose information while validating (added and deleted fluents).
