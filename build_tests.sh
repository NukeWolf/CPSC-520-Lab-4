toolchain="$1"
source "$toolchain"
cd tests/build
../configure --host=maven
make
../convert
