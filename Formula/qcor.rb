class Qcor < Formula
  desc "Quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "fe368d550b9fa1e7a9e2e5f25c64f7c18b779b9adcf36beb3d36ecac4c6cbb07"
  license "BSD-3"

  bottle do
    root_url "https://github.com/aide-qc/aide-qc/releases/download/0.0.1"
    sha256 catalina: "046f47f9a21c826287717bce42d75b1b5239c364f3d88c7e1f46d99c30b5064e"
    sha256 mojave: "67b355e009c292edf16d209bc5bbf68dbedef926b547eae275ac1641e77edeea"
    sha256 x86_64_linux: "903ab57e2f0009990633ad91eabbb4581e2d6d490b4faca05e9424f809523538"
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
