class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "a5616ece6e2326260e44b1056727056c328fa49d7ab694f82e9632d79b6db274"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 "bcb73efc65f8e0b9e6607bc8735c5cd1ee86df90a9a4cca56fe3e9fb35966ba4" => :mojave
    sha256 "d8be24715f5b124ecb10e38fb3e79f567da89bb300e010e16a1fdd50f5bedbf7" => :catalina
    sha256 "7ee14ee4b63fe878d1bf7935c4ee3e84591f18137c797e6a3bce3e64cb04bdc5" => :x86_64_linux
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
