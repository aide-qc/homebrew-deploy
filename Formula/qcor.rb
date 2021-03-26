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
    sha256 "37efd4a4c8b10442c19d6f5735e4a21919fa8e8d55ed9b412b1c1b799cd7348f" => :mojave
    sha256 "4484b44ac70be135a377fbdd75e926a284ecfb848c937bc42d9bd53bc64b95dc" => :catalina
    sha256 "ad7621823162aeccd80d9ac5a9f1ea28f539579c97ff5897a7899102d48b3cea" => :x86_64_linux
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
