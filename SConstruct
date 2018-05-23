import os, glob, sys

pkgpath = os.environ.get( "PKG_CONFIG_PATH", "" )
os.environ["PKG_CONFIG_PATH"] = pkgpath

dirfile = "universal-pddl-parser/"

paths = [
	"src/",
	dirfile,
]

mains = [
	"src/compile.cpp",
	"src/compile_variable.cpp",
	"main.cpp",
	"main_nir.cpp",
	"main_performance.cpp",
	dirfile + "Domain.cpp",
]

sources = []
for path in paths :
	sources += [
		item
		for item in glob.glob( path + "*.cpp" )
		if item not in mains
	]

env = Environment( tools=["default"] )

def print_cmd_line( commandline, target, source, env ) :
	sys.stdout.write( "\033[33m%s\033[0m\n"%commandline )
	sys.stdout.flush()

env['PRINT_CMD_LINE_FUNC'] = print_cmd_line

env.AppendUnique(
	CPPPATH=paths,
	CXXFLAGS=[
		"-Wall",
		"-pedantic",
		"-g",
		"-Wno-long-long",
		"-O3",
		"-std=c++11",
		"-D DEBUG",
	]
)

fastdownward = env.Command( 'fast-downward.out',[], './PLANNERS/fast-downward/src/build_all' )
compile = env.Program( "bin/compile", sources + ["src/compile.cpp"] )
compileVariable = env.Program( "bin/compile_variable", sources + ["src/compile_variable.cpp"] )
main = env.Program( "main", sources + ["main.cpp"] )
main_nir = env.Program( "main_nir", sources + ["main_nir.cpp"] )
main_perf = env.Program( "main_perf", sources + ["main_performance.cpp"] )
uniparser = env.Program("universal-pddl-parser/Domain", sources + ["universal-pddl-parser/Domain.cpp"]  )
#clean = env.Command('src/*.o',[],'rm src/*.o *.o')

env.AlwaysBuild( fastdownward )
env.AlwaysBuild( compile )
env.AlwaysBuild( compileVariable )
env.AlwaysBuild( main )
env.AlwaysBuild( main_nir )
env.AlwaysBuild( main_perf )
env.AlwaysBuild( uniparser )
#env.AlwaysBuild( clean )

