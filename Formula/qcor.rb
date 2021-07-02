class Qcor < Formula
  desc "Quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "aa3c55e6af834d1edf8c8466316d26975463c6c7a8b1746a5b7488e5cdef4886"
  license "BSD-3"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "eaf77bc661ec2ec60618466e0f615a23c8eb97d7d7c19d54e6d229d199be88e0"
    sha256 mojave: "98fffa08276e99bf9d39250af1cab726b8fc4971a2e1881f69fdefc9088c5bef"
    sha256 x86_64_linux: "c87b091f9b6f08939065ab874fc7669e977defb9e4bc3f65194396c6bd530aaa"
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
