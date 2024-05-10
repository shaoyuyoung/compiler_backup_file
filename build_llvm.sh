#wget https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.1/llvm-project-16.0.1.src.tar.xz
cp -r llvm-project-16.0.1.src/ llvm/
#tar xvf llvm-project-16.0.1.src.tar.xz
sudo mkdir -p /usr/local/llvm
sudo mkdir -p llvm/build
cd llvm/build
cmake -G "Ninja" \
      -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt" \
      -DLLVM_TARGETS_TO_BUILD="X86" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DCMAKE_INSTALL_PREFIX="/usr/local/llvm"\
       ../llvm
cmake --build . -j$(nproc)
cmake --build . --target install
