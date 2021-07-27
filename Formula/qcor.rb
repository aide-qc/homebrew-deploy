class Qcor < Formula
  desc "Quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "dc20a64131ef841ed6b3b46f4bce2b4a2bfb59012402b31b3d7ed7577ec8b4a2"
  license "BSD-3"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "808c9f255fcfbe986945fc4d7bf23d4ca1315a47f677f9d40c88202cf682f7e9"
    sha256 mojave: "f6bb138abec969782b7f2faa922b3f20844b8c615632a981c0e968b0a44ce3d4"
    sha256 x86_64_linux: "7a8de08f8f6c7c0a69323112c9c22d5d609949d499448e4a7b68da7fae2640d2"
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
