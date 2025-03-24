gcc_major_version=14
export PATH=$(brew --prefix gcc@$gcc_major_version)/bin:$PATH
export CC=$(brew --prefix gcc@$gcc_major_version)/bin/gcc-$gcc_major_version
export CXX=$(brew --prefix gcc@$gcc_major_version)/bin/g++-$gcc_major_version

export CMAKE_CXX_COMPILER_ID=GNU
export CMAKE_C_COMPILER=$CC
export CMAKE_CXX_COMPILER=$CXX

alias gcc=$CC
alias g++=$CXX

# Hack/workaround
# Make sure that mpi (installed from conda) uses GNU and not clang
# also I have copied g++-13/gcc-13 as arm64-apple-darwin20.0.0-clang(++)
alias arm64-apple-darwin20.0.0-clang=$CC
alias arm64-apple-darwin20.0.0-clang++=$CXX
