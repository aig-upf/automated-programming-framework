AUTOMATED PROGRAMMING FRAMEWORK
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
- and UNIVERSAL-PDDL-PARSER.

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
./bin/compile <compiler-type> <original-domain.pddl> <#positive-instances> <original-instances.pddl> <max-bound> <current-bound> <current-procedure> <#stack-predicates> <predicate-names> <#stack-objects> <object-names> <stack-size> <programming-mode> <#variables> <#slots> <#classes> > domain.pddl 2> ins.pddl
```

In each argument we must specify a set of strings, a set of files or integers. In the next list we provide more details of how to fill each argument:

* ```<compiler-type>```: it is a string, and it is used to select the generalized plan representation:
	* ```PLPR``` : planning programs with procedures.
	* ```HFSC``` : hierarchical finite state controllers.
	* ```CFG``` : context-free grammars.
* ```<original-domain.pddl>``` : it is a string with the original classical domain, ```domains/[path]/domain.pddl```
* ```<#positive-instances>``` : it is an integer with the number of positive instances.
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
<current-bound> <time-bound> <#positive-instances> <original-instances.pddl>
...
<#instances> <time-bound> <original-instances.pddl>
<#stack-predicates> <predicate-names>
<#object-predicates> <object-names>
<stack-size> <validation-stack-size>
<#variables> <#slots> <#classes>
```

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


# <a name="references"></a>REFERENCES

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2016a), [Generalized planning with procedural domain control knowledge](http://www.dtic.upf.edu/~jonsson/icaps16a.pdf), ICAPS 2016.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2016b), [Hierarchical finite state controllers for generalized planning](https://ijcai.org/Proceedings/16/Papers/458.pdf), IJCAI 2016.

* Lotinac, D., Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2016), [Automatic generation of high-level state features for generalized planning](https://ijcai.org/Proceedings/16/Papers/453.pdf), IJCAI 2016.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2017a), [Unsupervised classification of planning instances](http://www.dtic.upf.edu/~jonsson/icaps17.pdf), ICAPS 2017.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2017b), [Generating context-free grammars using classical planning](https://repositori.upf.edu/bitstream/handle/10230/32250/jonsson_ijcai17_gene.pdf), IJCAI 2017.

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2018a), [Computing hierarchical finite state controllers with classical planning](http://users.dsic.upv.es/~serjice/publications/javier-jair18/javier-jair18.pdf), JAIR 2018.

* Jiménez, S., Segovia-Aguas, J., and Jonsson, A. (2018), [A review of generalized planning](http://users.dsic.upv.es/~serjice/publications/sergio-ker18/sergio-ker18.pdf), KER 2018

* Segovia-Aguas, J., Jiménez, S., and Jonsson, A. (2018b), [Computing programs for generalized planning using a classical planner](), AIJ 2018.


# <a name="citing"></a>CITING THE FRAMEWORK
```
@misc{automated-programming-framework,
   title = {Automated Programming Framework},
   author = {Javier Segovia-Aguas},
   howpublished = {\url{https://github.com/aig-upf/automated-programming-framework}},
   year = {2017},
   note = {Accessed: 2018-05-23}
}
```
