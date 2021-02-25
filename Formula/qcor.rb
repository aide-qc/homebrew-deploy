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
    sha256 "eecb74c36d8cf45c1cb49e9686a41b81520771b95e88c50e44a1144181d30f22" => :mojave
<<<<<<< HEAD
<<<<<<< HEAD
    sha256 "385d40063574e4a3ee7ae5d1035cd2bee8d1d3b3ad9b4270dafdbe725a8bdc25" => :catalina
    sha256 "e2f8d438a7078948d3db1f0c5eaac5ddaa362a4248d52a377e7156e3b0608f04" => :x86_64_linux
=======
=======
>>>>>>> 334d5ca5cc4f623609d6b503ac952c4462abc804
    sha256 "385d40063574e4a3ee7ae5d1035cd2bee8d1d3b3ad9b4270dafdbe725a8bdc25" => :catalina
    sha256 "e2f8d438a7078948d3db1f0c5eaac5ddaa362a4248d52a377e7156e3b0608f04" => :x86_64_linux
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
