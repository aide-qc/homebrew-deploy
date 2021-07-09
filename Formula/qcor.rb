class Qcor < Formula
  desc "Quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "238533048233d7ec3e676629ca0a1c67b20f4dfc8afa34c766440d2a0a5e48df"
  license "BSD-3"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "eaf77bc661ec2ec60618466e0f615a23c8eb97d7d7c19d54e6d229d199be88e0"
    sha256 mojave: "98fffa08276e99bf9d39250af1cab726b8fc4971a2e1881f69fdefc9088c5bef"
    sha256 x86_64_linux: "d3a3b643fee37d9b9eba02433d7f99e9ebf3e01cfea31ba5f2c6e7e7274d9f85"
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
    end
  end
end
