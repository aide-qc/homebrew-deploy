class Qcor < Formula
  desc "Quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "fe368d550b9fa1e7a9e2e5f25c64f7c18b779b9adcf36beb3d36ecac4c6cbb07"
  license "BSD-3"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "620988e1a17ae01545a278a79d3e222d1dabe9262ef94c8d612de1c6a8012082"
    sha256 mojave: "9de135d9b4775b6e48ff6aa772ebdb497d82ee0c53f65a3f25f472195ae3a925"
    sha256 x86_64_linux: "97d328fe04f63af163c3e63a6b47adec521aae130eb090bedee5b077b898ce03"
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
