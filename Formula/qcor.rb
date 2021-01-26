class Qcor < Formula
  desc "quantum-classical c++ compiler"
  homepage "https://github.com/ornl-qci/qcor"
  url "https://github.com/ornl-qci/qcor/tarball/master"
  version "1.0.0"
  sha256 "779ce11ac36ee10d63910e5230401ebf8ff5b51f4a37de994f08eb6e6156c097"
  license "BSD-3"

  depends_on "llvm-csp"
  depends_on "xacc"

  bottle do
    root_url "https://dl.bintray.com/amccaskey/qci-homebrew-bintray"
    sha256 "2ba112b2ba58b9eb1803c8f90aa1fa4e42c4712be4417ff3b5b50259df7ec316" => :mojave
    sha256 "800eb059731444b5b4313447f4d51b507256c88e8dc0797d1e1ac656d1b9943c" => :catalina
    sha256 "7c20baa4d0fe9353df9686a9d90383de9cd7b8a48192d93be2dafaeed48d6d3e" => :x86_64_linux
  end

  def install
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DXACC_DIR=#{HOMEBREW_PREFIX}/opt/xacc
      -DLLVM_ROOT=#{HOMEBREW_PREFIX}/opt/llvm-csp 
    ]

    if OS.mac?
      args += %W[
        -DQCOR_EXTRA_HEADERS="/Library/Developer/CommandLineTools/usr/include/c++/v1"
      ]
    end
    
    qcorpath = buildpath
    mkdir qcorpath/"build" do
       system "cmake", "..", *(std_cmake_args + args)
       system "cmake", "--build", ".", "--target", "install"
    end
  end
end
