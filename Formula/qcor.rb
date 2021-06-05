class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "5834500507b23f569115db4ba45c986960b5ade6ed209a9f77d21e993dd88030"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "0f1389c92857cbb35dce6325a5fd4fb17117a22f1453f3a3fce56c29d123ece7" => :mojave
    sha256 "d5957bf2980bebfbbf303d5bfe41aa3842a4f54a6e770942d4c1d9e88b6c540c" => :catalina
    sha256 "465f7f187c8bd0cfb4208ff2502b5ea46204af5c433ce7a31ceeb96ca1efea7c" => :x86_64_linux
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
