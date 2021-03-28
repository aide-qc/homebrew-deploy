class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "c625dbfd32a17e021aa2539fa5d2e6dbedc1f8b6e5cfb6298dbd0e194721edf6"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "1941be1a390b8f415fcf74e20044018257ff10223538533f8448fa23c8742073" => :mojave
    sha256 "97775e7f7676fb9faf0d99457bd318ead151c48564538184e32d1a93de5a7e5a" => :catalina
    sha256 "7f627a947d99b4c532cfef4ac2b8b2ca3972ac3ca7ff43c1a956a5b613b1f2ef" => :x86_64_linux
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
