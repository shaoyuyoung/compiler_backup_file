git clone --recursive https://github.com/apache/tvm tvm
#rm -rf tvm
#cp -r tvm-backup/ tvm/
cd tvm
patch -p1 < ../coverage.patch
mkdir -p build && cd build
echo "We use LLVM Sanitizers. Please ensure Your LLVM version is llvm-config-16"
cp ../cmake/config.cmake .
cmake .. -DCMAKE_BUILD_TYPE=Release \
         -DCMAKE_CXX_COMPILER=$(which clang++) \
         -DCMAKE_C_COMPILER=$(which clang) \
         -DFETCHCONTENT_QUIET=0
make -j$(nproc)
cd ..
echo "processed"
