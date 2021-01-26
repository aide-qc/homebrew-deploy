class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "e38f27ab76157483637865675dfdf5e22f6a95ba22839ed5d96a9207450f81c2"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "2ba112b2ba58b9eb1803c8f90aa1fa4e42c4712be4417ff3b5b50259df7ec316" => :mojave
    sha256 "bbdb15bdc2e62b5c79d0583570828098b5ac09b6c03450407dbb043dec00cc7b" => :catalina
    sha256 "7c20baa4d0fe9353df9686a9d90383de9cd7b8a48192d93be2dafaeed48d6d3e" => :x86_64_linux
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DLLVM_ROOT=#{HOMEBREW_PREFIX}/opt/llvm-csp 
    ]

    if OS.mac?
      args += %W[
        -DQCOR_EXTRA_HEADERS="/Library/Developer/CommandLineTools/usr/include/c++/v1"
      ]
    end
    
    qcorpath = buildpath
    mkdir qcorpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end
end
