# AUTOMATED PROGRAMMING FRAMEWORK 

[![Build Status](https://travis-ci.com/aig-upf/automated-programming-framework-private.svg?token=YZEDNRdpev2j6HyQBmza&branch=master)](https://travis-ci.com/aig-upf/automated-programming-framework-private) [![DOI](https://zenodo.org/badge/81231791.svg)](https://zenodo.org/badge/latestdoi/81231791)

=================================

The Automated Programming Framework (APF) is a tool to generate compilations to PDDL such that off-the-shelf classical planners can compute solutions from which we can induce programs or controllers. This is a framework that covers several publications in generalized planning (see [references](#references)), so it includes different compilations in the same code that can be called with configuration files.

1. [Installation](#installation)
    1. [Requirements](#requirements)
    1. [Repository Compilation](#compilation)
1. [Usage](#usage)
	1. [Automated programming compilation](#apcompilation)
	1. [Configuration files](#configfiles)
1. [Tools](#tools)
	1. [Planners](#planners)
	1. [Universal PDDL parser](#uniparser)
	1. [Universal planning validator](#unival)
1. [References](#references)
1. [Citing the framework](#citing)

# <a name="installation"></a>INSTALLATION
This repository has been compiled, executed and tested in Ubuntu 16.04 LTS.

## <a name="requirements"></a>REQUIREMENTS
Run the following commands or check that you already have the required libraries:
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install scons g++ bison flexc++ g++-multilib
```

## <a name="compilation"></a>REPOSITORY COMPILATION
Run ```scons``` in the main folder. It compiles:
- the repository,
- Fast-Downward,
- UNIVERSAL-PDDL-PARSER, 
- and UNIVERSAL-PLANNING-VALIDATOR.

# <a name="usage"></a>USAGE
Once the repository is compilled, we run the code with the following command:
```
./main config/[path]/conf_file.txt
```
The main uses configuration files to parse inputs, solutions and call multiple times to classical planners including previous knowledge. It executes the following steps:
1. Parses the configuration file.
1. It calls the compiler and generates a domain and instance in PDDL.
1. It runs a classical planner with the compiled domain and instance.
1. If the compilation is in validation mode we only check a plan is found (in other words, the program is valid in the given instance). Otherwise we parse the program found and include it as previous knowledge in the initial state of the next compiler call. We loop back to 2. until there are no more problems to program or validate.
1. Finally, it produces a set of files with the domain, instance, plan and program (only in programming mode) at each step.

## <a name="apcompilation"/> AUTOMATED PROGRAMMING COMPILATION
In case you only want to generate a compiled domain and instance from a set of planning instances in PDDL, you can run the compiler directly with the following command:
```
./bin/compile <compiler-type> <original-domain.pddl> <#positive-instances> <#negative-instances?> <original-instances.pddl> <max-bound> <current-bound> <current-procedure> <#stack-predicates> <predicate-names> <#stack-objects> <object-names> <stack-size> <programming-mode> <#variables> <#slots> <#classes> > domain.pddl 2> ins.pddl
```

In each argument we must specify a set of strings, a set of files or integers. In the next list we provide more details of how to fill each argument:

* ```<compiler-type>```: it is a string, and it is used to select the generalized plan representation:
	* ```PLPR``` : planning programs with procedures.
	* ```HFSC``` : hierarchical finite state controllers.
	* ```CFG``` : context-free grammars.
	* ```NEG``` : programs with positive and negative examples.
* ```<original-domain.pddl>``` : it is a string with the original classical domain, ```domains/[path]/domain.pddl```
* ```<#positive-instances>``` : it is an integer with the number of positive instances (if the compilation is not ```NEG```, then it is the total number of instances).
* ```<#negative-instances?>``` : only include this integer with the total amount of negative instances if the compilation is ```NEG```.
* ```<original-instances.pddl>``` : add one instance after the other with the following scheme, ```domains/[path]/[instance-name].pddl```
* ```<max-bound>``` : it is an integer with the max number of lines or controller states for the whole set of procedures or controllers.
* ```<current-bound>``` : it is an integer with the current number of lines or controller states for the whole set of procedures or controllers. Whether there is only one procedure or controller, this value is the same as ```<max-bound>```.
* ```<current-procedure>``` : it is an integer with the current procedure. It starts counting from 0, so the first call is always 0.
* ```<#stack-predicates>``` : it is an integer with the number of stackable predicates. By default set this value to 0, and only specify a number if you allow local variables in the procedures or controllers.
* ```<predicate-names>``` : by default this must be empty, only add all the predicate names splitted by whitespaces if ```<#stack-predicates>``` is greater than 0. 
* ```<#stack-objects>``` : it is an integer with the number of stackable objects. By default set this value to 0, and only specify a number if you allow local variables in the procedures or controllers.
* ```<object-names>``` : by default this must be empty, only add all the object names splitted by whitespaces if ```<#stack-objects>``` is greater than 0. 
* ```<stack-size>``` : in order to simulate a stack in planning we need to specify its size. At least, it must be 1 but it must be greater if you want to do recursion or to call previous knowledge.
* ```<programming-mode>``` : set this value to 1 if you want to synthesize a program, otherwise set this value to 0 and it will just validate your generalized plan in the given instance.
* ```<#variables>``` : by default this integer is 0. It is only greater than 0 for synthesizing or validating programs with high-level state features. It indicates the number of variables we can use as conditions in the conditional gotos.
* ```<#slots>``` : by default this integer is 0. It is only greater than 0 for synthesizing or validating programs with high-level state features. It indicates the number of slots in each conditional goto.
* ```<#classes>``` : by default this integer is 0. It is only greater than 0 for unsupervised classification of planning instances. It also receives the name of clusters.

The standard output of the compiler generates the domain.pddl while the error output is for the instance or ins.pddl.


## <a name="configfiles"/> CONFIGURATION FILES
Configuration files are mainly used to call multiple times to the compiler. It is structured as follows:

```
<compiler-type>
bin/compile
<original-domain.pddl>
domain.pddl ins.pddl
<#procedures>
<current-bound> <time-bound> <#positive-instances> <#negative-instances?> <original-instances.pddl>
...
<#instances> <time-bound> <original-instances.pddl>
<#stack-predicates> <predicate-names>
<#object-predicates> <object-names>
<stack-size> <validation-stack-size>
<#variables> <#slots> <#classes>
```

Just as a remainder, only assign a positive integer to ```<#negative-instances?>``` if the ```<compiler-type>``` is ```NEG```. 
In addition to previous descriptions in automated programming compilation section we only define the differences:

* ```<#procedures>``` : the total amount of procedures counting from 0, i.e. if we only have one main procedure this value is 0 but if we have one main and four extra procedures this value would be 4.
* ```<time-bound>``` : is the maximum allowed time, a classical planner has to find a solution, if it does not find one the solution will be considered TIME-EXCEEDED.
* ```<validation-stack-size>``` : in some cases, validation instances are bigger than the ones used for synthesizing programs. Thus if they use recursivity, i.e. DFS in a binary tree to visit all nodes, we have to increase this parameter for the correct validation, otherwise it will produce an STACK-OVERFLOW failure.

We show a configuration file example of *Triangular Sum* problem, with just one main and a validation instance.

```
PLPR
bin/compile
domains/variables/domain.pddl
domain.pddl ins.pddl
0
3 10 2 domains/variables/sumatory/sumatory2.pddl domains/variables/sumatory/sumatory3.pddl
1 60 domains/variables/sumatory/sumatory21.pddl
0
0
1 1
0 0 0
```

Now we show another configuration file example with the problem of visiting all nodes in a *Binary Tree*, with the particularity that requires local variables (or stackable fluents).

```
PLPR
bin/compile
domains/other/trees/domain_alt.pddl
domain.pddl ins.pddl
0
6 200 1 domains/other/trees/prob7_alt.pddl
1 10 domains/other/trees/prob20_alt.pddl
1
ASSIGNMENT
1
VARIABLE
4 20
0 0 0
```

Navigate in the ```config/``` folder for more examples.

# <a name="tools"></a>TOOLS
## <a name="planners"></a>PLANNERS
We include a copy of different planning systems with classical planners that are used for our experiments. In case you need an updated version of the systems, delete the current planning system folder and add in PLANNERS/ the newer version.

### <a name="fd"></a>Fast-Downward
- It is compiled when you run scons in the main folder.
- There are few required libraries like bison, flex, g++ and python
- For more information go to the [planning system webpage](http://www.fast-downward.org/)

### <a name="lapkt"></a>LAPKT
- There are some planners that run on LAPKT framework, i.e. BFS or BrFS
- It requires to set up your environment before compiling any planner, so follow up the instructions in the [planning system webpage](http://lapkt.org/index.php)


## <a name="uniparser"></a>UNIVERSAL PDDL PARSER
The universal PDDL parser is included in the repository and is compiled when you run scons in the main directory. You can delete the current folder and clone a newer version from [https://github.com/aig-upf/universal-pddl-parser](https://github.com/aig-upf/universal-pddl-parser)

## <a name="unival"></a>UNIVERSAL PLANNING VALIDATOR
This repository can be downloaded from [https://github.com/aig-upf/universal-planning-validator](https://github.com/aig-upf/universal-planning-validator), it is compiled when you run scons and it is used to validate programs with control flow. It validates by default a classical planning domain, instance and plan, but it can also be used to validate a program on the original classical domain and instance.


# <a name="references"></a>REFERENCES

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2016a), [Generalized planning with procedural domain control knowledge](https://www.researchgate.net/publication/332274286_Generalized_Planning_with_Procedural_Domain_Control_Knowledge), ICAPS 2016.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2016b), [Hierarchical finite state controllers for generalized planning](https://www.researchgate.net/publication/332274348_Hierarchical_Finite_State_Controllers_for_Generalized_Planning), IJCAI 2016.

* Lotinac, D., Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2016), [Automatic generation of high-level state features for generalized planning](https://www.researchgate.net/publication/332274202_Automatic_Generation_of_High-Level_State_Features_for_Generalized_Planning), IJCAI 2016.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2017a), [Unsupervised classification of planning instances](https://www.researchgate.net/publication/332274103_Unsupervised_Classification_of_Planning_Instances), ICAPS 2017.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2017b), [Generating context-free grammars using classical planning](https://www.researchgate.net/publication/318830140_Generating_Context-Free_Grammars_using_Classical_Planning), IJCAI 2017.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2018), [Computing hierarchical finite state controllers with classical planning](https://www.researchgate.net/publication/327202698_Computing_Hierarchical_Finite_State_Controllers_With_Classical_Planning), JAIR 2018.

* Segovia-Aguas, J. (2018), [Program Synthesis for Generalized Planning](https://www.tdx.cat/bitstream/handle/10803/663753/tjsa.pdf), PhD Dissertation.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2019), [Computing programs for generalized planning using a classical planner](https://www.researchgate.net/publication/330744528_Computing_programs_for_generalized_planning_using_a_classical_planner), AIJ 2019.

* Jiménez, S., Segovia-Aguas, J., and Jonsson, A. (2019), [A review of generalized planning](https://www.researchgate.net/publication/331683822_A_review_of_generalized_planning), KER 2019

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2020) Generalized Planning with Positive and Negative Examples (to be published), AAAI 2020



# <a name="citing"></a>CITING THE FRAMEWORK
```
@misc{automated-programming-framework,
   title = {Automated Programming Framework},
   author = {Javier Segovia-Aguas},
   howpublished = {\url{https://zenodo.org/record/3820077#.XrlA9C2Q1QI}},
   year = {2017},
   note = {DOI: 10.5281/zenodo.3820077}
}
```
