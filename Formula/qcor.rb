class Qcor < Formula
  desc "Quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "2f85f1cc5f1bb9d767729cba9bda6431e2e8ab1360ca53a307a6c9e2a35f5ec6"
  license "BSD-3"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "c8f5ebc177846f63c660c01988292d762f887b42d23c5857ac08194c056797c2"
    sha256 mojave: "877d46f04bf43baed3f74f7e269087c34327a958543387909d961696d8e52bb6"
    sha256 x86_64_linux: "1c42e405f080a521b2e8a1a4f9d7a31ba6a6b357f5b786671ba7d050ce0b7e36"
  end

  depends_on "llvm-csp"
  depends_on "xacc"

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DLLVM_ROOT=#{HOMEBREW_PREFIX}/opt/llvm-csp
    ]

    if OS.mac?
      args += %w[
        -DQCOR_EXTRA_HEADERS="/Library/Developer/CommandLineTools/usr/include/c++/v1;/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
      ]
    end

    qcorpath = buildpath
    mkdir qcorpath/"build" do
      system "cmake", "..", *(std_cmake_args + args)
      system "cmake", "--build", ".", "--target", "install"
      system "#{prefix}/bin/qcor", "-rebuild-pch", "-v"
    end
  end
end
