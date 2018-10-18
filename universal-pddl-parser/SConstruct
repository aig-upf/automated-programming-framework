import os
import glob
import sys

def which(program):
	""" Helper function emulating unix 'which' command """
	for path in os.environ["PATH"].split(os.pathsep):
		path = path.strip('"')
		exe_file = os.path.join(path, program)
		if os.path.isfile(exe_file) and os.access(exe_file, os.X_OK):
			return exe_file
	return None

pkgpath = os.environ.get( "PKG_CONFIG_PATH", "" )
os.environ["PKG_CONFIG_PATH"] = pkgpath

src_path = "./parser"

# Read the preferred compiler from the environment - if none specified, choose CLANG if possible
#default_compiler = 'clang++' if which("clang++") else 'g++'
default_compiler = 'g++'
gcc = os.environ.get('CXX', default_compiler)


base = Environment(tools=["default"], CXX=gcc)

include_paths = ['.']

base.AppendUnique(
	CPPPATH = [ os.path.abspath(p) for p in include_paths ],
	CXXFLAGS=[
		"-Wall",
		"-pedantic",
		"-std=c++11",
		"-g"
	]
)


extra = base.Clone()
extra.Append(LIBS=[File(os.path.abspath('./lib/libparser.a'))])

# Register the different examples
SConscript('tests/SConscript', exports='extra')
SConscript('examples/parser/SConscript', exports='extra')

# The compilation of the (static & dynamic) library
build_dirname = 'build'
base.VariantDir(build_dirname, '.')

sources = glob.glob( src_path + "/*.cpp" )
build_files = [build_dirname + '/' + src for src in sources]

shared_lib = base.SharedLibrary('lib/parser', build_files)
static_lib = base.Library('lib/parser', build_files)

# Build both static and dynamic library
base.Default([static_lib, shared_lib])
base.AlwaysBuild([static_lib, shared_lib])

