class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "14f1f517311474b9fe4c78f98eb345adbb5f7d394bb8b5f19f4e0129e53a1697"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "6160f08238c856fcb2ac9f9e508b4d26222f9f4d7d3f9abca18bc6b1d05628d4" => :mojave
    sha256 "0fb3625a3850c4731473d325244f15d0f8275eb750713575caf28c7142f43cc6" => :catalina
    sha256 "3b38a38b33a41c1c566757f750c7806d2d252ca05d8fa563feb0f201d1c9d9b4" => :x86_64_linux
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DLLVM_ROOT=#{HOMEBREW_PREFIX}/opt/llvm-csp 
    ]

    if OS.mac?
      args += %W[
        -DQCOR_EXTRA_HEADERS="/Library/Developer/CommandLineTools/usr/include/c++/v1;/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
      ]
    end
    
    qcorpath = buildpath
    mkdir qcorpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end
end
