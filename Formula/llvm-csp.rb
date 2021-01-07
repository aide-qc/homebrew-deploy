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
    sha256 "dff4e797e49e9adf43f27f10f608d9c5cc9e3e39f89365ac7840d89a174a1e11" => :mojave
    sha256 "2644b12d74f2cd5dee63bcd7a101cebfd8bbe54c27d83ec69a1e04df2696423a" => :catalina
    sha256 "cced6a717771033bdd31ef77223723ac8be38eefd760cd432390d97e6c5c6c7f" => :x86_64_linux
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

    sdk = MacOS.sdk_path_if_needed
    args << "-DDEFAULT_SYSROOT=#{sdk}" if sdk

    llvmpath = buildpath
    mkdir llvmpath/"build" do
       system "cmake", "../llvm", *(args)
       system "cmake", "--build", ".", "--target", "install"
    end 
  end

end
