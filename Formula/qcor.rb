class Qcor < Formula
  desc "Quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "2f85f1cc5f1bb9d767729cba9bda6431e2e8ab1360ca53a307a6c9e2a35f5ec6"
  license "BSD-3"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "7dbac25d4d0a763d18d17f8858ff5510cb3af511775abb3ae3e3929ad852a7c1"
    sha256 mojave: "d853239d54cb5e9eb857b64f6ab37ac620df62159be02993e1c0a84a5e1dbdda"
    sha256 x86_64_linux: "02e0d1c587eb9f1a4e2b54e8034ebebf5442661bdf3593304725ebfe8bb12bb0"
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
