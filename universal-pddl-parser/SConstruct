import os, glob, sys

pkgpath = os.environ.get( "PKG_CONFIG_PATH", "" )
os.environ["PKG_CONFIG_PATH"] = pkgpath

paths = [
	"./",
	"testenv/",
	"tests/",
]

mains = [
	"./Domain.cpp",
	"examples/compileSHE.cpp",
	"examples/serialize.cpp",
	"testenv/TestsRunner.cpp",
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
	]
)

domain = env.Program( "Domain",
	sources + ["./Domain.cpp"]
)

TPSHE = env.Program( "examples/compileSHE",
	sources + ["examples/compileSHE.cpp"]
)

serialize = env.Program( "examples/serialize",
	sources + ["examples/serialize.cpp"]
)

alltests = env.Program( "AllTests",
	sources + ["testenv/TestsRunner.cpp"]
)

runtest = env.Command( "AllTests.passed", alltests, "valgrind -q --leak-check=yes ./AllTests" )

env.Default( domain )
env.AlwaysBuild( domain )

env.Depends( TPSHE, domain )
env.Alias( 'TPSHE', TPSHE )

env.Depends( serialize, domain )
env.Alias( 'serial', serialize )

env.Depends( runtest, domain )
env.Alias( 'tests', runtest )
