# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LlvmCsp < Formula
  desc "clang syntax handler"
  homepage "https://github.com/hfinkel/llvm-project-csp"
  url "https://github.com/hfinkel/llvm-project-csp/tarball/csplugin"
  version "1.0.0"
  sha256 "2df409617c290ddec870be5c84e21b6c7413f9531e778e6f8555762a951248cf"
  license "Apache 2.0"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "gcc@10" => :build

  bottle do
    root_url "https://github.com/ORNL-QCI/llvm-project-csp/releases/download/1.0.0"
    sha256 "21d0e0c2f70aa6f9816a862cf078e79bf70a4e75b5503d52fe28c43883c50047" => :mojave
    sha256 "6f726d530f734f3a043f966e53d5e68d658c375f46019fb4ad098a740e2647f3" => :catalina
    sha256 "6834b6613ba55f8742ee9b8713e1bfa81d4ed7de0b8bb335509a8ca40fee6b53" => :x86_64_linux
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    args = %W[
      -DBUILD_SHARED_LIBS=ON
      -DCMAKE_BUILD_TYPE=Release
      -DLLVM_TARGETS_TO_BUILD=X86
      -DLLVM_ENABLE_DUMP=ON
      -DLLVM_ENABLE_PROJECTS=clang
      -DCMAKE_CXX_COMPILER=g++-10
      -DCMAKE_C_COMPILER=gcc-10
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -G Ninja
    ]

    llvmpath = buildpath
    mkdir llvmpath/"build" do
       system "cmake", "../llvm", *(args)
       system "cmake", "--build", ".", "--target", "install"
    end 
  end

end
