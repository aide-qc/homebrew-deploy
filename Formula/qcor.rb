class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "37d6e63d89dd339aa14b6cc9072abe51a176c0e3c75cc104094811100fd5b703"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "77d7bb61275b22a3f0a9dc7c5a9c8730dc54175c053b48e12ff22cc91c337164" => :mojave
    sha256 "a5ea70f5954be52f99cfc92fe7ac07e09a84a9161d85dfbd578e7c5904f63f68" => :catalina
    sha256 "c8f1d5d382b89e1cd95f23cdc84ba6549e09539ed962dc62c3f29a5cdef358d4" => :x86_64_linux
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DLLVM_ROOT=#{HOMEBREW_PREFIX}/opt/llvm-csp 
    ]

    if OS.mac?
      args += %W[
        -DQCOR_EXTRA_HEADERS="/Library/Developer/CommandLineTools/usr/include/c++/v1;/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
      ]
    end
    
    qcorpath = buildpath
    mkdir qcorpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end
end
