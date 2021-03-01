class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "8f4f93bebbfb94ef436d73dfbcc836895ed7ffa4640c0d75c72598d031c6e375"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "5793ab15a28f0df938243424cd6d72093666679b39e2c5b6e1f23db6b2d3cc5c" => :mojave
<<<<<<< HEAD
    sha256 "385d40063574e4a3ee7ae5d1035cd2bee8d1d3b3ad9b4270dafdbe725a8bdc25" => :catalina
    sha256 "c96609e18c8bf503c8d3dfee4a3517f53b6631eff8c85dd7345b6b15ecdba6ac" => :x86_64_linux
=======
    sha256 "385d40063574e4a3ee7ae5d1035cd2bee8d1d3b3ad9b4270dafdbe725a8bdc25" => :catalina
    sha256 "b8aaf91c5bb9c57df0c4f13ec285cd589801301ba84ec1383ccc40c42b0c899e" => :x86_64_linux
>>>>>>> 6253fe235cb05f1a710da8a70ab6cddddec71f1b
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
