# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LlvmCsp < Formula
  desc "clang syntax handler"
  homepage "https://github.com/hfinkel/llvm-project-csp"
  url "https://github.com/ornl-qci/llvm-project-csp/tarball/csplugin"
  version "1.0.0"
  sha256 "82647e71d2743d3fcbfd0627b3bb8cd7bd1a8baf83d218691f443ca90b85da40"
  license "Apache 2.0"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "gcc@10" => :build

  bottle do
    root_url "https://github.com/ORNL-QCI/llvm-project-csp/releases/download/1.0.0"
    sha256 "b8b7ddefb66129f65ce68df6cfb3d05dc3215099fa0959fff13880a4ef29c5e9" => :mojave
    sha256 "13878ec5841f054f8620aaf8c9be42ff9e98b6ea5cddc60713aa417a5ce65014" => :catalina
    sha256 "4a7c6a6d207de796f307cdabde51862b656bf535e8e41625db93e9f861672934" => :x86_64_linux
  end

  def install
    projects = %w[
      clang
      mlir
    ]

    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    args = %W[
      -DBUILD_SHARED_LIBS=ON
      -DCMAKE_BUILD_TYPE=Release
      -DLLVM_TARGETS_TO_BUILD=X86
      -DLLVM_ENABLE_DUMP=ON
      -DLLVM_ENABLE_PROJECTS=#{projects.join(";")}
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
